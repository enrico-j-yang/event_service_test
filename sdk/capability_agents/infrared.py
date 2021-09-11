# -*- coding: utf-8 -*-

"""
红外模块
"""

import logging

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class Infrared(object):
    '''
    红外类
    '''

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iFlyOS核心模块实例
        '''
        self.namespace = 'iFLYOS::Transparent::Infrared'
        self.iflyos = iflyos
        self.context_offset = 0
