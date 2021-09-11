# -*- coding: utf-8 -*-
'''
iFlyOS通信库
'''

import cgi
import datetime
import io
import json
import logging
import sys
import threading
import uuid

import requests
from six.moves.urllib.parse import urlencode

from .auth import iFlyOSAuth

try:
    import Queue as queue
except ImportError:
    import queue

import hyper

from global_variables import *
import sdk.configurate
from sdk.auth import TOKEN_URL

from sdk.directive_sequencer_library import DirectiveSequencer

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class iFlyOSStateListner(object):
    '''
    iFlyOS状态监听类
    '''

    def __init__(self):
        pass

    def on_finished(self):
        '''
        处理结束状态回调
        :return:
        '''
        logger.info('[iFlyOS状态]结束')

    def on_speaking(self):
        '''
        播放状态回调
        :return:
        '''
        logger.info('[iFlyOS状态]正在播放........')

    def on_thinking(self):
        '''
        语义理解状态回调
        :return:
        '''
        logger.info('[iFlyOS状态]正在思考.........')

    def on_listening(self):
        '''
        监听状态回调
        :return:
        '''
        logger.info('[iFlyOS状态]正在倾听..........')


class iFlyOS(object):
    '''
    iFlyOS核心模块类，实现功能包括:
        录音数
        本地状态上报
        长链接建立与维护(Ping)
        Directive下发
    '''

    def __init__(self, player):
        '''
        类初始化
        :param player:播放器
        '''
        self.event_queue = queue.Queue()
        self.down_channel_result_queue = queue.Queue()
        self.event_channel_result_queue = queue.Queue()

        self.state_listener = iFlyOSStateListner()

        # self.unparsed_directive and self.error must initialized before self.directive_sequencer
        # because directive sequencer constructor uses them
        self.unparsed_directive = None
        self.error = {'type': '', 'message': ''}

        self.directive_sequencer = DirectiveSequencer(player, self, daemon=False)
        self.put = self.directive_sequencer.put

        self.done = True

        self.requests = requests.Session()

        self._configfile = sdk.configurate.DEFAULT_CONFIG_FILE
        self.__config = sdk.configurate.load()
        self.__config['refresh_url'] = TOKEN_URL

        self.last_activity = datetime.datetime.utcnow()

        self.__ping_time = None

        self._event = threading.Event()

        self._t = None

        self._is_gate_way_test = False

        if callable(self.directive_sequencer.directive_listener):
            self.directive_listener = self.directive_sequencer.directive_listener
        else:
            raise ValueError('directive监听器注册失败[参数不可回调]！')

        self.down_channel_event = threading.Event()

    def start(self):
        '''
        iFlyOS模块启动
        :return:
        '''
        self.done = False
        self._t = threading.Thread(target=self.run)
        self._t.daemon = True
        self._t.start()

    def stop(self):
        '''
        iFlyOS模块停止
        :return:
        '''
        if not self.done:
            self.done = True
            self._t.join()

    # def listen(self):
    #     '''
    #     iFlyOS进入语音识别状态
    #     :return:
    #     '''
    #     self.directive_sequencer.recognize()

    def send_event(self, event, text=None, context=None):
        '''
        状态上报
        :param event:上传状态
        :param text:录音文本
        :param context:上下文对象
        :return:
        '''
        self.event_queue.put((event, text, context))
        logger.debug("event_queue len:" + str(self.event_queue._qsize()))

    def set_last_activity(self, timestamp_in_seconds):
        self.last_activity = datetime.datetime.utcnow() - datetime.timedelta(seconds=timestamp_in_seconds)

    def run(self):
        '''
        iFlyOS线程实体
        :return:
        '''
        while not self.done:
            try:
                self._run()
            except AttributeError as e:
                logger.exception(e)
                continue
            except hyper.http20.exceptions.StreamResetError as e:
                logger.exception(e)
                continue
            except ValueError as e:
                logger.exception(e)
                # failed to get an access token, exit
                sys.exit(1)
            except Exception as e:
                logger.exception(e)
                continue

    def _run(self):
        '''
        run方法实现
        :return:
        '''
        conn = hyper.HTTP20Connection(host=IVS_URL, port=int(IVS_PORT),
                                      force_proto='h2')

        headers = {'authorization': 'Bearer {}'.format(self.token)}

        downchannel_id = conn.request('GET', '/' + API_VERSION + '/directives', headers=headers)
        downchannel_response = conn.get_response(downchannel_id)

        if downchannel_response.status != 200:
            raise ValueError("/directives requests returned {}".format(downchannel_response.status))

        ctype, pdict = cgi.parse_header(downchannel_response.headers['content-type'][0].decode('utf-8'))
        downchannel_boundary = '--{}'.format(pdict['boundary']).encode('utf-8')
        downchannel = conn.streams[downchannel_id]
        downchannel_buffer = io.BytesIO()
        eventchannel_boundary = 'iFlyOS-voice-boundary'

        # ping every 5 minutes (60 seconds early for latency) to maintain the connection
        self.__ping_time = datetime.datetime.utcnow() + datetime.timedelta(seconds=240)

        self._event.set()

        logger.debug("event_queue len:" + str(self.event_queue._qsize()))
        # self.event_queue.queue.clear()

        # self.directive_sequencer.system.synchronize_state()

        while not self.done:
            text = None
            context = None
            try:
                event, text, context = self.event_queue.get(timeout=0.25)
            except queue.Empty:
                event = None
            else:
                logger.debug("event_queue len:" + str(self.event_queue._qsize()))

            # we want to avoid blocking if the data wasn't for stream downchannel
            while conn._sock.can_read:
                conn._single_read()

            while downchannel.data:
                framebytes = downchannel._read_one_frame()
                self.directive_sequencer.read_response_h2(framebytes, downchannel_boundary, downchannel_buffer)

            if event is None:
                self._ping(conn)
                continue

            headers = {
                'authorization': 'Bearer {}'.format(self.token),
                'content-type': 'application/json',
            }

            logger.debug(headers)
            metadata = {}
            metadata['event'] = event
            if text is not None:
                metadata['text'] = text
                logger.info(text)

            if context is not None:
                metadata['context'] = context

            logger.debug(json.dumps(metadata, indent=4))
            json_part = json.dumps(metadata)
            resp = self.post_method_api(EVENT_SERVICE_URL + ":" + EVENT_SERVICE_PORT,
                                        "/events", headers=headers, data=json_part)

            logger.info("status code: %s", resp.status_code)

            if resp.status_code == 200:
                content_type = resp.headers.get('content-type')
                if content_type.find('application/json') >= 0:
                    directives = []
                    resp_body = resp.json()
                    if len(resp_body) > 0:
                        json_payload = resp_body
                        for payload in json_payload:
                            logger.debug(json.dumps(payload, indent=4))
                            if "text" in payload['directive']['payload']:
                                logger.info("text:" + str(payload['directive']['payload']['text']))
                            if "title" in payload['directive']['payload']:
                                logger.info("title:" + str(payload['directive']['payload']['title']))
                            if "textField" in payload['directive']['payload']:
                                logger.info("textField:" + str(payload['directive']['payload']['textField']))
                            if "subtextField" in payload['directive']['payload']:
                                logger.info("subtextField:" + str(payload['directive']['payload']['subtextField']))
                            if 'directive' in payload:
                                directives.append(payload['directive'])
                                self.directive_sequencer._dispatcher(payload['directive'])
                    self.event_channel_result_queue.put((200, directives, None,))
                    logger.debug("event_channel_result_queue len:" + str(self.event_channel_result_queue._qsize()))
            elif resp.status_code == 204:
                self.event_channel_result_queue.put((resp.status_code,))
            else:
                resp_body = None
                if resp.headers.get("content-type").find('application/json') >= 0:
                    resp_body = resp.json()
                    logger.debug("response body:" + str(resp_body))

                self.event_channel_result_queue.put((resp.status_code, [resp_body, ], None))
                logger.warning(resp.headers)
                logger.warning(resp.text)

    def _ping(self, connection):
        '''
        长链接维护,ping操作
        :param connection:链接句柄
        :return:
        '''
        if datetime.datetime.utcnow() >= self.__ping_time:
            # ping_stream_id = connection.request('GET', '/ping',
            #                                     headers={'authorization': 'Bearer {}'.format(self.token)})
            # resp = connection.get_response(ping_stream_id)
            # if resp.status != 200 and resp.status != 204:
            #     logger.warning(resp.read())
            #     raise ValueError("/ping requests returned {}".format(resp.status))

            connection.ping(uuid.uuid4().hex[:8])

            logger.debug('ping at {}'.format(datetime.datetime.utcnow().strftime("%a %b %d %H:%M:%S %Y")))

            # ping every 5 minutes (60 seconds early for latency) to maintain the connection
            self.__ping_time = datetime.datetime.utcnow() + datetime.timedelta(seconds=240)

    def post_method_api(self, base_url, api, params=None, headers=None, data=None):
        if headers is None:
            headers = {}

        if params is None:
            params = {}

        if data is None:
            data = {}

        # headers['User-Agent'] = ("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) ") + (
        #     "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
        headers['Accept'] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"
        # headers['Host'] = base_url[base_url.find('http://') + len('http://'):]
        # headers['Upgrade-Insecure-Requests'] = '1'
        headers['Accept-Language'] = 'en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,ko;q=0.6'
        # headers['Cache-Control'] = 'max-age=0'

        # if len(params) > 0:
        #     self._origin_links.append(api + '?' + urlencode(params))
        # else:
        #     self._origin_links.append(api)
        # logger.debug("origin_links:" + str(self._origin_links))

        r = self.requests.post(base_url + api, params=urlencode(params), headers=headers, data=data,
                               allow_redirects=False)
        #
        # self._resp = r
        # self._resp_code = r.status_code
        # self._resp_headers = r.headers
        #
        # if self._resp_code == 404:
        #     return
        # elif self._resp_code == 302:
        #     self._redirection_link = self._resp_headers.get("location")
        #     logger.debug("redirection_link:" + self._redirection_link)
        # else:
        #     if self._resp_headers.get("content-type").find('application/json') >= 0:
        #         self._resp_body = r.json()
        #         logger.debug("response body:" + str(self._resp_body))
        #     elif self._resp_headers.get('content-type').find('text/html') >= 0:
        #         self._resp_body = r.text
        #         logger.debug("response body:" + self._resp_body)
        #     else:
        #         self._resp_body = r.text
        #         logger.debug("response body:" + self._resp_body)
        return r

    @property
    def token(self):
        '''
        token获取
        :return:
        '''
        auth = iFlyOSAuth(os.path.join(os.path.expanduser('.'), '.iflyos.json'))

        auth.auth_request()
        self.__config = sdk.configurate.load()
        return self.__config['access_token']
