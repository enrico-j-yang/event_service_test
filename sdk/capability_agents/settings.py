# -*- coding: utf-8 -*-

"""
Settings模块
"""

import uuid


class Settings(object):
    '''
    Settings类
    '''

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iflyos核心处理模块
        '''
        self.namespace = 'Settings'
        self.iflyos = iflyos
        self.settings = {}

    def settings_updated(self):
        '''
        设置提醒(云端directive　name方法)
        :return:
        '''
        settings_string = []
        for key, value in self.settings.items():
            item = {"key": key, "value": value, }
            settings_string.append(item)

        event = {
            "header": {
                "namespace": self.namespace,
                "name": "SettingsUpdated",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "settings": settings_string
            }
        }

        self.iflyos.send_event(event)

    def update_settings(self, settings):
        for key, value in settings.items():
            self.settings[key] = value

