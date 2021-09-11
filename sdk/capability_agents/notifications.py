# -*- coding: utf-8 -*-

"""
Notifications模块
"""


class Notifications(object):
    '''
    Notifications类
    '''

    def __init__(self, iflyos, player):
        '''
        类初始化
        :param iflyos:iflyos核心处理模块
        :param player: 播放器
        '''
        self.namespace = 'Notifications'
        self.iflyos = iflyos
        self.player = player
        self.token = None
        self.persist_visual_indicator = False
        self.play_audio_indicator = False

        self.player.add_callback('eos', self.clear_indicator)
        self.player.add_callback('error', self.clear_indicator)

    def set_indicator(self, directive):
        '''
        设置提醒(云端directive　name方法)
        :param directive:云端下发的directive
        :return:
        '''
        #{
        #    "directive": {
        #        "header": {
        #            "namespace": "Notifications",
        #            "name": "SetIndicator",
        #            "messageId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "persistVisualIndicator": {{BOOLEAN}},
        #            "playAudioIndicator": {{BOOLEAN}},
        #            "asset": {
        #                "assetId": "{{STRING}}",
        #                "url": "{{STRING}}"
        #            }
        #        }
        #    }
        #}
        payload = directive['payload']
        self.token = payload['token']

        self.persist_visual_indicator = payload['persistVisualIndicator']
        self.play_audio_indicator = payload['playAudioIndicator']
        asset = payload['asset']
        asset_id = asset['assetId']
        url = asset['url']

    def clear_indicator(self, directive):
        '''
        设置提醒(云端directive　name方法)
        :param directive:云端下发的directive
        :return:
        '''
        #{
        #    "directive": {
        #        "header": {
        #            "namespace": "Notifications",
        #            "name": "ClearIndicator",
        #            "messageId": "{{STRING}}"
        #        },
        #        "payload": {
        #        }
        #    }
        #}
        self.persist_visual_indicator = False
        self.play_audio_indicator = False

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        return {
            "header": {
                "namespace": self.namespace,
                "name": "IndicatorState"
            },
            "payload": {
                "isEnabled": self.persist_visual_indicator,
                "isVisualIndicatorPersisted": self.play_audio_indicator
            }
        }
