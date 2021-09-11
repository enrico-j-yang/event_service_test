# -*- coding: utf-8 -*-

"""
Capabilities模块
"""
import json
import logging
import requests
import sdk.configurate
from global_variables import *

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class Capabilities(object):
    '''
    Capabilities模块
    '''

    CAPABILITY_INTERFACE_TYPE_KEY = "type"
    CAPABILITY_INTERFACE_NAME_KEY = "interface"
    CAPABILITY_INTERFACE_VERSION_KEY = "version"
    CAPABILITY_INTERFACE_CONFIGURATIONS_KEY = "configurations"

    def __init__(self):
        '''
        类初始化
        :param iflyos:iflyos核心处理模块
        '''
        self.namespace = 'Capabilities'
        self.capability_url = CAPABILITY_URL

        self.token = None
        self.headers = {}
        self.capabilities = {
            "envelopeVersion": "v20180810",
            "capabilities": [
                {
                    "type": "iFLYOS.Interface",
                    "interface": "Alerts",
                    "version": "1.0"
                },
                {
                    "type": "iFLYOS.Interface",
                    "interface": "AudioPlayer",
                    "version": "1.0"
                },
                # {
                #     "type": "iFLYOS.Interface",
                #     "interface": "Notifications",
                #     "version": "1.0"
                # },
                {
                    "type": "iFLYOS.Interface",
                    "interface": "PlaybackController",
                    "version": "1.0"
                },
                {
                    "type": "iFLYOS.Interface",
                    "interface": "Settings",
                    "version": "1.0"
                },
                {
                    "type": "iFLYOS.Interface",
                    "interface": "Speaker",
                    "version": "1.0"
                },
                {
                    "type": "iFLYOS.Interface",
                    "interface": "SpeechRecognizer",
                    "version": "1.1"
                },
                {
                    "type": "iFLYOS.Interface",
                    "interface": "SpeechSynthesizer",
                    "version": "1.0"
                },
                {
                    "type": "iFLYOS.Interface",
                    "interface": "System",
                    "version": "1.1"
                }
            ]
        }
        
    def default_capabilities(self):
        self.token = sdk.configurate.load()['access_token']
        self.headers = {
            'authorization': 'Bearer {}'.format(self.token),
            'content-type': 'application/json',
        }
        json_part = json.dumps(self.capabilities)
        logger.debug(json.dumps(self.capabilities, indent=4))
        requests.put(self.capability_url + '/v1/devices/capabilities', headers=self.headers, data=json_part)

    def add_capabilities(self, interface, version="1.0"):
        self.token = sdk.configurate.load()['access_token']
        self.headers = {
            'authorization': 'Bearer {}'.format(self.token),
            'content-type': 'application/json',
        }
        capability_info = {
            "type": "iFLYOS.Interface",
            "interface": interface,
            "version": version
        }

        if any(cap == interface for cap in self.capabilities["capabilities"]):
            # if interface existed, update version only
            [cap == interface for cap in self.capabilities["capabilities"]]["version"] = version
        else:
            # if interface not default, add it
            self.capabilities['capabilities'].append(capability_info)

        json_part = json.dumps(self.capabilities)
        logger.debug(json.dumps(self.capabilities, indent=4))
        requests.put(self.capability_url + '/v1/devices/capabilities', headers=self.headers, data=json_part)

    def get_capabilities(self):
        caps = []
        for cap in self.capabilities['capabilities']:
            caps.append(cap['interface'])

        return caps

