# -*- coding: utf-8 -*-

"""
蓝牙模块
"""

import logging

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class Bluetooth(object):
    '''
    蓝牙类
    '''
    STATES = {'IDLE', 'PLAYING', 'STOPPED', 'PAUSED', 'BUFFER_UNDERRUN', 'FINISHED'}

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iFlyOS核心模块实例
        '''
        self.namespace = 'Bluetooth'
        self.iflyos = iflyos
        self._state = 'IDLE'
        self.context_state = 'IDLE'
        self.context_offset = 0
        self.friendly_name = None

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        return {
            "header": {
                "namespace": self.namespace,
                "name": "BluetoothState"
            },
            "payload": {
                "device": {
                    "friendlyName": self.friendly_name,
                },
                "pairedDevices": [
                    {
                        "uniqueDeviceId": "{{STRING}}",
                        "friendlyName": "{{STRING}}",
                        "supportedProfiles": [
                            {
                                "name": "{{STRING}}",
                                "version": "{{STRING}}"
                            },
                            {
                                # Additional objects may be included for each
                                # profile that the device supports.
                            }
                        ]
                    },
                    {
                        # Additional objects        should        be        included        for each
                        # paired device.
                    }
                ],
                "activeDevice": {
                    "uniqueDeviceId": "{{STRING}}",
                    "friendlyName": "{{STRING}}",
                    "supportedProfiles": [
                        {
                            "name": "{{STRING}}",
                            "version": "{{STRING}}"
                        },
                        {
                            # Additional objects may be included        for each
                            # profile that the device supports.
                        }
                    ],
                    "streaming": "{{STRING}}"
                }
            }
        }
