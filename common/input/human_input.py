# -*- coding: utf-8 -*-
'''
human_input.py derives from test_input.py
It defines human input event class and methods 

'''

from common.test_input import TestInput


class UnknownResultError(Exception):
    pass


class HumanInput(TestInput):
    '''
    HumanInput derives from TestInput
    It implements mock result and actual result read from serial of result and bluetooth ports
    It uses a dictionary to store actual results
    '''

    def __init__(self, mock_enable=False):
        '''
        constructor of HumanInput
        :param mock_enable: True for mock enable, otherwise disable
        '''
        super(HumanInput, self).__init__(mock_enable)

    def send(self, value):
        '''
        send human input event, send value to control board serial port
        :param value: human input event value
        :return: True for event accepted, False for event rejected by control board
        '''

        if self.mock_enable:
            return True
        else:
            return False

    def mock_prompt(self, prompt):
        '''
        prompt and get input when mock is disable. if mock is enable no prompt displays
        :param prompt: text that displays  
        :return: None
        '''
        if self.mock_enable:
            pass
        else:
            input(prompt)
