# -*- coding: utf-8 -*-
'''
communication_channel.py
It defines communication channel objects

'''
import logging


class CommunicationChannel:
    '''
    CommunicationChannel is general test input class
    '''

    def __init__(self, mock_enable=False):
        '''
        constructor of CommunicationChannel
        :param mock_enable: True for mock enable, otherwise disable
        '''
        self.mock_enable = mock_enable
        if self.mock_enable:
            logging.debug('CommunicationChannel enable')
        else:
            logging.debug('CommunicationChannel')
