# -*- coding: utf-8 -*-

"""
唤醒词模块
"""

import logging

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class WakeWord(object):
    '''
    唤醒词类
    '''

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iFlyOS核心模块实例
        '''
        self.namespace = 'WakeWord'
        self.iflyos = iflyos
