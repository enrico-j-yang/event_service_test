# -*- coding: utf-8 -*-

"""
音乐播放模块
"""

import logging
import os
import tempfile
import uuid

try:
    import Queue as queue
except ImportError:
    import queue

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

class AudioPlayer(object):
    '''
    音乐播放类
    '''
    STATES = {'IDLE', 'PLAYING', 'STOPPED', 'PAUSED', 'BUFFER_UNDERRUN', 'FINISHED'}

    def __init__(self, iflyos, player):
        '''
        类初始化
        :param iflyos:iFlyOS核心模块实例
        :param player: 播放器实例（平台相关）
        '''
        self.namespace = 'AudioPlayer'
        self.iflyos = iflyos
        self._tokens = []
        logger.debug("tokens:" + str(self._tokens))
        self._state = 'IDLE'
        self.context_tokens = []
        self.context_state = 'IDLE'
        self.context_offset = 0

        self._player = player
        self._player.add_callback('eos', self.playback_finished)
        self._player.add_callback('error', self.playback_failed)
        self._offset = 0
        self._empty_payload = False
        self._invalid_token = False
        self._invalid_offset_in_millisecond = False
        self._stutter_duration_in_milliseconds = False
        self.audio_player_queue = queue.Queue()

    def play(self, directive):
        '''
        播放(云端directive name方法)
        :param directive:云端下发directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "AudioPlayer",
        #            "name": "Play",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "playBehavior": "{{STRING}}",
        #            "audioItem": {
        #                "audioItemId": "{{STRING}}",
        #                "stream": {
        #                    "url": "{{STRING}}",
        #                    "streamFormat": "AUDIO_MPEG"
        #                    "offsetInMilliseconds": {{LONG}},
        #                    "expiryTime": "{{STRING}}",
        #                    "progressReport": {
        #                        "progressReportDelayInMilliseconds": {{LONG}},
        #                        "progressReportIntervalInMilliseconds": {{LONG}}
        #                },
        #            "token": "{{STRING}}",
        #            "expectedPreviousToken": "{{STRING}}"
        #        }
        #    }
        # }
        behavior = directive['payload']['playBehavior']
        self.audio_player_queue.put(behavior)

        offset_in_milliseconds = int(directive['payload']['audioItem']['stream']['offsetInMilliseconds'])
        self.audio_player_queue.put(offset_in_milliseconds)

        token = directive['payload']['audioItem']['stream']['token']
        if behavior == "REPLACE_ALL":
            # Leave first token only because device must send playbackStop event after this directive.
            if len(self._tokens) > 1:
                self._tokens = self._tokens[0:1]
                logger.debug("token:" + str(self._tokens))

            self._tokens.append(token)
            logger.debug("token:" + str(self._tokens))
        elif behavior == "ENQUEUE":
            self._tokens.append(token)
        elif behavior == "REPLACE_ENQUEUED":
            if len(self._tokens) > 2:
                self._tokens = self._tokens[0:2]
                logger.debug("token:" + str(self._tokens))

            self._tokens.append(token)
            logger.debug("token:" + str(self._tokens))
        else:
            logger.error("error playBehavior")
            assert False

        audio_url = directive['payload']['audioItem']['stream']['url']
        if audio_url.startswith('cid:'):
            audio_file = os.path.join(tempfile.gettempdir(), audio_url[len('cid:'):] + '.bin')
            if os.path.isfile(audio_file):
                self._player.play('file://{}'.format(audio_file))
                # self.playback_started()
        else:
            self._player.play(audio_url)
            # self.playback_started()

    def playback_started(self):
        '''
        开始播放状态上报
        :return:
        '''
        self._state = 'PLAYING'
        self._offset = self._player.position

        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStarted",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStarted",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def playback_nearly_finished(self):
        '''
        播放即将结束状态上报
        :return:
        '''
        self._offset = self._player.position
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackNearlyFinished",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackNearlyFinished",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def progress_report_delay_elapsed(self):
        '''
        ProgressReportDelayElapsed事件上报
        :return:
        '''

        self._offset = self._player.position
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "ProgressReportDelayElapsed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "ProgressReportDelayElapsed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def progress_report_interval_elapsed(self):
        '''
        ProgressReportIntervalElapsed事件上报
        :return:
        '''

        self._offset = self._player.position
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "ProgressReportIntervalElapsed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        elif self._invalid_token:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "ProgressReportIntervalElapsed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": "xxxxxxxxxx",
                    "offsetInMilliseconds": self._offset
                }
            }
        elif self._invalid_offset_in_millisecond:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "ProgressReportIntervalElapsed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": -1
                }
            }
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "ProgressReportIntervalElapsed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def playback_stutter_started(self):
        '''
        PlaybackStutterStarted事件上报
        :return:
        '''
        self._state = 'BUFFER_UNDERRUN'
        self._offset = self._player.position
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStutterStarted",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStutterStarted",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset,
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def playback_stutter_finished(self):
        '''
        PlaybackStutterFinished事件上报
        :return:
        '''
        self._state = 'PLAYING'
        self._offset = self._player.position
        if self._stutter_duration_in_milliseconds:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStutterFinished",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset,
                    "stutterDurationInMilliseconds": None
                }
            }
            self._stutter_duration_in_milliseconds = False
        elif self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStutterFinished",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStutterFinished",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset,
                    "stutterDurationInMilliseconds": self._player.stutter_duration
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def playback_finished(self):
        '''
        播放结束事件上报
        :return:
        '''
        self._state = 'FINISHED'
        self._offset = self._player.position
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackFinished",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackFinished",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self._tokens = self._tokens[1:len(self._tokens)]
        logger.debug("tokens:" + str(self._tokens))
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def playback_failed(self):
        '''
        播放失败
        :return:
        '''
        self._state = 'STOPPED'
        self._offset = self._player.position
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackFailed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackFailed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "currentPlaybackState": {
                        "token": self._tokens[0],
                        "offsetInMilliseconds": self._offset,
                        "playerActivity": self._state
                    },
                    "error": {
                        "type": self._player.error_type,
                        "message": self._player.error_message
                    }
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))
        self.iflyos.unparsed_directive = 'Play'
        self.iflyos.error['type'] = self._player.error_type
        self.iflyos.error['message'] = self._player.error_message

    def stop(self, directive):
        '''
        停止(云端directive name方法)
        :param directive: 云端下发directive
        :return:
        '''
        self._player.stop()
        # self.playback_stopped()

    def playback_stopped(self):
        '''
        播放结束状态上报
        :return:
        '''
        self._state = 'STOPPED'
        self._offset = self._player.position

        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStopped",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackStopped",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self._tokens = self._tokens[1:len(self._tokens)]
        logger.debug("tokens:" + str(self._tokens))
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def pause(self):
        '''
        暂停播放
        :return:
        '''
        self._player.pause()
        # self.playback_paused()

    def playback_paused(self):
        '''
        播放暂停状态上报
        :return:
        '''
        self._state = 'PAUSED'
        self._offset = self._player.position

        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackPaused",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackPaused",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def resume(self):
        '''
        恢复播放
        :return:
        '''
        self._player.resume()
        # self.playback_resumed()

    def playback_resumed(self):
        '''
        播放恢复状态上报
        :return:
        '''
        self._state = 'PLAYING'
        self._offset = self._player.position

        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackResumed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackResumed",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": self._tokens[0],
                    "offsetInMilliseconds": self._offset
                }
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def next(self, directive):
        '''
        下一首(云端directive name方法)
        :param directive: 云端下发directive
        :return:
        '''
        self._player.next()
        # self.playback_stopped()
        # self.playback_started()

    def previous(self, directive):
        '''
        上一首(云端directive name方法)
        :param directive: 云端下发directive
        :return:
        '''
        self._player.previous()
        # self.playback_stopped()
        # self.playback_started()

    def clear_queue(self, directive):
        '''
        播放队列清除(云端directive name方法)
        :param directive: 云端下发directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "AudioPlayer",
        #            "name": "ClearQueue",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "clearBehavior": "{{STRING}}"
        #        }
        #    }
        # }
        self.playback_queue_cleared()
        behavior = directive['payload']['clearBehavior']
        self.audio_player_queue.put(behavior)
        if behavior == 'CLEAR_ALL':
            self._player.stop()
        elif behavior == 'CLEAR_ENQUEUED':
            pass

    def playback_queue_cleared(self):
        '''
        播放队列数据清除事件上报
        :return:
        '''
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackQueueCleared",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackQueueCleared",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {}
            }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_offset = self._offset
        self.context_state = self._state
        self.context_tokens = self._tokens
        logger.debug("context_tokens:" + str(self.context_tokens))

    def stream_metadata_extracted(self):
        '''
        StreamMetadataExtracted事件上报
        :return:
        '''
        if self._empty_payload:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "StreamMetadataExtracted",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                }
            }
            self._empty_payload = False
        else:
            event = {
                "header": {
                    "namespace": self.namespace,
                    "name": "StreamMetadataExtracted",
                    "messageId": uuid.uuid4().hex
                },
                "payload": {
                    "token": "{{STRING}}",
                    "metadata": {
                        "songName": self._player.song_info.song_name,
                        "singer": self._player.song_info.singer,
                        "album": self._player.song_info.album,
                    }
                }
            }
        self.iflyos.send_event(event)

    def set_offset(self, offset):
        '''
        设置偏移量，主要为了改变上下文，测试用
        :return:
        '''
        self._player.seek(offset)

    def set_player_activity(self, state):
        '''
        设置播放器状态，主要为了改变上下文，测试用
        :return:
        '''
        self._state = state

    def set_token(self, token):
        '''
        设置音频token，主要为了改变上下文，测试用
        :return:
        '''
        self._tokens[0] = token
        logger.debug("tokens:" + str(self._tokens))

    def set_playback_empty_payload(self):
        '''
        设置空payload标志，测试用
        :return:
        '''
        self._empty_payload = True

    def set_invalid_token(self):
        '''
        设置非法token标志，测试用
        :return:
        '''
        self._invalid_token = True

    def set_invalid_offset_in_millisecond(self):
        '''
        设置非法token标志，测试用
        :return:
        '''
        self._invalid_offset_in_millisecond = True

    def set_empty_playback_stutter_duration_in_milliseconds(self):
        '''
        设置空stutter_duration_in_milliseconds标志，测试用
        :return:
        '''
        self._stutter_duration_in_milliseconds = True

    @property
    def state(self):
        '''
        获取播放器状态
        :return:
        '''
        return self._state

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        if self.context_state != 'PLAYING':
            self.context_offset = 0
        else:
            self.context_offset = self._player.position

        if len(self.context_tokens) == 0:
            return {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackState"
                },
                "payload": {
                    "token": "",
                    "offsetInMilliseconds": self.context_offset,
                    "playerActivity": self.context_state
                }
            }
        else:
            return {
                "header": {
                    "namespace": self.namespace,
                    "name": "PlaybackState"
                },
                "payload": {
                    "token": self.context_tokens[0],
                    "offsetInMilliseconds": self.context_offset,
                    "playerActivity": self.context_state
                }
            }
