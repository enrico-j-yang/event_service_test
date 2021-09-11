# -*- coding: utf-8 -*-

"""
勿扰模块
"""

import logging

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class DoNotDisturb(object):
    '''
    勿扰理类
    '''

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iFlyOS核心模块实例
        '''
        self.namespace = 'DoNotDisturb'
        self.iflyos = iflyos
        self.context_offset = 0
