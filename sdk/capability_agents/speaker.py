# -*- coding: utf-8 -*-
'''
扬声器控制模块
参考：http://open.Cyber.baidu.com/doc/iflyos-conversational-service/device-interface/speaker-controller_markdown
'''

import logging
import uuid


class Speaker(object):
    '''
    扬声器控制类
    '''

    def __init__(self, iflyos, player):
        '''
        类初始化
        :param iflyos:
        '''
        self.namespace = 'Speaker'
        self.iflyos = iflyos
        self.player = player
        self.context_volume = 0
        self.context_mute = False

    def set_volume(self, directive):
        '''
        音量设置(云端directive　name方法)
        :return:
        '''
        logging.info("set_volume")
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "Speaker",
        #            "name": "SetVolume",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "volume": {{LONG}}
        #        }
        #    }
        # }
        payload = directive['payload']
        volume = payload['volume']
        self.player.set_volume(volume)
        pass

    def adjust_volume(self, directive):
        '''
        音量调整(云端directive　name方法)
        :return:
        '''
        logging.info("adjust_volume")
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "Speaker",
        #            "name": "AdjustVolume",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "volume": {{LONG}}
        #        }
        #    }
        # }
        payload = directive['payload']
        volume = payload['volume']
        current_volume = self.player.get_volume()
        if current_volume + volume <= 0:
            self.player.set_volume(0)
        elif current_volume + volume >= 100:
            self.player.set_volume(100)
        else:
            self.player.set_volume(current_volume + volume)
        pass

    def set_mute(self, directive):
        '''
        设置静音(云端directive　name方法)
        :return:
        '''
        logging.info("mute_toggle")
        #{
        #    "directive": {
        #        "header": {
        #            "namespace": "Speaker",
        #            "name": "SetMute",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "mute": {{BOOLEAN}}
        #        }
        #    }
        #}
        payload = directive['payload']
        mute = payload['mute']
        self.player.set_mute(mute)

    def volume_changed(self):
        '''
        音量改变事件上报
        :return:
        '''
        logging.info("volume_changed")
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "VolumeChanged",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "volume": self.player.volume,
                "muted": self.player.is_mute
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_volume = self.player.get_volume()
        # self.context_mute = self.player.is_mute()

    def mute_changed(self):
        '''
        静音状态改变事件上报
        :return:
        '''
        logging.info("mute_changed")
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "MuteChanged",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "volume": self.player.volume,
                "muted": self.player.is_mute
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_volume = self.player.get_volume()
        # self.context_mute = self.player.is_mute()

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        return {
            "header": {
                "namespace": self.namespace,
                "name": "VolumeState"
            },
            "payload": {
                "volume": self.context_volume,
                "muted": self.context_mute
            }
        }
