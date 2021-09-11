# -*- coding: utf-8 -*-
'''
alexa_client.py
It defines alexa-like client objects

'''
import logging
import os

try:
    import Queue as queue
except ImportError:
    import queue

from common.communication_channel import CommunicationChannel
from framework.player import Player
from sdk.communications_library import iFlyOS

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class IFlyOSClient(CommunicationChannel):
    '''
    AlexaClient is a Alexa-like client object
    '''
    player = None
    iflyos = None
    down_channel_result_queue = None
    event_channel_result_queue = None
    _down_channel_directive_queue = None
    _event_channel_directive_queue = None
    _down_channel_binary_queue = None
    _event_channel_binary_queue = None
    _json_body_queue = None
    # _time_out_threshold = 500
    _time_out_threshold = 10
    _resp_code = None
    _down_channel_directives = []
    _down_channel_directive = None
    _down_channel_binary = None
    _event_channel_directives = []
    _event_channel_directive = None
    _event_channel_binary = None

    def __init__(self, mock_enable=False):
        '''
        constructor of AlexaClient
        :param mock_enable: True for mock enable, otherwise disable
        '''
        super(IFlyOSClient, self).__init__(mock_enable)
        self.mock_enable = mock_enable
        if self.mock_enable:
            logger.debug('AlexaClient enable')
        else:
            logger.debug('AlexaClient')

        # 创建播放器（平台相关）
        self.player = Player()

        if self.player:
            self.iflyos = iFlyOS(self.player)
        else:
            logger.error("创建播放器失败")

        self.down_channel_result_queue = self.iflyos.down_channel_result_queue
        self.event_channel_result_queue = self.iflyos.event_channel_result_queue
        self._down_channel_directive_queue = queue.Queue()
        self._event_channel_directive_queue = queue.Queue()
        self._down_channel_binary_queue = queue.Queue()
        self._event_channel_binary_queue = queue.Queue()
        self._json_body_queue = queue.Queue()

        self.iflyos.down_channel_event.clear()

    def clear_result_queue(self):
        while not self.down_channel_result_queue.empty():
            self.down_channel_result_queue.get()

        logger.debug("down_channel_result_queue len:" + str(self.down_channel_result_queue._qsize()))

        while not self.event_channel_result_queue.empty():
            self.event_channel_result_queue.get()

        logger.debug("event_channel_result_queue len:" + str(self.event_channel_result_queue._qsize()))

        while not self._down_channel_directive_queue.empty():
            self._down_channel_directive_queue.get()

        logger.debug("_down_channel_directive_queue len:" + str(self._down_channel_directive_queue._qsize()))

        while not self._event_channel_directive_queue.empty():
            self._event_channel_directive_queue.get()

        logger.debug("_event_channel_directive_queue len:" + str(self._event_channel_directive_queue._qsize()))

        while not self._down_channel_binary_queue.empty():
            self._down_channel_binary_queue.get()

        logger.debug("_down_channel_binary_queue len:" + str(self._down_channel_binary_queue._qsize()))

        while not self._event_channel_binary_queue.empty():
            self._event_channel_binary_queue.get()

        logger.debug("_event_channel_binary_queue len:" + str(self._event_channel_binary_queue._qsize()))

        while not self._json_body_queue.empty():
            self._json_body_queue.get()

        logger.debug("_json_body_queue len:" + str(self._json_body_queue._qsize()))

        self.iflyos.down_channel_event.clear()

    def get_result_from_event_channel_queue(self):
        self._resp_code, self._event_channel_directives, self._event_channel_binary = self.event_channel_result_queue.get(
            timeout=self._time_out_threshold)
        logger.debug("event_channel_result_queue len:" + str(self.event_channel_result_queue._qsize()))

        if self._event_channel_directives:
            logger.debug("###event channel directives###:" + str(self._event_channel_directives))
            for directive in self._event_channel_directives:
                self._event_channel_directive_queue.put(directive)
                logger.debug("_event_channel_directive_queue len:" + str(self._event_channel_directive_queue._qsize()))

        if self._event_channel_binary:
            self._event_channel_binary_queue.put(self._event_channel_binary)
            logger.debug("_event_channel_binary_queue len:" + str(self._event_channel_binary_queue._qsize()))

    def get_directive_from_event_channel_list(self):
        self._event_channel_directive = self._event_channel_directive_queue.get(timeout=self._time_out_threshold)
        logger.debug("@@@get directive from event channel queue:" + str(self._event_channel_directive))
        logger.debug("_event_channel_directive_queue len:" + str(self._event_channel_directive_queue._qsize()))

    def get_binary_from_event_channel_list(self):
        self._event_channel_binary = self._event_channel_binary_queue.get(timeout=self._time_out_threshold)
        logger.debug("_event_channel_binary_queue len:" + str(self._event_channel_binary_queue._qsize()))

    def get_binary_from_event_channel(self):
        logger.debug(self._event_channel_binary)
        if os.path.isfile(self._event_channel_binary):
            return self._event_channel_binary
        else:
            return

    def get_status_code(self):
        return self._resp_code

    def get_key_value_from_event_channel_directive(self, full_key):
        keys = full_key.split('/')
        value = None
        json_body = self._event_channel_directive
        for key in keys:
            value = json_body[key]
            json_body = value

        return value

    def get_key_value_from_event_channel_json_body(self, full_key):
        if len(self._event_channel_directives) > 0:
            self._event_channel_directive = self._event_channel_directives[0]
            del self._event_channel_directives[0]

        keys = full_key.split('/')
        value = None
        json_body = self._event_channel_directive
        for key in keys:
            value = json_body[key]
            json_body = value

        return value

    def get_result_from_down_channel_queue(self):
        self.iflyos.down_channel_event.wait(timeout=self._time_out_threshold)
        logger.debug("down_channel_event.wait:-------------------------------------")
        self.iflyos.down_channel_event.clear()

        while not self.down_channel_result_queue.empty():
            self._down_channel_directives, self._down_channel_binary = self.down_channel_result_queue.get(
                timeout=self._time_out_threshold)
            logger.debug("down_channel_result_queue len:" + str(self.down_channel_result_queue._qsize()))
            logger.debug("###down channel directives###:" + str(self._down_channel_directives))

            if self._down_channel_directives:
                for directive in self._down_channel_directives:
                    logger.debug("@@@put directive into queue:" + str(directive))
                    self._down_channel_directive_queue.put(directive)
                logger.debug("_down_channel_directive_queue len:" + str(self._down_channel_directive_queue._qsize()))

            if self._down_channel_binary:
                self._down_channel_binary_queue.put(self._down_channel_binary)
                logger.debug("_down_channel_binary_queue len:" + str(self._down_channel_binary_queue._qsize()))

    def get_directive_from_down_channel_list(self):
        self._down_channel_directive = self._down_channel_directive_queue.get(timeout=self._time_out_threshold)
        logger.debug("@@@get directive from down channel queue:" + str(self._down_channel_directive))
        logger.debug("_down_channel_directive_queue len:" + str(self._down_channel_directive_queue._qsize()))

    def put_back_directive_to_down_channel_list(self):
        self._down_channel_directive_queue.put(self._down_channel_directive)
        logger.debug("@@@put_back_directive_to_down_channel_list:" + str(self._down_channel_directive))

    def get_down_channel_directive_queue_len(self):
        return self._down_channel_directive_queue.qsize()

    def get_binary_from_down_channel_list(self):
        self._down_channel_binary = self._down_channel_binary_queue.get(timeout=self._time_out_threshold)
        logger.debug("_down_channel_binary_queue len:" + str(self._down_channel_binary_queue._qsize()))

    def get_binary_from_down_channel(self):
        logger.debug(self._down_channel_binary)
        if os.path.isfile(self._down_channel_binary):
            return self._down_channel_binary
        else:
            return

    def get_key_value_from_down_channel_directive(self, full_key):
        keys = full_key.split('/')
        value = None
        json_body = self._down_channel_directive
        for key in keys:
            value = json_body[key]
            json_body = value

        return value

    def get_key_value_from_down_channel_json_body(self, full_key):
        if len(self._down_channel_directives) > 0:
            self._down_channel_directive = self._down_channel_directives[0]
            del self._down_channel_directives[0]

        keys = full_key.split('/')
        value = None
        json_body = self._down_channel_directive
        for key in keys:
            value = json_body[key]
            json_body = value

        return value
