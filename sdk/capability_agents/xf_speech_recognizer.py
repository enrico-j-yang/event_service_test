# -*- coding: utf-8 -*-

"""
IAT模块(语音转写)
"""

import logging

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger('XFSpeechRecognizer')


class XFSpeechRecognizer(object):
    '''
    IAT模块(语音转写)
    '''

    def __init__(self):
        '''
        类初始化
        :param iflyos:iflyos核心实现模块实例
        '''
        self.namespace = 'XFSpeechRecognizer'
        self.text = None

    def intermediate_text(self, directive):
        '''
        IAT(云端directive　name方法)
        :param directive: 云端下发的directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "XFSpeechRecognizer",
        #            "name": "IntermediateText",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "text": "{{STRING}}"
        #        }
        #    }
        # }
        self.text = directive['payload']['text']

        logger.debug(self.text)
