# -*- coding: utf-8 -*-
'''
认证授权模块
'''
import datetime
import logging
import threading
import time

import requests

try:
    import Queue as queue
except ImportError:
    import queue

from lxml import html as HTML

import sdk.configurate as configurate
from global_variables import *

# create logger
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class iFlyOSAuth:
    '''
    iFlyOS　登陆授权类
    '''

    def __init__(self, output, client_id=CLIENT_ID, client_secret=CLIENT_SECRET):
        '''
        处理类初始化
        :param output:配置文件保存地址
        :param client_id: 开发者注册信息
        :param client_secret: 开发者注册信息
        :return:
        '''
        self.config = configurate.load(client_id, client_secret)
        self.output = output

        self.token_url = TOKEN_URL
        self.t = threading.Thread(target=self.app_auth)
        self.user_code_queue = queue.Queue()

    def start_app_auth(self):
        self.t.start()

    def app_auth(self):
        ses = requests.Session()
        params = {}

        # 登录
        r = ses.get(self.token_url + '/user/login')
        if r.status_code != 200:
            logger.error('/user/login error')
            return False

        if r.headers.get('content-type').find('text/html') >= 0:
            resp_body = r.text
            # logger.debug("response body:" + resp_body)
            html = HTML.fromstring(resp_body)
            if len(html.xpath('//form/input[@name="_csrf_token"]/attribute::value')) == 0:
                logger.error("error in /oauth/device")
                return
            else:
                csrf_token = str(html.xpath('//form/input[@name="_csrf_token"]/attribute::value')[0])
                utf8 = str(html.xpath('//form/input[@name="_utf8"]/attribute::value')[0])
            params = {
                'cyber_user[phone]': PHONE_NUMBER,
                'cyber_user[captcha]': CAPTCHA,
                '_csrf_token': csrf_token,
                '_utf8': utf8,
            }

        r = ses.post(self.token_url + '/user/login', params=params)
        if r.status_code != 200:
            logger.error('/user/login error')
            return False

        user_code = self.user_code_queue.get()

        # 请求授权
        params = {
            "user_code": user_code,
        }
        r = ses.get(self.token_url + '/oauth/device', params=params)
        if r.status_code != 200 or r.headers.get('content-type').find('text/html') < 0:
            logger.error('/oauth/device error')
            return False

        resp_body = r.text
        # logger.debug("response body:" + resp_body)
        html = HTML.fromstring(resp_body)
        if len(html.xpath('//form/input[@name="_csrf_token"]/attribute::value')) == 0:
            logger.error("error in /oauth/device")
            return
        else:
            csrf_token = str(html.xpath('//form/input[@name="_csrf_token"]/attribute::value')[0])
            utf8 = str(html.xpath('//form/input[@name="_utf8"]/attribute::value')[0])
        params = {
            'oauth_access_grant[user_code]': user_code,
            '_csrf_token': csrf_token,
            '_utf8': utf8,
        }
        r = ses.post(self.token_url + '/oauth/device', params=params)
        if r.status_code != 200 or r.headers.get('content-type').find('text/html') < 0:
            logger.error("error in /oauth/device")
            return

        resp_body = r.text
        # logger.debug("response body:" + resp_body)
        html = HTML.fromstring(resp_body)
        if len(html.xpath('//form/input[@name="_csrf_token"]/attribute::value')) == 0:
            logger.error("error in /oauth/ivs/device")
            return
        else:
            csrf_token = str(
                html.xpath('//form/input[@name="_csrf_token"]/attribute::value')[0])
            utf8 = str(html.xpath('//form/input[@name="_utf8"]/attribute::value')[0])
        params = {
            'oauth_access_grant[user_code]': user_code,
            '_csrf_token': csrf_token,
            '_utf8': utf8,
        }
        r = ses.post(self.token_url + '/oauth/device_confirm', params=params)
        if r.status_code != 200 or r.headers.get('content-type').find('text/html') < 0:
            logger.error("error in /oauth/device_confirm")
            return

    def auth_request(self, client_id=CLIENT_ID, client_secret=CLIENT_SECRET):
        '''
        发起认证 iFlyOS
        :param client_id:开发者注册信息
        :param client_secret: 开发者注册信息
        :return:
        '''
        if self.config.get('access_token'):
            nowadays = datetime.datetime.now()
            outdated = datetime.datetime.strptime(self.config['expiry'], '%a %b %d %H:%M:%S %Y')
            if nowadays < outdated:
                return True

        self.start_app_auth()

        ses = requests.Session()
        device_id = os.getenv("DEVICE_ID", "ENRICO_TEST")
        # 获取授权码
        import json
        params = {'client_id': client_id, 'scope': "user_ivs_all"}
        user_ivs_all = {}
        scope_data = {'device_id': device_id}
        user_ivs_all['user_ivs_all'] = scope_data
        params['scope_data'] = json.dumps(user_ivs_all)
        from six.moves.urllib.parse import urlencode

        r = ses.post(self.token_url + '/oauth/ivs/device_code', params=urlencode(params))
        if r.status_code != 200 or r.headers.get("content-type").find('application/json') < 0:
            logger.error('/oauth/ivs/device_code error')
            return False

        resp_body = r.json()
        # logger.debug("response body:" + str(resp_body))
        device_code = r.json().get('device_code')
        user_code = r.json().get('user_code')
        interval = r.json().get('interval')
        expires_in = r.json().get('expires_in')

        self.user_code_queue.put(user_code)

        # 获取token
        data = {
            'client_id': client_id,
            'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
            'device_code': device_code,
        }

        for i in range(0, int(expires_in / interval)):
            r = ses.post(self.token_url + '/oauth/ivs/token', data=data, allow_redirects=False)
            if r.status_code == 200 and r.headers.get("content-type").find(
                    'application/json') == 0 and 'access_token' in r.json():
                break
            elif r.status_code == 400 and r.headers.get("content-type").find('application/json') == 0 and r.json().get(
                    'error').find('authorization_pending') == 0:
                time.sleep(interval)
            else:
                logger.error("error in /oauth/ivs/token")
                logger.error(r.status_code)
                return False

        config = r.json()
        self.config['refresh_token'] = config['refresh_token']

        if 'access_token' in config:
            date_format = "%a %b %d %H:%M:%S %Y"
            expiry_time = datetime.datetime.utcnow() + datetime.timedelta(
                seconds=config['expires_in'])
            self.config['expiry'] = expiry_time.strftime(date_format)
            self.config['access_token'] = config['access_token']
        else:
            return False

        # print(json.dumps(self.config, indent=4))
        configurate.save(self.config, configfile=self.output)
        self.t.join()
        return True
