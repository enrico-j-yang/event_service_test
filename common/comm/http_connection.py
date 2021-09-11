# -*- coding: utf-8 -*-
'''
http_connection.py
It defines HTTP connection objects

'''
import datetime
import json
import logging
import requests
from six.moves.urllib.parse import urlencode

import sdk.configurate as configuration
from sdk.auth import iFlyOSAuth

try:
    import Queue as queue
except ImportError:
    import queue

from common.communication_channel import CommunicationChannel
from sdk.directive_sequencer_library import DirectiveSequencer
from framework.player import Player
import sdk.configurate
from global_variables import *

cwd = os.getcwd()


class UnknownResultError(Exception):
    pass


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
        logging.info('[iFlyOS状态]结束')

    def on_speaking(self):
        '''
        播放状态回调
        :return:
        '''
        logging.info('[iFlyOS状态]正在播放........')

    def on_thinking(self):
        '''
        语义理解状态回调
        :return:
        '''
        logging.info('[iFlyOS状态]正在思考.........')

    def on_listening(self):
        '''
        监听状态回调
        :return:
        '''
        logging.info('[iFlyOS状态]正在倾听..........')


class HTTPConnection(CommunicationChannel):
    '''
    HTTPConnection is general test input class
    '''

    _response = None
    directive_queue = None

    def __init__(self, mock_enable=False):
        '''
        constructor of HTTPConnection
        :param mock_enable: True for mock enable, otherwise disable
        '''
        super(HTTPConnection, self).__init__(mock_enable)
        self.mock_enable = mock_enable
        if self.mock_enable:
            logging.debug('HTTPConnection enable')
        else:
            logging.debug('HTTPConnection')
        self._session = requests.Session()
        self._resp = None
        self._resp_code = 0
        self._resp_body = {}
        self._resp_headers = {}
        self._redirection_link = None
        self._origin_links = []

        self.state_listener = iFlyOSStateListner()

        self._configfile = sdk.configurate.DEFAULT_CONFIG_FILE
        self.__config = sdk.configurate.load()
        self.__config['host_url'] = EVENT_SERVICE_URL
        self.__config['host_port'] = EVENT_SERVICE_PORT
        self.__config['refresh_url'] = TOKEN_URL
        # self.unpardsed_directive and self.error must initialized before self.dispatcher
        # because dispatcher constructor uses them
        self.unparsed_directive = None
        self.error = {'type': '', 'message': ''}

        self.directive_queue = queue.Queue()
        self._directive = None
        self.audio_player = Player()
        self.directive_sequencer = DirectiveSequencer(self.audio_player, self, daemon=False)

    def send_event(self, event, text=None):
        headers = {
            'authorization': 'Bearer {}'.format(self.token),
            'content-type': 'application/json',
        }

        logging.debug(headers)
        if text is None:
            metadata = {
                'context': self.directive_sequencer.context,
                'event': event,
            }
        else:
            metadata = {
                'context': self.directive_sequencer.context,
                'event': event,
                'text': text
            }

        logging.debug(metadata)
        json_part = json.dumps(metadata)
        self.post_method_api(EVENT_SERVICE_URL + ":" + EVENT_SERVICE_PORT, "/events", headers=headers, data=json_part)

        logging.info("status code: %s", self._resp.status_code)

        content_type = self._resp.headers.get('content-type')
        directives = []
        if content_type.find('application/json') >= 0 and len(self._resp_body) > 0:
            json_payload = self._resp_body
            for payload in json_payload:
                logging.debug(payload)
                if 'directive' in payload:
                    self.directive_sequencer._dispatcher(payload['directive'])
        elif content_type == 'application/octet-stream':
            pass
        elif content_type == 'plain/text':
            line = self._resp_body
            logging.debug(line)
        else:
            line = self._resp_body
            logging.debug(line)

    def send_query(self):
        headers = {
            'authorization': 'Bearer {}'.format(self.token),
            'content-type': 'application/json',
        }
        params = {
            'device_id': DEVICE_ID,
        }

        logging.debug(params)
        self.get_method_api(EVENT_SERVICE_URL + ":" + EVENT_SERVICE_PORT, "/music_control/state", headers=headers,
                            params=params)

        logging.info("status code: %s", self._resp.status_code)

        content_type = self._resp.headers.get('content-type')
        if content_type.find('application/json') >= 0 and len(self._resp_body) > 0:
            json_payload = self._resp_body
            for payload in json_payload:
                logging.debug(payload)
        elif content_type == 'application/octet-stream':
            pass
        elif content_type == 'plain/text':
            line = self._resp_body
            logging.debug(line)
        else:
            line = self._resp_body
            logging.debug(line)

    def get_result_from_queue(self):
        self._directive = self.directive_queue.get(timeout=1)

    def clear_result_queue(self):
        while not self.directive_queue.empty():
            self.directive_queue.get()

    def get_status_code(self):
        return self._resp_code

    def get_key_value_from_json_body(self, full_key):
        keys = full_key.split('/')
        value = None
        if self._resp_headers.get("content-type").find('application/json') >= 0:
            json_body = self._resp_body
            for key in keys:
                value = json_body[key]
                json_body = value

        return value

    def get_key_values_from_list(self, full_key, key_in_list):
        keys = full_key.split('/')
        list_in_body = None
        value = None
        if self._resp_headers.get("content-type").find('application/json') >= 0:
            json_body = self._resp_body
            for key in keys:
                list_in_body = json_body[key]
                json_body = list_in_body

            for item in list_in_body:
                if value is not None:
                    if item[key_in_list].find(value) < 0:
                        value = None
                        break
                else:
                    value = item[key_in_list]

        return value

    def get_key_value_from_directive(self, full_key):
        keys = full_key.split('/')
        value = None
        if self._resp_headers.get("content-type").find('application/json') >= 0:
            json_body = self._directive
            for key in keys:
                value = json_body[key]
                json_body = value

        return value

    def get_binary_from_queue(self):
        pass

    def get_method_api(self, base_url, api, params=None, headers=None, data=None):
        if headers is None:
            headers = {}

        if params is None:
            params = {}

        if data is None:
            data = {}

        # headers['User-Agent'] = ("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) ") + (
        #     "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
        headers['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8'
        # headers['Host'] = base_url[base_url.find('http://') + len('http://'):]
        # headers['Upgrade-Insecure-Requests'] = '1'
        headers['Accept-Language'] = 'en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,ko;q=0.6'

        if len(params) > 0:
            self._origin_links.append(api + '?' + urlencode(params))
        else:
            self._origin_links.append(api)
        logging.debug("origin_links:" + str(self._origin_links))

        r = self._session.get(base_url + api, params=urlencode(params), headers=headers, data=data,
                              allow_redirects=False)

        self._resp = r
        self._resp_code = r.status_code
        self._resp_headers = r.headers

        if self._resp_code == 404:
            return
        elif self._resp_code == 302:
            self._redirection_link = self._resp_headers.get("location")
            logging.debug("redirection_link:" + self._redirection_link)
        else:
            if self._resp_headers.get("content-type").find('application/json') >= 0:
                self._resp_body = r.json()
                logging.debug("response body:" + str(self._resp_body))
            elif self._resp_headers.get('content-type').find('text/html') >= 0:
                self._resp_body = r.text
                logging.debug("response body:" + self._resp_body)
            else:
                self._resp_body = r.text
                logging.debug("response body:" + self._resp_body)
        return r

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

        if len(params) > 0:
            self._origin_links.append(api + '?' + urlencode(params))
        else:
            self._origin_links.append(api)
        logging.debug("origin_links:" + str(self._origin_links))

        r = self._session.post(base_url + api, params=urlencode(params), headers=headers, data=data,
                               allow_redirects=False)

        self._resp = r
        self._resp_code = r.status_code
        self._resp_headers = r.headers

        if self._resp_code == 404:
            return
        elif self._resp_code == 302:
            self._redirection_link = self._resp_headers.get("location")
            logging.debug("redirection_link:" + self._redirection_link)
        else:
            if self._resp_headers.get("content-type").find('application/json') >= 0:
                self._resp_body = r.json()
                logging.debug("response body:" + str(self._resp_body))
            elif self._resp_headers.get('content-type').find('text/html') >= 0:
                self._resp_body = r.text
                logging.debug("response body:" + self._resp_body)
            else:
                self._resp_body = r.text
                logging.debug("response body:" + self._resp_body)
        return r

    def delete_method_api(self, base_url, api, params=None, headers=None, data=None):
        if headers is None:
            headers = {}

        if params is None:
            params = {}

        if data is None:
            data = {}

        # headers['User-Agent'] = ('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4)') + (
        #     ' AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36')

        headers['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8'
        # headers['Host'] = base_url[base_url.find('http://') + len('http://'):]
        # headers['Upgrade-Insecure-Requests'] = '1'
        headers['Accept-Language'] = 'en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,ko;q=0.6'

        if len(params) > 0:
            self._origin_links.append(api + '?' + urlencode(params))
        else:
            self._origin_links.append(api)
        logging.debug("origin_links:" + str(self._origin_links))

        r = self._session.delete(base_url + api, params=urlencode(params), headers=headers, data=data,
                                 allow_redirects=False)

        self._resp = r
        self._resp_code = r.status_code
        self._resp_headers = r.headers

        if self._resp_code == 404:
            return
        elif self._resp_code == 302:
            self._redirection_link = self._resp_headers.get("location")
            logging.debug("redirection_link:" + self._redirection_link)
        else:
            if self._resp_headers.get("content-type").find('application/json') >= 0:
                self._resp_body = r.json()
                logging.debug("response body:" + str(self._resp_body))
            elif self._resp_headers.get('content-type').find('text/html') >= 0:
                self._resp_body = r.text
                logging.debug("response body:" + self._resp_body)
            else:
                self._resp_body = r.text
                logging.debug("response body:" + self._resp_body)
        return r

    @property
    def resp_code(self):
        return self._resp_code

    @property
    def resp_body(self):
        return self._resp_body

    @property
    def resp_headers(self):
        return self._resp_headers

    @property
    def origin_links(self):
        return self._origin_links

    @property
    def redirection_link(self):
        return self._redirection_link

    @property
    def token(self):
        '''
        token获取
        :return:
        '''
        date_format = "%a %b %d %H:%M:%S %Y"

        if 'access_token' in self.__config:
            if 'expiry' in self.__config:
                expiry = datetime.datetime.strptime(self.__config['expiry'], date_format)
                # refresh 60 seconds early to avoid chance of using expired access_token
                if (datetime.datetime.utcnow() - expiry) > datetime.timedelta(seconds=60):
                    logging.info("Refreshing access_token")
                else:
                    return self.__config['access_token']

        auth = iFlyOSAuth(configuration.DEFAULT_CONFIG_FILE)

        auth.auth_request()
        self.__config = sdk.configurate.load()
        return self.__config['access_token']
