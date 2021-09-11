# -*- coding: utf-8 -*-

"""
基于GStreamer的播放模块
"""

import logging


class SongInfo(object):
    '''
    歌曲信息类
    '''

    def __init__(self):
        self._song_name = 'Test Song'
        self._singer = 'Test Singer'
        self._album = 'Test Album'

    @property
    def song_name(self):
        return self._song_name

    @property
    def singer(self):
        return self._singer

    @property
    def album(self):
        return self._album


class Player(object):
    '''
    播放器实现类
    '''

    def __init__(self):
        self._volume = 50
        self._mute = False
        self._position = 0
        self._duration = 0
        self._stutter_duration = 0
        self._song_info = SongInfo()
        self._error_type = "Test Error Type"
        self._error_message = "Test Error Message"

    def play(self, uri):
        '''
        播放
        :param uri:播放资源地址
        :return:
        '''
        logging.info('[播放状态]正在播放..........')

    def stop(self):
        '''
        停止
        :return:
        '''
        logging.info('[播放状态]正在停止..........')

    def pause(self):
        '''
        暂停
        :return:
        '''
        logging.info('[播放状态]暂停..........')

    def resume(self):
        '''
        恢复播放
        :return:
        '''
        logging.info('[播放状态]恢复播放..........')

    def next(self):
        '''
        下一首
        :return:
        '''
        logging.info('[播放状态]下一首..........')

    def previous(self):
        '''
        上一首
        :return:
        '''
        logging.info('[播放状态]上一首..........')

    def add_callback(self, name, callback):
        '''
        播放状态回调
        :param name: {eos, ...}
        :param callback: 回调函数
        :return:
        '''
        if not callable(callback):
            return

        def on_message(bus, message):
            callback()

    def set_volume(self, volume):
        '''
        设置音量
        :return:
        '''
        logging.info('[播放状态]设置音量..........')
        self._volume = volume

    def get_volume(self):
        '''
        获取音量
        :return:
        '''
        logging.info('[播放状态]获取音量..........')
        return self._volume

    def set_mute(self, mute):
        '''
        设置静音
        :return:
        '''
        logging.info('[播放状态]设置静音..........')
        self._mute = mute

    def seek(self, position):
        '''
        定位
        :position: 偏移量（毫秒）
        :return:
        '''
        logging.info('[播放状态]设置偏移量..........')
        self._position = position

    def call_back_add_stutter_duration(self, duration):
        '''
        增加缓存时间的回调函数
        :duration: 缓存时间（毫秒）
        :return:
        '''
        logging.info('[播放状态]增加缓存时间..........')
        self._stutter_duration += duration

    def on_focus_changed(self, focus_state):
        logging.info('focus changed:' + focus_state)

    @property
    def volume(self):
        '''
        获取音量
        :return:volume
        '''
        logging.info('[播放状态]获取音量..........')
        return self._volume

    @property
    def is_mute(self):
        '''
        获取静音状态
        :return:mute
        '''
        logging.info('[播放状态]获取静音状态..........')
        return self._mute

    @property
    def duration(self):
        '''
        播放时长
        :return:
        '''
        logging.info('[播放状态]播放时长..........')
        return self._duration

    @property
    def position(self):
        '''
        播放位置
        :return:
        '''
        logging.info('[播放状态]播放位置..........')
        return self._position

    @property
    def stutter_duration(self):
        '''
        返回缓存长度
        :return:
        '''
        logging.info('[播放状态]返回缓存长度..........')
        return self._stutter_duration

    @property
    def song_info(self):
        '''
        返回歌曲信息
        :return:
        '''
        logging.info('[播放状态]返回歌曲信息..........')
        return self._song_info

    @property
    def error_type(self):
        '''
        返回错误类型
        :return:
        '''
        logging.info('[播放状态]返回错误类型..........')
        return self._error_type

    @property
    def error_message(self):
        '''
        返回错误信息
        :return:
        '''
        logging.info('[播放状态]返回错误信息..........')
        return self._error_message

    @property
    def state(self):
        '''
        播放状态
        :return:
        '''
        # GST_STATE_VOID_PENDING        no pending state.
        # GST_STATE_NULL                the NULL state or initial state of an element.
        # GST_STATE_READY               the element is ready to go to PAUSED.
        # GST_STATE_PAUSED              the element is PAUSED, it is ready to accept and process data.
        #                               Sink elements however only accept one buffer and then block.
        # GST_STATE_PLAYING             the element is PLAYING, the GstClock is running and the data is flowing.
        logging.info('[播放状态]播放状态..........')
        return
