# -*- coding: utf-8 -*-
'''
语音输出模块(TTS)
'''
import os
import tempfile
import threading
import uuid


class SpeechSynthesizer(object):
    '''
    语音输出模块功能类
    '''
    STATES = {'PLAYING', 'FINISHED'}

    def __init__(self, iflyos, player):
        '''
        类初始化
        :param iflyos:iflyos核心模块实例
        :param player: 播放器实例
        '''
        self.namespace = 'SpeechSynthesizer'
        self.iflyos = iflyos
        self.token = ''
        self.state = 'FINISHED'
        self.context_token = ''
        self.context_state = 'FINISHED'
        self._offset = 0
        self.context_offset = 0
        self.finished = threading.Event()

        self.player = player
        self.player.add_callback('eos', self.speech_finished)
        self.player.add_callback('error', self.speech_finished)

    def stop(self):
        '''
        停止播放
        :return:
        '''
        self.finished.set()
        self.player.stop()
        self.state = 'FINISHED'

    def speak(self, directive):
        '''
        播放TTS(云端directive　name方法)
        :param directive: 云端下发directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "SpeechSynthesizer",
        #            "name": "Speak",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "url": "{{STRING}}",
        #            "format": "{{STRING}}",
        #            "token": "{{STRING}}"
        #        }
        #    }
        # }
        # directive from iflyos may not have the dialogRequestId
        if 'dialogRequestId' in directive['header']:
            dialog_request_id = directive['header']['dialogRequestId']
            if self.iflyos.directive_sequencer.speech_recognizer.dialog_request_id != dialog_request_id:
                return

        self.token = directive['payload']['token']
        #audio_format = directive['payload']['format']
        #if audio_format == "AUDIO_L16_RATE_16000_CHANNELS_1":
        #    suffix = "wav"
        #elif audio_format == "AUDIO_OPUS_RATE_16000_CHANNELS_1":
        #    suffix = "opus"
        #else:
        #    suffix = "bin"

        #url = directive['payload']['url']

        #if url.startswith('cid:'):
        #    audio_file = os.path.join(tempfile.gettempdir(), url[len('cid:'):] + '.' + suffix)
        #    if os.path.isfile(audio_file):
        #        self.finished.clear()
        #        self.player.play('file://{}'.format(audio_file))
        #        self.speech_started()

        #        self.iflyos.state_listener.on_speaking()

        #        # will be set at SpeechFinished() if the player reaches the End Of Stream or gets a error
        #        self.finished.wait()

        #        os.system('rm -rf "{}"'.format(audio_file))

    def speech_started(self):
        '''
        speech开始状态上报
        :return:
        '''
        self.state = 'PLAYING'
        self._offset = self.player.position
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "SpeechStarted",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self.token
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_state = self.state
        self.context_offset = self._offset
        self.context_token = self.token

    def speech_finished(self):
        self.iflyos.state_listener.on_finished()

        self.finished.set()
        self.state = 'FINISHED'
        self._offset = self.player.position
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "SpeechFinished",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self.token
            }
        }
        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_state = self.state
        self.context_offset = self._offset
        self.context_token = self.token

    def set_token(self, token):
        '''
        设置音频token，主要为了改变上下文，测试用
        :return:
        '''
        self.token = token

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''

        return {
            "header": {
                "namespace": self.namespace,
                "name": "SpeechState"
            },
            "payload": {
                "token": self.context_token,
                "offsetInMilliseconds": self.context_offset,
                "playerActivity": self.context_state
            }
        }
