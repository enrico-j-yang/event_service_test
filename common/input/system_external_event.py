# -*- coding: utf-8 -*-
'''
system_external_event.py derives from test_input.py
It defines system external event class and methods 

'''
import os

try:
    import Queue as queue
except ImportError:
    import queue

from common.test_input import TestInput


class UnknownResultError(Exception):
    pass


class SystemExternalEvent(TestInput):
    '''
    HumanInput derives from TestInput
    '''

    comm_channel = None
    directive_queue = None
    unparsed_directive = None
    error = {}

    def __init__(self, comm_channel, mock_enable=False):
        '''
        constructor of SystemExternalEvent
        :param mock_enable: True for mock enable, otherwise disable
        '''
        super(SystemExternalEvent, self).__init__(mock_enable)
        self.comm_channel = comm_channel

    def recognize(self, voice_content):
        self.comm_channel.iflyos.directive_sequencer.speech_recognizer.recognize(voice_content)

    def query_state(self):
        self.comm_channel.send_query()

    def set_invalid_audio_player_token(self):
        self.comm_channel.iflyos.directive_sequencer.audio_player.set_invalid_token()

    def set_invalid_offset_in_millisecond(self):
        self.comm_channel.iflyos.directive_sequencer.audio_player.set_invalid_offset_in_millisecond()

    def set_context(self, iflyos_context):
        '''
        直接设置上下文的接口，测试用
        :param iflyos_context: 需要设置的上下文
        :return:
        '''
        try:
            item = iflyos_context.get('PlaybackState')
        except KeyError:
            pass
        else:
            self.comm_channel.iflyos.directive_sequencer.audio_player.set_offset(item['offsetInMilliseconds'])
            self.comm_channel.iflyos.directive_sequencer.audio_player.set_player_activity(item['playerActivity'])

    def set_body(self, body):
        '''
        直接设置上下文的接口，测试用
        :param body: 需要设置的body
        :return:
        '''
        try:
            item = body.get('payload')
        except KeyError:
            pass
        else:
            self.comm_channel.iflyos.directive_sequencer.speech_synthesizer.set_token(item['token'])
