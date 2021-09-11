# -*- coding: utf-8 -*-

"""
指令分发模块
"""

import cgi
import json
import logging

try:
    import Queue as queue
except ImportError:
    import queue

import uuid

from .capability_agents.alerts import Alerts
from .capability_agents.audio_player import AudioPlayer
from .capability_agents.bluetooth import Bluetooth
from .capability_agents.notifications import Notifications
from .capability_agents.playback_controller import PlaybackController
from .capability_agents.settings import Settings
from .capability_agents.speaker import Speaker
from .capability_agents.speech_recognizer import SpeechRecognizer
from .capability_agents.speech_synthesizer import SpeechSynthesizer
from .capability_agents.system import System
from .capability_agents.template_runtime import TemplateRuntime

from .capability_agents.xf_speech_recognizer import XFSpeechRecognizer
from sdk.activity_focus_manager_library.audio_activity_tracker import AudioActivityTracker
from .capability_agents.configuration import Configuration
from .capability_agents.custom_app import Custom
from .capability_agents.do_not_disturb import DoNotDisturb
from .capability_agents.infrared import Infrared
from sdk.activity_focus_manager_library.visual_acitvity_tracker import VisualActivityTracker
from .capability_agents.wake_word import WakeWord
from .activity_focus_manager_library.activity_focus_manager_library import ActivityFocusManagerLibrary


from .capabilities import Capabilities

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

class Singleton(type):
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs)
        # else:
        #     cls._instances[cls].__init__(*args, **kwargs)
        return cls._instances[cls]


class DirectiveSequencer(metaclass=Singleton):
    def __init__(self, player, iflyos, daemon=True):
        self._iflyos = iflyos
        self.alerts = Alerts(iflyos, player)
        self.capabilities = Capabilities()
        self.audio_player = AudioPlayer(iflyos, player)
        self.bluetooth = Bluetooth(iflyos)
        self.notifications = Notifications(iflyos, player)
        self.playback_controller = PlaybackController(iflyos, player)
        self.settings = Settings(iflyos)
        self.speaker = Speaker(iflyos, player)
        self.speech_recognizer = SpeechRecognizer(iflyos)
        self.speech_synthesizer = SpeechSynthesizer(iflyos, player)
        self.system = System(iflyos)
        self.template_runtime = TemplateRuntime(iflyos)
        self.xf_speech_recognizer = XFSpeechRecognizer()
        self.audio_activity_tracker = AudioActivityTracker(iflyos)
        self.configuration = Configuration(iflyos)
        self.custom = Custom(iflyos)
        self.do_not_disturb = DoNotDisturb(iflyos)
        self.infrared = Infrared(iflyos)
        self.visual_activity_tracker = VisualActivityTracker(iflyos)
        self.wake_word = WakeWord(iflyos)

        self.audio_focus_manager = ActivityFocusManagerLibrary(ActivityFocusManagerLibrary.get_default_audio_channels(), self.audio_activity_tracker)
        self.visual_focus_manager = ActivityFocusManagerLibrary(ActivityFocusManagerLibrary.get_default_visual_channels(), self.visual_activity_tracker)


        self.on_boundary = False
        self.on_end_boundary = False
        self.in_header = False
        self.in_payload = False
        self.first_payload_block = False
        self.content_type = None
        self.content_id = None
        self.binary = None
        self.payload = None
        self.directives = []

        # 将namespace字段内容与interface中的模块进行一一对应
        self.namespace_modules = {
            "Alerts": "alerts",
            "AudioPlayer": "audio_player",
            "Bluetooth": "bluetooth",
            "Notifications": "notifications",
            "PlaybackController": "playback_controller",
            "Settings": "settings",
            "Speaker": "speaker",
            "SpeechRecognizer": "speech_recognizer",
            "SpeechSynthesizer": "speech_synthesizer",
            "System": "system",
            # Optional capabilities
            "TemplateRuntime": "template_runtime",
            "AudioActivityTracker": "audio_activity_tracker",
            "Configuration": "configuration",
            "CustomApp": "custom_app",
            "DoNotDisturb": "do_not_disturb",
            "Infrared": "infrared",
            "VisualActivityTracker": "visual_activity_tracker",
            "WakeWord": "wake_word",
        }

        # 将name字段内容与interface中的模块方法进行一一对应
        self.name_methods = {
            # 闹钟模块[alerts]
            "alerts":
                {
                    "SetAlert": self.alerts.set_alert,
                    "SetAlertSucceeded": self.alerts.set_alert_succeeded,
                    "SetAlertFailed": self.alerts.set_alert_failed,
                    "DeleteAlert": self.alerts.delete_alert,
                    "DeleteAlertSucceeded": self.alerts.delete_alert_succeeded,
                    "DeleteAlertFailed": self.alerts.delete_alert_failed,
                    "AlertStarted": self.alerts.alert_started,
                    "AlertStopped": self.alerts.alert_stopped,
                    "AlertEnteredForeground": self.alerts.alert_entered_foreground,
                    "AlertEnteredBackground": self.alerts.alert_entered_background,
                },
            # 音频播放器模块[audio_player]
            "audio_player":
                {
                    "Play": self.audio_player.play,
                    "PlaybackStarted": self.audio_player.playback_started,
                    "PlaybackNearlyFinished": self.audio_player.playback_nearly_finished,
                    "ProgressReportDelayElapsed": self.audio_player.progress_report_delay_elapsed,
                    "ProgressReportIntervalElapsed": self.audio_player.progress_report_interval_elapsed,
                    "PlaybackStutterStarted": self.audio_player.playback_stutter_started,
                    "PlaybackStutterFinished": self.audio_player.playback_stutter_finished,
                    "PlaybackFinished": self.audio_player.playback_finished,
                    "PlaybackFailed": self.audio_player.playback_failed,
                    "Stop": self.audio_player.stop,
                    "PlaybackStopped": self.audio_player.playback_stopped,
                    "PlaybackPaused": self.audio_player.playback_paused,
                    "PlaybackResumed": self.audio_player.playback_resumed,
                    "ClearQueue": self.audio_player.clear_queue,
                    "PlaybackQueueCleared": self.audio_player.playback_queue_cleared,
                    "StreamMetadataExtracted": self.audio_player.stream_metadata_extracted,
                },
            # 音乐回放模块[playback_controller]
            "playback_controller":
                {
                    "PlayCommandIssued": self.playback_controller.play_command_issued,
                    "PauseCommandIssued": self.playback_controller.pause_command_issued,
                    "NextCommandIssued": self.playback_controller.next_command_issued,
                    "PreviousCommandIssued": self.playback_controller.previous_command_issued,
                },
            # 语音输出模块[notifications]
            "notifications":
                {
                    "SetIndicator": self.notifications.set_indicator,
                    "ClearIndicator": self.notifications.clear_indicator,
                },
            # 语音输出模块[settings]
            "settings":
                {
                    "SettingsUpdated": self.settings.settings_updated,
                },
            # 扬声器控制模块[speaker]
            "speaker":
                {
                    "SetVolume": self.speaker.set_volume,
                    "AdjustVolume": self.speaker.adjust_volume,
                    "VolumeChanged": self.speaker.volume_changed,
                    "SetMute": self.speaker.set_mute,
                    "MuteChanged": self.speaker.mute_changed,
                },
            # 语音输入模块[speech_recognizer]
            "speech_recognizer":
                {
                    "Recognize": self.speech_recognizer.recognize,
                    "StopCapture": self.speech_recognizer.stop_capture,
                    "ExpectSpeech": self.speech_recognizer.expect_speech,
                    "ExpectSpeechTimedOut": self.speech_recognizer.expect_speech_timeout,
                },
            # 语音输出模块[speech_synthesizer]
            "speech_synthesizer":
                {
                    "Speak": self.speech_synthesizer.speak,
                    "SpeechStarted": self.speech_synthesizer.speech_started,
                    "SpeechFinished": self.speech_synthesizer.speech_finished,
                },
            # 系统模块[system]
            "system":
                {
                    "SynchronizeState": self.system.synchronize_state,
                    "UserInactivityReport": self.system.user_inactivity_report,
                    "ResetUserInactivity": self.system.reset_user_inactivity,
                    "SetEndpoint": self.system.set_endpoint,
                    "SoftwareInfo": self.system.software_info,
                    "ReportSoftwareInfo": self.system.report_software_info,
                    "ExceptionEncountered": self.system.exception_encountered,
                },
            # 屏幕展示模块[template_runtime]
            "template_runtime":
                {
                    "RenderTemplate": self.template_runtime.render_template,
                    "RenderPlayerInfo": self.template_runtime.render_player_info,
                },
        }

        # handle audio to speech recognizer
        self.put = self.speech_recognizer.put

    def directive_listener(self, directive_content):
        '''
        云端下发directive监听器
        :param directive_content:云端下发directive内容
        :return:
        '''
        logging.info(directive_content)

    def _dispatcher(self, directive):
        try:
            namespace = directive['header']['namespace']
            try:
                module = self.namespace_modules[namespace]
            except KeyError as e:
                logger.info('{} is not implemented yet'.format(namespace))
                self._iflyos.unhandled_directive = namespace
                self._iflyos.error['message'] = '{} is not implemented yet'.format(namespace)
                return
            except Exception as e:
                logging.error(e)
                return

            name = directive['header']['name']
            try:
                method = self.name_methods[module][name]
            except KeyError as e:
                logger.info('{}.{} is not implemented yet'.format(module, name))
                self._iflyos.unhandled_directive = name
                self._iflyos.error['message'] = '{}.{} is not implemented yet'.format(module, name)
                return
            except Exception as e:
                logging.error(e)
                return

            if hasattr(self, module):
                directive_func = method
                if directive_func:
                    directive_func(directive)
                else:
                    logger.info('{}.{} is not implemented yet'.format(module, method))
                    self._iflyos.unhandled_directive = name
                    self._iflyos.error['message'] = '{}.{} is not implemented yet'.format(module, method)
            else:
                logger.info('{} is not implemented yet'.format(module))
                self._iflyos.unhandled_directive = name
                self._iflyos.error['message'] = '{} is not implemented yet'.format(module)

        except KeyError as e:
            logger.exception(e)
        except Exception as e:
            logger.exception(e)

    def read_response_h2(self, response, boundary=None, buffer=None):
        '''
        云端回复数据读取解析
        :param response:包含http header信息
        :param boundary:multipart boundary
        :param buffer:包含http body数据
        :return:
        '''
        if boundary is None and buffer is None:
            source_channel = "event_channel"
        else:
            source_channel = "down_channel"

        if boundary:
            endboundary = boundary + b"--"
        else:
            ctype, pdict = cgi.parse_header(
                response.headers['content-type'][0].decode('utf-8'))
            boundary = "--{}".format(pdict['boundary']).encode('utf-8')
            endboundary = "--{}--".format(pdict['boundary']).encode('utf-8')

        def iter_lines(response, delimiter=None):
            pending = None
            for chunk in response.read_chunked():
                # logger.debug("Chunk size is {}".format(len(chunk)))
                if pending is not None:
                    chunk = pending + chunk
                if delimiter:
                    lines = chunk.split(delimiter)
                else:
                    lines = chunk.splitlines()

                if lines and lines[-1] and chunk and lines[-1][-1] == chunk[-1]:
                    pending = lines.pop()
                else:
                    pending = None

                for line in lines:
                    yield line

            if pending is not None:
                yield pending

        # cache them up to execute after we've downloaded any binary attachments
        # so that they have the content available
        if isinstance(response, bytes):
            buffer.seek(0)
            lines = (buffer.read() + response).split(b"\r\n")
            buffer.flush()
        else:
            lines = iter_lines(response, delimiter=b"\r\n")

        count_blank = 0

        for line in lines:
            # line = line[:line.find(b"\r\n")]
            logger.debug("iter_line is {}...".format(repr(line)[0:50]))

            if line == b"":
                count_blank += 1
            else:
                count_blank = 0

            if count_blank == 1:
                continue

            # state machine switching
            if line == boundary:
                logger.debug("Newly on boundary")
                self.in_payload = False
                self.on_boundary = True
            elif line == endboundary:
                logger.debug("End boundary")
                self.on_end_boundary = True
                self.on_boundary = True
            elif self.on_boundary:
                logger.debug("Now in header")
                self.on_boundary = False
                self.in_header = True
                self.on_end_boundary = False
            elif self.in_header and line == b"" and count_blank > 1:
                logger.debug("Found end of header")
                self.in_header = False
                self.in_payload = True
                self.first_payload_block = True
                self.on_end_boundary = False
                continue

            if self.on_boundary and source_channel == "down_channel":
                if len(self.directives) > 0:
                    if self.content_id is not None:
                        self._iflyos.down_channel_result_queue.put(
                            (self.directives, 'output_audio/{}.bin'.format(self.content_id),))
                        logger.debug("put down_channel_directives:" + str(self.directives))
                        logger.debug("put down_channel_binary:" + 'output_audio/{}.bin'.format(self.content_id))
                        logger.debug(
                            "down_channel_result_queue len:" + str(self._iflyos.down_channel_result_queue._qsize()))
                    else:
                        self._iflyos.down_channel_result_queue.put((self.directives, None,))
                        logger.debug("down_channel_directives:" + str(self.directives))
                        logger.debug(
                            "down_channel_result_queue len:" + str(self._iflyos.down_channel_result_queue._qsize()))
                    self._iflyos.down_channel_event.set()
                self.payload = None
                self.binary = None
                self.content_id = None
                self.content_type = None
                self.directives = []
            elif self.on_end_boundary and source_channel == "event_channel":
                if len(self.directives) > 0:
                    self._iflyos.event_channel_result_queue.put(
                        (200, self.directives, 'output_audio/{}.bin'.format(self.content_id),))
                    logger.debug("put event_channel_directives:" + str(self.directives))
                    logger.debug("put event_channel_binary:" + 'output_audio/{}.bin'.format(self.content_id))
                    logger.debug(
                        "event_channel_result_queue len:" + str(self._iflyos.event_channel_result_queue._qsize()))
                else:
                    self._iflyos.event_channel_result_queue.put((204, None, None,))
                    logger.debug(
                        "event_channel_result_queue len:" + str(self._iflyos.event_channel_result_queue._qsize()))
                self.payload = None
                self.binary = None
                self.content_id = None
                self.content_type = None
                self.directives = []
            elif self.in_header:
                # logger.debug(repr(line))
                if len(line) > 1:
                    header, value = line.decode('utf-8').split(":", 1)
                    ctype, pdict = cgi.parse_header(value)
                    if header.lower() == "content-type":
                        self.content_type = ctype
                    if header.lower() == "content-id":
                        self.content_id = ctype
            elif self.in_payload:
                # add back the bytes that our iter_lines consumed
                logger.info("Found %s bytes of %s %s, first_payload_block=%s",
                            len(line), self.content_id, self.content_type, self.first_payload_block)
                if self.first_payload_block:
                    self.first_payload_block = False

                if self.content_type == "application/json":
                    logger.info("Finished downloading JSON")
                    self.payload = line
                    utf8_payload = self.payload.decode('utf-8')
                    if utf8_payload:
                        json_payload = json.loads(utf8_payload)
                        if 'directive' in json_payload:
                            directive = json_payload['directive']
                            logger.debug(json.dumps(directive, indent=4))
                            self.directives.append(directive)
                            self._dispatcher(directive)
                elif self.content_type == "application/octet-stream":
                    logger.info("Finished downloading {} which is {}".format(self.content_type, self.content_id))

                    # TODO, start to stream this to speakers as soon as we start getting bytes
                    # strip < and >
                    start_pos = self.content_id.find('<')
                    if start_pos < 0:
                        start_pos = 0
                    end_pos = self.content_id.find('>')
                    if end_pos < 0:
                        end_pos = len(self.content_id)
                    self.content_id = self.content_id[start_pos + 1:end_pos]
                    data = line
                    if self.binary is None:
                        self.binary = data
                    else:
                        self.binary += data
                    with open('output_audio/{}.bin'.format(self.content_id), "ab+") as f:
                        f.write(data)
                    logger.info('write audio to {}.bin'.format(self.content_id))

    # def recognize(self):
    #     self.speech_recognizer.recognize()

    def exception_event(self, interface, event):

        event = {
            "header": {
                "namespace": interface,
                "name": event,
                "messageId": uuid.uuid4().hex
            },
            "payload": {
            }
        }
        self._iflyos.send_event(event)

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        context = []
        capabilities = self.capabilities.get_capabilities()
        for cap_str in capabilities:
            for namespace, module in self.namespace_modules.items():
                if namespace in cap_str:
                    cap  = getattr(self, module)
                    if hasattr(cap, "context"):
                        context.append(cap.context)


        return context
