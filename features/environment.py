# -*- coding: utf-8 -*-
'''
environment.py is pre-process and post-process for all step implementation files

'''
import logging

from common.comm.alexa_client import IFlyOSClient
from common.input.system_external_event import *
from common.output.actual_result import ActualResult
from common.output.expected_result import ExpectedResult
from common.test_input import TestInput

try:
    os.mkdir("logs")
except FileExistsError:
    pass

try:
    os.mkdir("reports")
except FileExistsError:
    pass

logging.basicConfig(level=logging.INFO,
                    format=u'%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    filename='logs/event_service_test.log',
                    filemode='w',
                    )

# Suppress overly verbose logs from libraries that aren't helpful
logging.getLogger('requests').setLevel(logging.WARNING)
logging.getLogger('urllib3').setLevel(logging.WARNING)
logging.getLogger('aiohttp.access').setLevel(logging.WARNING)
logging.getLogger("parser").setLevel(logging.WARNING)
logging.getLogger("connectionpool").setLevel(logging.WARNING)
logging.getLogger("hpack").setLevel(logging.WARNING)
logging.getLogger("connection").setLevel(logging.WARNING)

# create logger
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


class PlatformNotSupportedError(Exception):
    pass


def before_all(context):

    # create communication channels
    context.comm_client = IFlyOSClient()

    # create test module objects
    context.TI = TestInput()  # iflyos api test input object
    context.TI.sysExtEvt = SystemExternalEvent(context.comm_client)  # iflyos api system external input object
    context.ER = ExpectedResult()  # iflyos api expected result object
    context.AR = ActualResult(context.comm_client)  # event service api actual result object

    context.fs = open("logs/speech_records.log", "tw")


def after_all(context):
    context.fs.close()

    context.fs = open("logs/speech_records.log", "tr")
    voice_content = context.fs.read()
    context.fs.close()

    voice_content = voice_content.replace(",", "").replace("，", "").replace("。", "").replace("?", "").replace("？",
                                                                                                              "").replace(
        "(", "").replace(")", "").replace("（", "").replace("）", "").replace("《", "").replace('》', "").replace('~',
                                                                                                              "").replace(
        "！", "").replace("!", "").replace("TTS:", "").replace("Recognize:", "")
    voice_len = len(voice_content)
    context.fs = open("logs/speech_records.log", "ta")
    context.fs.write('voice_content len :{} seconds\n'.format(voice_len))
    context.fs.write('voice_content total time :{} seconds\n'.format(voice_len * 0.2))
    context.fs.close()


def before_feature(context, feature):
    pass


def after_feature(context, feature):
    pass


def before_scenario(context, scenario):
    pass


def after_scenario(context, scenario):
    context.execute_steps('''
            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
            那么      iFlyOS服务端回复状态为【200】成功
            ''')

    if 'Alerts' in scenario.tags and scenario.name.find("清空") < 0 and scenario.name.find(
            "删除") < 0 and scenario.name.find("停止") < 0:
        try:
            context.execute_steps('''
                        # 模拟用户说出【删除所有闹钟】的识别过程
                        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【删除全部闹钟】
                        那么      iFlyOS服务端回复状态为【200】成功
                        # 服务端下发意图
                        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                        那么      iFlyOS服务端回复状态为【200】成功
            
                        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
                        当       iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
                        那么      iFlyOS服务端回复状态为【200】成功
            ''')
        except BaseException:
            logger.warning("delete all alerts fail")

    context.comm_client.clear_result_queue()
    context.comm_client.iflyos.stop()
    pass


def before_step(context, step):
    pass


def after_step(context, step):
    pass
