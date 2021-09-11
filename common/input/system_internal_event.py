# -*- coding: utf-8 -*-
'''
system_internal_event.py derives from test_input.py
It defines system internal event class and methods 

'''

from common.test_input import TestInput


class SystemInternalEvent(TestInput):
    '''
    HumanInput derives from TestInput
    '''

    def __init__(self, mock_enable=False):
        '''
        constructor of SystemInternalEvent
        :param mock_enable: True for mock enable, otherwise disable
        '''
        super(SystemInternalEvent, self).__init__(mock_enable)
