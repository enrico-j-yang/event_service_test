# -*- coding: utf-8 -*-

"""
PlaybackController模块
"""

import uuid

class PlaybackController(object):
    '''
    PlaybackController类
    '''

    def __init__(self, iflyos, player):
        '''
        类初始化
        :param iflyos:iflyos核心处理模块
        :param player: 播放器
        '''
        self.namespace = 'PlaybackController'
        self.iflyos = iflyos
        self.player = player

    def play_command_issued(self):
        '''
        播放命令(云端directive　name方法)
        :return:
        '''
        #{
        #    "context": [
        #               // This is an array of context objects that are used to communicate the
        #               // state of all client components to Alexa.See Context for details.
        #    ],
        #    "event": {
        #       "header": {
        #           "namespace": "PlaybackController",
        #           "name": "PlayCommandIssued",
        #            "messageId": "{{STRING}}"
        #       },
        #       "payload": {
        #       }
        #   }
        #}
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "PlayCommandIssued",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)

    def pause_command_issued(self):
        '''
        播放命令(云端directive　name方法)
        :return:
        '''
        #{
        #    "context": [
        #               // This is an array of context objects that are used to communicate the
        #               // state of all client components to Alexa.See Context for details.
        #    ],
        #    "event": {
        #       "header": {
        #           "namespace": "PlaybackController",
        #           "name": "PauseCommandIssued",
        #            "messageId": "{{STRING}}"
        #       },
        #       "payload": {
        #       }
        #   }
        #}
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "PauseCommandIssued",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)

    def next_command_issued(self):
        '''
        播放命令(云端directive　name方法)
        :return:
        '''
        #{
        #    "context": [
        #               // This is an array of context objects that are used to communicate the
        #               // state of all client components to Alexa.See Context for details.
        #    ],
        #    "event": {
        #       "header": {
        #           "namespace": "PlaybackController",
        #           "name": "NextCommandIssued",
        #            "messageId": "{{STRING}}"
        #       },
        #       "payload": {
        #       }
        #   }
        #}
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "NextCommandIssued",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)

    def previous_command_issued(self):
        '''
        播放命令(云端directive　name方法)
        :return:
        '''
        #{
        #    "context": [
        #               // This is an array of context objects that are used to communicate the
        #               // state of all client components to Alexa.See Context for details.
        #    ],
        #    "event": {
        #       "header": {
        #           "namespace": "PlaybackController",
        #           "name": "PreviousCommandIssued",
        #            "messageId": "{{STRING}}"
        #       },
        #       "payload": {
        #       }
        #   }
        #}
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "PreviousCommandIssued",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
