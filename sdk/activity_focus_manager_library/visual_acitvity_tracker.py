# -*- coding: utf-8 -*-

"""
视觉焦点管理模块
"""

import logging
import time
from sdk.capabilities import Capabilities
from .activity_focus_manager_library import ActivityFocusManagerLibrary
from .channel import FocusState

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class VisualActivityTracker(object):
    '''
    视觉焦点管理类
    '''
    VISUALACTIVITYTRACKER_CAPABILITY_INTERFACE_TYPE = "AlexaInterface"
    VISUALACTIVITYTRACKER_CAPABILITY_INTERFACE_NAME = "VisualActivityTracker"
    VISUALACTIVITYTRACKER_CAPABILITY_INTERFACE_VERSION = "1.0"
    FOCUSED_KEY = "focused"
    INTERFACE_KEY = "interface"
    IDLE_TIME_KEY = "idleTimeInMilliseconds"

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iFlyOS核心模块实例
        '''
        self.namespace = 'VisualActivityTracker'
        self.iflyos = iflyos
        self.context_offset = 0
        self.channel_states = []
        self.channel_names_in_lower_case = {}
        self.capability_configurations = []
        self.executor = None

    def provide_state(self, state_provider_name, state_request_token):
        #self.executor.submit(state_request_token, self._execute_provide_state(state_request_token))
        pass

    def notify_of_state_updates(self, channel_states):
        # self.executor.submit(channel_states, self._execute_notify_of_activity_updates(channel_states))
        pass

    def get_capability_configuration(self):
        config_map = {}
        config_map[Capabilities.CAPABILITY_INTERFACE_TYPE_KEY] = self.VISUALACTIVITYTRACKER_CAPABILITY_INTERFACE_TYPE
        config_map[Capabilities.CAPABILITY_INTERFACE_NAME_KEY] = self.VISUALACTIVITYTRACKER_CAPABILITY_INTERFACE_NAME
        config_map[
            Capabilities.CAPABILITY_INTERFACE_VERSION_KEY] = self.VISUALACTIVITYTRACKER_CAPABILITY_INTERFACE_VERSION

        return config_map

    def _execute_notify_of_activity_updates(self, channel_states):
        for state in channel_states:
            if "SpeechRecognizer" == state.interface_name and ActivityFocusManagerLibrary.DIALOG_CHANNEL_NAME == state.name:
                continue

            self.channel_states[state.name] = state


    def _execute_provide_state(self, state_request_token):
        for channel_state in self.channel_states:
            context_json = {}
            idle_time = 0
            channel_context = channel_state[1]

            if FocusState.NONE == channel_context.focus_state:
                idle_time = time.time() - channel_context.time_at_idle

            context_json[VisualActivityTracker.INTERFACE_KEY] = channel_context.interface_name
            context_json[VisualActivityTracker.IDLE_TIME_KEY] = idle_time




        pass

    def _execute_channel_name_in_lower_case(self, channel_name):
        it = self.channel_names_in_lower_case[channel_name]
        channel_name_in_lower_case = channel_name.lowercase()
        self.channel_names_in_lower_case[it] = {channel_name: channel_name_in_lower_case}

        return it[1]

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        return {
            "header": {
                "namespace": self.namespace,
                "name": "ActivityState"
            },
            "payload": {
                "focused": {
                    "interface": "{{STRING}}",
                }
            }
        }
