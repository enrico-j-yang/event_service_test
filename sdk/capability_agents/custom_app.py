# -*- coding: utf-8 -*-

"""
自定义模块
"""

import logging

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class Custom(object):
    '''
    自定义类
    '''

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iFlyOS核心模块实例
        '''
        self.namespace = 'Custom'
        self.iflyos = iflyos
        self.context_offset = 0

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        return {
            "header": {
                "namespace": self.namespace,
                "name": "Custom"
            },
            "payload": {
            }
        }
