# -*- coding: utf-8 -*-
"""
actual_result.py derives from test_result.py
It defines actual result and bluetooth serials feedback 

"""

from common.test_result import TestResult


class PlatformNotSupportedError(Exception):
    pass


class ActualResult(TestResult):
    """
    ActualResult derives from TestResult
    It implements mock result and actual result read from serial of result and bluetooth ports
    It uses a dictionary to store actual results 
    :static variable dict: test result dictionary
    """
    _dict = {}
    _key_method = {}
    comm_channel = None

    def __init__(self, comm_channel, mock_enable=False):
        """
        constructor of ActualResult
        :param mock_enable: True for mock enable, otherwise disable
        """
        super(ActualResult, self).__init__(mock_enable)
        self.comm_channel = comm_channel

        self.add_source('Status_Code',
                        self.comm_channel.get_status_code,
                        )
        self.add_source('Error',
                        self.comm_channel.get_key_value_from_event_channel_json_body,
                        'error')
        self.add_source('Event_Channel_Interface',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'header/namespace')
        self.add_source('Event_Channel_Directive',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'header/name')
        self.add_source('Event_Channel_Payload',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload')
        self.add_source('Play_Behavior',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/playBehavior')
        self.add_source('Clear_Behavior',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/clearBehavior')
        self.add_source('Offset_In_Milliseconds',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/audioItem/stream/offsetInMilliseconds')
        self.add_source('TTS',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/text')
        self.add_source('Template_Run_Time_Type',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/type')
        self.add_source('Template_Run_Time_Token',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/token')
        self.add_source('Template_Run_Time_Title',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/title')
        self.add_source('Template_Run_Time_Main_Title',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/title/mainTitle')
        self.add_source('Template_Run_Time_Sub_Title',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/title/subTitle')
        self.add_source('Template_Run_Time_Text_Field',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/textField')
        self.add_source('Template_Run_Time_Left_Text_Field',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/listItems/leftTextField')
        self.add_source('Template_Run_Time_Right_Text_Field',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/listItems/rightTextField')
        self.add_source('Template_Run_Time_Sub_Text_Field',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/subtextField')
        self.add_source('Template_Run_Time_Low_Temperature_Field',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/weatherForecast/lowTemperature')
        self.add_source('Template_Run_Time_High_Temperature_Field',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/weatherForecast/highTemperature')
        self.add_source('Template_Run_Time_Current_Weather_Field',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/currentWeather')
        self.add_source('Volume',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/volume')
        self.add_source('Mute',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/mute')
        self.add_source('Down_Channel_Interface',
                        self.comm_channel.get_key_value_from_down_channel_directive,
                        'header/namespace')
        self.add_source('Down_Channel_Directive',
                        self.comm_channel.get_key_value_from_down_channel_directive,
                        'header/name')
        self.add_source('Down_Channel_Payload',
                        self.comm_channel.get_key_value_from_down_channel_directive,
                        'payload')
        self.add_source('Scheduled_Time',
                        self.comm_channel.get_key_value_from_down_channel_directive,
                        'payload/scheduledTime')
        self.add_source('Progress_Report_Interval_In_Milliseconds',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/audioItem/stream/progressReport/progressReportIntervalInMilliseconds')
        self.add_source('Progress_Report_Delay_In_Milliseconds',
                        self.comm_channel.get_key_value_from_event_channel_directive,
                        'payload/audioItem/stream/progressReport/progressReportDelayInMilliseconds')



    def set_value(self, key, value):
        """
        set dictionary value according to specified key
        :param key: actual result dictionary key
        :param value: actual result dictionary value
        :return: None
        """
        self._dict[key] = value

    def mock_value(self, key, value):
        """
        set dictionary value according to specified key if mock is enabled
        :param key: actual result dictionary key
        :param value: actual result dictionary value
        :return: None
        """
        if self.mock_enable:
            self.set_value(key, value)

    def get_value(self, key):
        """
        get dictionary value according to specified key
        :param key:  actual result dictionary key
        :return: actual result dictionary value
        """
        args = self._key_method[key][1]
        self.set_value(key, self._key_method[key][0](*args))
        return self._dict[key]

    def add_source(self, key, method, *args):
        self._key_method[key] = (method, args)
