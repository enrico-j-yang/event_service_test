# -*- coding: utf-8 -*-
'''
skills.py is step implementation file for skills.feature

'''

import logging
import time

try:
    import Queue as queue
except ImportError:
    import queue

from behave import *

import sdk.configurate as configuration
from global_variables import *
from sdk.auth import iFlyOSAuth


#### Given

@given(u'用户产品【{skill}】技能已打开')
def step_impl(context, skill):
    pass


@given(u'用户未绑定iFlyOS客户端设备')
def step_impl(context):
    if os.path.isfile(".iflyos.json"):
        os.remove(".iflyos.json")


@given(u'用户已绑定iFlyOS客户端设备')
def step_impl(context):
    if not hasattr(context, "client_id") or not hasattr(context, "client_secret"):
        context.client_id = CLIENT_ID
        context.client_secret = CLIENT_SECRET

    # 用户授权绑定
    context.auth = iFlyOSAuth(configuration.DEFAULT_CONFIG_FILE, client_id=context.client_id,
                              client_secret=context.client_secret)
    context.auth.auth_request()

    context.comm_client.iflyos.start()


@given(u'用户已有产品')
def step_impl(context):
    pass


@given(u'用户已有带屏产品')
def step_impl(context):
    if hasattr(context, "client_id") and hasattr(context, "client_secret"):
        if context.client_id == "329b67ef-1670-4c9d-ae2c-e52c4d2a4d13" and os.path.isfile(".iflyos.json"):
            pass
        else:
            context.client_id = "329b67ef-1670-4c9d-ae2c-e52c4d2a4d13"
            context.client_secret = "d241a5de-d1c4-413d-9bb6-1ceb54f5ba63"
            os.remove(".iflyos.json")
    else:
        context.client_id = "329b67ef-1670-4c9d-ae2c-e52c4d2a4d13"
        context.client_secret = "d241a5de-d1c4-413d-9bb6-1ceb54f5ba63"
        if os.path.isfile(".iflyos.json"):
            os.remove(".iflyos.json")


@given(u'用户已有无屏产品')
def step_impl(context):
    if hasattr(context, "client_id") and hasattr(context, "client_secret"):
        if context.client_id == "36c76d33-0747-423d-80a5-198cdba63ae0" and os.path.isfile(".iflyos.json"):
            pass
        else:
            context.client_id = "36c76d33-0747-423d-80a5-198cdba63ae0"
            context.client_secret = "3136e912-f8c0-4904-993d-1b62143ce464"
            os.remove(".iflyos.json")
    else:
        context.client_id = "36c76d33-0747-423d-80a5-198cdba63ae0"
        context.client_secret = "3136e912-f8c0-4904-993d-1b62143ce464"
        if os.path.isfile(".iflyos.json"):
            os.remove(".iflyos.json")


@given(u'用户已有红外产品')
def step_impl(context):
    if hasattr(context, "client_id") and hasattr(context, "client_secret"):
        if context.client_id == "cde5240d-bf45-48bb-a5c7-cce73c16ab3a"  and os.path.isfile(".iflyos.json"):
            pass
        else:
            context.client_id = "cde5240d-bf45-48bb-a5c7-cce73c16ab3a"
            context.client_secret = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            os.remove(".iflyos.json")
    else:
        context.client_id = "cde5240d-bf45-48bb-a5c7-cce73c16ab3a"
        context.client_secret = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        if os.path.isfile(".iflyos.json"):
            os.remove(".iflyos.json")


@given(u'设备已经绑定红外家电的灯')
def step_impl(context):
    pass


@given(u'用户产品【不上报】端能力')
def step_impl(context):
    pass


@given(u'用户产品【{report_switch}】端能力，端能力为【{capability_name}】且版本号为【{capability_version}】')
def step_impl(context, report_switch, capability_name, capability_version="1.0"):
    capability_list = {
        "闹钟": "Alerts",
        "音频播放器": "AudioPlayer",
        "播放控制": "PlaybackController",
        "喇叭": "Speaker",
        "语音识别": "SpeechRecognizer",
        "语音合成": "SpeechSynthesizer",
        "系统": "System",
        "设置": "Settings",
        "模板": "TemplateRuntime",
        "蓝牙": "Bluetooth",
        "免打扰": "DoNotDisturb",
        "唤醒词": "iFLYOS.WakeWord",
        "云端配置": "Configuration",
        "咪咕音乐": "AppMigu",
        "红外": "iFLYOS::Transparent::Infrared",
        "自定义": "CustomApp",
        "视觉焦点": "VisualActivityTracker",
        "音频焦点": "AudioActivityTracker"}
    # 设备端能力
    if report_switch == "不上报":
        pass

    elif report_switch == "上报":
        if capability_list.__contains__(capability_name):
            context.comm_client.iflyos.directive_sequencer.capabilities.add_capabilities(capability_list[capability_name], capability_version)
        else:
            context.comm_client.iflyos.directive_sequencer.capabilities.default_capabilities()


@given(u'用户使用已发布的客户端设备')
def step_impl(context):
    context.comm_client.clear_result_queue()
    context.comm_client.iflyos.stop()

    if os.path.isfile(".iflyos.json"):
        os.remove(".iflyos.json")

    # get oauth token for api test
    auth = iFlyOSAuth(output=configuration.DEFAULT_CONFIG_FILE)
    auth.auth_request()
    context.comm_client.iflyos.start()


@given(u'用户使用未发布的客户端设备')
def step_impl(context):
    context.comm_client.clear_result_queue()
    context.comm_client.iflyos.stop()

    new_clientid = "9e413c38-731c-4d69-a380-8ead6cdf34fa"

    if os.path.isfile(".iflyos.json"):
        os.remove(".iflyos.json")

    # get oauth token for api test
    auth = iFlyOSAuth(output=configuration.DEFAULT_CONFIG_FILE, client_id=new_clientid)
    auth.auth_request(client_id=new_clientid)
    context.comm_client.iflyos.start()


@given(u'用户使用的客户端设备从未上传过端能力')
def step_impl(context):
    context.comm_client.clear_result_queue()
    context.comm_client.iflyos.stop()

    # FM测试脚本从未上传过端能力
    new_clientid = "4c819994-c98a-46ce-88bd-f0ca97354f7a"

    if os.path.isfile(".iflyos.json"):
        os.remove(".iflyos.json")

    # get oauth token for api test
    auth = iFlyOSAuth(output=configuration.DEFAULT_CONFIG_FILE, client_id=new_clientid)
    auth.auth_request(client_id=new_clientid)
    context.comm_client.iflyos.start()


@given(u'用户使用的客户端设备使用咪咕音乐')
def step_impl(context):
    context.comm_client.clear_result_queue()
    context.comm_client.iflyos.stop()

    # 小沃音箱的client_id
    new_clientid = "54f8873c-1db4-4588-9bd3-9eaa30149fec"

    if os.path.isfile(".iflyos.json"):
        os.remove(".iflyos.json")

    # get oauth token for api test
    auth = iFlyOSAuth(output=configuration.DEFAULT_CONFIG_FILE, client_id=new_clientid)
    auth.auth_request(client_id=new_clientid)
    context.comm_client.iflyos.start()


@given(u'iFlyOS客户端正在播放音乐')
def step_impl(context):
    context.execute_steps('''
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】，使用以下PlaybackState上下文
            | token | offsetInMilliseconds | playerActivity |
            | NULL  | 0                    | STOPPED        |
        那么      iFlyOS服务端回复状态为【200】成功
        
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦       |
            | 稻香         |
            
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
    ''')


@given(u'iFlyOS客户端正在播放流式音乐')
def step_impl(context):
    context.execute_steps('''
        # 模拟用户说出【我要听周杰伦的歌】
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】，使用以下PlaybackState上下文
            | token | offsetInMilliseconds | playerActivity |
            | NULL  | 0                    | STOPPED        |
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦       |
            | 稻香        |
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
    ''')


@given(u'iFlyOS客户端正在播放链接音乐')
def step_impl(context):
    context.execute_steps('''
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦       |
            | 稻香        |
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
    ''')


@given(u'iFlyOS客户端音乐正在缓冲')
def step_impl(context):
    context.execute_steps('''
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦       |
            | 稻香        |
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
    ''')


@given(u'iFlyOS客户端已经打开成语接龙')
def step_impl(context):
    context.execute_steps('''
        # 模拟用户说出【打开成语接龙】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开成语接龙】
        那么      iFlyOS服务端回复状态为【200】成功
        # 只要进入技能后是不追问而且不结束session的就会下发AudioPlayer的stop
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【成语接龙】
        #那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【我先开始】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我先开始】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 请先给我一个成语吧，比如：|
            | 那请先跟我说一个成语哦，比如：|
        #那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
    ''')


@given(u'iFlyOS客户端在【{offset}】暂停播放了音乐')
def step_impl(context, offset):
    context.execute_steps('''
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【暂停】
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【暂停】
        那么      iFlyOS服务端回复状态为【200】成功
        
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 回复停止播放状态
        当       iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】，参数【offsetInMilliseconds】为【''' + offset + '''】
        那么      iFlyOS服务端回复状态为【200】成功

        # 当        iFlyOS客户端发送查询状态请求
        # 那么      iFlyOS服务端音乐播放器状态为【STOP】
    ''')


@given(u'iFlyOS客户端音量为【{volume}%】')
def step_impl(context, volume):
    context.execute_steps('''
        # 模拟用户说出【把音量设置为''' + volume + '''】
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【把音量设置为''' + volume + '''】
        那么      iFlyOS服务端回复状态为【200】成功
        ''')
    if int(volume) < 5:
        context.execute_steps('''
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【5】
        ''')
    elif int(volume) > 100:
        context.execute_steps('''
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【100】
        ''')
    else:
        context.execute_steps('''
         # 服务端下发意图
         那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【''' + volume + '''】
          ''')
    if int(volume) <= 10 or int(volume) >= 90:
        context.execute_steps('''
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【音量】
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
         ''')
    context.execute_steps('''
        # 回复音量变更状态
        当      iFlyOS客户端发送event【Speaker】，【VolumeChanged】
        那么    iFlyOS服务端回复状态为【200】成功
        ''')


@given(u'iFlyOS客户端已设置【{time}】的闹钟')
def step_impl(context, time):
    context.execute_steps('''
        # 模拟用户说出【提醒我中午十二点吃饭】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + time + '''】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        #那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】为【闹钟】，参数【textField】不为空，参数【subtextField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content|
            | 闹钟        |
            | 提醒        |
            | 叫你        |
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】
        当       iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功
    ''')


@given(u'用户产品技能全部未选定')
def step_impl(context):
    logging.warning(u'用户产品技能全部未选定' + 'not implemented')
    pass


@given(u'用户产品【{skill}】技能未打开')
def step_impl(context, skill):
    logging.warning(u'用户产品技能未打开' + 'not implemented')
    pass


@given(u'iFlyOS客户端正在播放有声点播')
def step_impl(context):
    logging.warning(u'iFlyOS客户端正在播放有声点播' + 'not implemented')
    pass


@given(u'用户已退出会话')
def step_impl(context):
    context.execute_steps('''
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        ''')


@given(u'用户已添加订阅内容【{content}】')
def step_impl(context, content):
    context.execute_steps('''
        # 模拟用户说出【订阅汽车简报】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【订阅''' + content + '''】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么     iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已帮你订阅''' + content + '''】
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功
        ''')


@given(u'用户已删除所有订阅号')
def step_impl(context):
    context.execute_steps('''
        # 模拟用户说出【删除所有订阅号】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【删除所有订阅号】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已为你删除所有的订阅号】
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        ''')


#### When


@when(u'iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【{voice_content}】，使用以下PlaybackState上下文')
def step_impl(context, voice_content):
    iflyos_context = {'PlaybackState': {}}
    playback_state = iflyos_context['PlaybackState']
    for row in context.table:
        if row['token'] == "NULL":
            playback_state['token'] = ""

        playback_state['offsetInMilliseconds'] = row['offsetInMilliseconds']
        playback_state['playerActivity'] = row['playerActivity']
    context.TI.sysExtEvt.set_context(iflyos_context)
    context.fs.write('Recognize:' + voice_content + '\n')
    context.TI.sysExtEvt.recognize(voice_content)


@when(u'iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【{voice_content}】')
def step_impl(context, voice_content):
    context.fs.write('Recognize:' + voice_content + '\n')
    context.TI.sysExtEvt.recognize(voice_content)


@when(u'iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【offsetInMilliseconds】为【{position}】')
def step_impl(context, position):
    context.TI.sysExtEvt.comm_channel.player.seek(position)
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['AudioPlayer']
    if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module]['PlaybackStarted']()


@when(u'iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【token】为错误值')
def step_impl(context):
    context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.player.set_token(INVALID_AUDIO_TOKEN)
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['AudioPlayer']
    if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module]['PlaybackStarted']()


@when(u'iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【{position}】')
def step_impl(context, position):
    context.TI.sysExtEvt.comm_channel.player.seek(position)
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['AudioPlayer']
    if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module]['PlaybackPaused']()


@when(u'iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】，参数【offsetInMilliseconds】为【{position}】')
def step_impl(context, position):
    context.TI.sysExtEvt.comm_channel.player.seek(position)
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['AudioPlayer']
    if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module]['PlaybackPaused']()


@when(u'iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】，参数【offsetInMilliseconds】为【{position}】')
def step_impl(context, position):
    context.TI.sysExtEvt.comm_channel.player.seek(position)
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['AudioPlayer']
    if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module]['PlaybackStopped']()


@when(u'iFlyOS客户端发送event【AudioPlayer】，【ProgressReportIntervalElapsed】，参数【token】为错误值')
def step_impl(context):
    context.TI.sysExtEvt.set_invalid_audio_player_token()
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['AudioPlayer']
    if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module][
            'ProgressReportIntervalElapsed']()


@when(u'iFlyOS客户端发送event【AudioPlayer】，【ProgressReportIntervalElapsed】，参数【offsetInMilliseconds】为负数')
def step_impl(context):
    context.TI.sysExtEvt.set_invalid_offset_in_millisecond()
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['AudioPlayer']
    if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module][
            'ProgressReportIntervalElapsed']()


@when(u'iFlyOS客户端音乐播放器定位到【{position}】')
def step_impl(context, position):
    context.TI.sysExtEvt.comm_channel.player.seek(position)


@when(u'iFlyOS客户端发送event【{interface}】，【{event}】')
def step_impl(context, interface, event):
    if context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules.get(interface) is None:
        # send illegal event with wrong namespace
        context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.exception_event(interface, event)
    else:
        module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules[interface]
        if hasattr(context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer, module):
            if context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module].get(event) is None:
                # send illegal event with wrong name
                context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.exception_event(interface, event)
            else:
                # send normal event
                context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module][event]()


@when(u'用户等待{duration}秒')
def step_impl(context, duration):
    time.sleep(int(duration))


@when(u'iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】，参数【token】为错误值')
def step_impl(context):
    body = {'payload': {}}
    payload = body['payload']
    payload['token'] = INVALID_AUDIO_TOKEN

    context.TI.sysExtEvt.set_body(body)
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['SpeechSynthesizer']
    context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module]['SpeechStarted']()


@when(u'iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】，参数【token】为错误值')
def step_impl(context):
    body = {'payload': {}}
    payload = body['payload']
    payload['token'] = INVALID_AUDIO_TOKEN

    context.TI.sysExtEvt.set_body(body)
    module = context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.namespace_modules['SpeechSynthesizer']
    context.TI.sysExtEvt.comm_channel.iflyos.directive_sequencer.name_methods[module]['SpeechFinished']()


@when(u'iFlyOS客户端发送查询状态请求')
def step_impl(context):
    context.TI.sysExtEvt.query_state()


@when(u'用户记录iFlyOS服务端音量')
def step_impl(context):
    context.volume = context.AR.comm_channel.get_key_value_from_json_body('speaker/volume')


#### Then


@then(u'iFlyOS服务端回复状态为【{resp_code}】成功')
def step_impl(context, resp_code):
    context.comm_client.get_result_from_event_channel_queue()
    context.ER.should_equal(context.AR, 'Status_Code', int(resp_code))


@then(u'iFlyOS服务端回复状态为【{resp_code}】错误，而且参数【error】为【{error}】')
def step_impl(context, resp_code, error):
    context.comm_client.get_result_from_event_channel_queue()
    context.ER.should_equal(context.AR, 'Status_Code', int(resp_code))
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Error', error)


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一')
def step_impl(context, interface, directive):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', 'BodyTemplate3')
    # context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')

    context.fs.write('Template_Run_Time_Title:' + context.AR.get_value('Template_Run_Time_Title') + '\n')
    context.fs.write('Template_Run_Time_Text_Field:' + context.AR.get_value('Template_Run_Time_Text_Field') + '\n')
    context.fs.flush()
    pass_flag = False
    for row in context.table:
        try:
            context.ER.should_contains_string(context.AR, 'Template_Run_Time_Title', row['title'])
            context.ER.should_contains_string(context.AR, 'Template_Run_Time_Text_Field', row['text_field'])
            if row['title'] != "执行失败原因":
                context.ER.should_not_null(context.AR, 'Template_Run_Time_Sub_Text_Field')

        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】为【{main_title}】，参数【subTile】为【{sub_title}】，参数【highTemperature】包含【{high_temperature}】，参数【lowTemperature】包含【{low_temperature}】')
def step_impl(context, interface, directive, template_type, main_title, sub_title, high_temperature, low_temperature):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Sub_Title', sub_title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_High_Temperature_Field', high_temperature)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Low_Temperature_Field', low_temperature)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】为【{main_title}】，参数【subTile】包含【{sub_title}】，参数【leftTextField】包含【{left_text_field}】，参数【rightTextField】包含【{right_text_field}】')
def step_impl(context, interface, directive, template_type, main_title, sub_title, left_text_field, right_text_field):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Sub_Title', sub_title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Left_Text_Field', left_text_field)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Right_Text_Field', right_text_field)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】为【{main_title}】，参数【subTile】为【{sub_title}】，参数【textField】包含【{text_field}】')
def step_impl(context, interface, directive, template_type, main_title, sub_title, text_field):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Sub_Title', sub_title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Text_Field', text_field)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】为【{main_title}】，参数【subTile】为空，参数【textField】包含【{text_field}】')
def step_impl(context, interface, directive, template_type, main_title, text_field):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_null(context.AR, 'Template_Run_Time_Sub_Title', '')
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Text_Field', text_field)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】为【{main_title}】，参数【subTile】为空，参数【textField】不为空')
def step_impl(context, interface, directive, template_type, main_title):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_null(context.AR, 'Template_Run_Time_Sub_Title', '')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Text_Field')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】为【{main_title}】，参数【subTile】为【{sub_title}】，参数【textField】不为空')
def step_impl(context, interface, directive, template_type, main_title, sub_title):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Sub_Title', sub_title)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Text_Field')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】包含【{main_title}】，参数【subTile】包含【{sub_title}】，参数【textField】不为空')
def step_impl(context, interface, directive, template_type, main_title, sub_title):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Sub_Title', sub_title)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Text_Field')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【mainTile】为【{main_title}】，参数【subTile】不为空，参数【textField】不为空')
def step_impl(context, interface, directive, template_type, main_title):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Main_Title', main_title)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Sub_Title')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Text_Field')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【title】为【{title}】，参数【textField】包含【{text_field}】，参数【subtextField】包含【{sub_text_field}】')
def step_impl(context, interface, directive, template_type, title, text_field, sub_text_field):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Title', title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Text_Field', text_field)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Sub_Text_Field', sub_text_field)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【title】为【{title}】，参数【textField】包含【{text_field}】，参数【subtextField】为None')
def step_impl(context, interface, directive, template_type, title, text_field):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Title', title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Text_Field', text_field)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Sub_Text_Field', None)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【title】为【{title}】，参数【textField】包含【{text_field}】，参数【subtextField】为空')
def step_impl(context, interface, directive, template_type, title, text_field):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Title', title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Text_Field', text_field)
    context.ER.should_null(context.AR, 'Template_Run_Time_Sub_Text_Field', '')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【title】为【{title}】，参数【textField】包含【{text_field}】')
def step_impl(context, interface, directive, template_type, title, text_field):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Title', title)
    context.ER.should_contains_string(context.AR, 'Template_Run_Time_Text_Field', text_field)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{template_type}】，参数【token】不为空，参数【title】为【{title}】，参数【textField】不为空，参数【subtextField】不为空')
def step_impl(context, interface, directive, template_type, title):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', template_type)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Title', title)
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Text_Field')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Sub_Text_Field')
    context.ER.should_not_null(context.AR, 'Template_Run_Time_Token')


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{type}】，参数【currentWeather】包含以下内容之一')
def step_impl(context, interface, directive, type):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', type)

    pass_flag = False
    for row in context.table:
        current_weather = row['current_weather']
        try:
            context.ER.should_contains_string(context.AR, 'Template_Run_Time_Current_Weather_Field', current_weather)
        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【type】为【{type}】')
def step_impl(context, interface, directive, type):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Template_Run_Time_Type', type)


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【playBehavior】为【{play_behavior}】，参数【offsetInMilliseconds】为【{offset_in_milliseconds}】')
def step_impl(context, interface, directive, play_behavior, offset_in_milliseconds):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Play_Behavior', play_behavior)
    context.ER.should_equal(context.AR, 'Offset_In_Milliseconds', offset_in_milliseconds)


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【playBehavior】为【{play_behavior}】，参数【progressReportIntervalInMilliseconds】为【{progress_report_interval_in_milliseconds}】')
def step_impl(context, interface, directive, play_behavior, progress_report_interval_in_milliseconds):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Play_Behavior', play_behavior)
    context.ER.should_equal(context.AR, 'Progress_Report_Interval_In_Milliseconds',
                            int(progress_report_interval_in_milliseconds))


@then(
    u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【playBehavior】为【{play_behavior}】，参数【progressReportDelayInMilliseconds】为【{progress_report_delay_in_milliseconds}】')
def step_impl(context, interface, directive, play_behavior, progress_report_delay_in_milliseconds):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Play_Behavior', play_behavior)
    context.ER.should_equal(context.AR, 'Progress_Report_Delay_In_Milliseconds',
                            int(progress_report_delay_in_milliseconds))


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【playBehavior】为【{play_behavior}】')
def step_impl(context, interface, directive, play_behavior):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Play_Behavior', play_behavior)


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含以下内容之一且判断是否追问，追问值【{value}】，追问回复【{tts_content2}】')
def step_impl(context, interface, directive, value, tts_content2):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    pass_flag = False
    for row in context.table:
        tts_content = row[0]

        try:
            context.ER.should_contains_string(context.AR, 'TTS', tts_content)

            if tts_content != "没有找到这个设备":
                context.execute_steps('''
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功

                    # 服务端下发追问
                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                    # 模拟用户说出【50】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + value + '''】
                    那么      iFlyOS服务端回复状态为【200】成功
                    那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_content2 + '''】

                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含以下内容之一')
def step_impl(context, interface, directive):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    pass_flag = False
    for row in context.table:
        tts_content = row[0]
        try:
            context.ER.should_contains_string(context.AR, 'TTS', tts_content)
        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含【{tts_content1}】和【{tts_content2}】和【{tts_content3}】')
def step_impl(context, interface, directive, tts_content1, tts_content2, tts_content3):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_contains_string(context.AR, 'TTS', tts_content1)
    context.ER.should_contains_string(context.AR, 'TTS', tts_content2)
    context.ER.should_contains_string(context.AR, 'TTS', tts_content3)


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含【{tts_content1}】和【{tts_content2}】和以下内容之一')
def step_impl(context, interface, directive, tts_content1, tts_content2):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_contains_string(context.AR, 'TTS', tts_content1)
    context.ER.should_contains_string(context.AR, 'TTS', tts_content2)

    pass_flag = False
    for row in context.table:
        tts_content = row[0]

        try:
            context.ER.should_contains_string(context.AR, 'TTS', tts_content)
        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含【{date}】和以下内容之一且判断是否追问，追问值【{answered}】')
def step_impl(context, interface, directive, date, answered):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_contains_string(context.AR, 'TTS', date)
    pass_flag = False
    for row in context.table:
        tts_content = row[0]

        try:
            context.ER.should_contains_string(context.AR, 'TTS', tts_content)

            if ("持仓" in tts_content) or ("买入" in tts_content):
                context.execute_steps('''
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功

                    # 服务端下发追问
                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                    # 模拟用户说出【50】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + answered + '''】
                    那么      iFlyOS服务端回复状态为【200】成功
                     ''')
                if answered in ["需要", "好的", "是", "好"]:
                    context.execute_steps('''
                        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】为【查股票】，参数【textField】不为空，参数【subtextField】不为空
                        ''')
                context.execute_steps('''
                        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
                            | tts_content      |
                            | 我们的参考买入价是        |
                            | 我们最新的买入价是        |
                            | 我先退下了，有需要的时候再叫我吧 |
    
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                        那么      iFlyOS服务端回复状态为【200】成功
                    ''')
        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含以下内容之一且判断是否有资源')
def step_impl(context, interface, directive, ):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    pass_flag = False
    for row in context.table:
        tts_content = row[0]

        try:
            context.ER.should_contains_string(context.AR, 'TTS', tts_content)
            context.execute_steps('''
                当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【200】成功
                当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【200】成功
                ''')
            if ("为你播放" in tts_content):
                context.execute_steps('''
                    那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
                    那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
            
                    当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
            
                    当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    
                    # 模拟用户说出【停止播放】的识别过程
                    当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【停止播放】
                    那么      iFlyOS服务端回复状态为【200】成功
            
                    那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        
                     ''')
        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含【{date}】和以下内容之一')
def step_impl(context, interface, directive, date):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_contains_string(context.AR, 'TTS', date)
    pass_flag = False
    for row in context.table:
        tts_content = row[0]

        try:
            context.ER.should_contains_string(context.AR, 'TTS', tts_content)
        except Exception as e:
            pass
        else:
            pass_flag = True

    assert pass_flag is True


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含【{tts_content1}】和【{tts_content2}】')
def step_impl(context, interface, directive, tts_content1, tts_content2):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_contains_string(context.AR, 'TTS', tts_content1)
    context.ER.should_contains_string(context.AR, 'TTS', tts_content2)


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含【{tts_content}】')
def step_impl(context, interface, directive, tts_content):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_contains_string(context.AR, 'TTS', tts_content)


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】,TTS音频包含随机内容')
def step_impl(context, interface, directive):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_not_null(context.AR, 'TTS')


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【clearBehavior】为【{clear_behavior}】')
def step_impl(context, interface, directive, clear_behavior):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Clear_Behavior', clear_behavior)


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【scheduledTime】为【{scheduled_time}】')
def step_impl(context, interface, directive, scheduled_time):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_contains_string(context.AR, 'Scheduled_Time', scheduled_time)


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【volume】为【{volume}】')
def step_impl(context, interface, directive, volume):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Volume', int(volume))


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】，参数【mute】为【{mute}】')
def step_impl(context, interface, directive, mute):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    if mute.lower() == 'true':
        context.ER.should_equal(context.AR, 'Mute', True)
    elif mute.lower() == 'false':
        context.ER.should_equal(context.AR, 'Mute', False)
    else:
        logging.error("non boolean value")


@then(u'iFlyOS服务端回复的directive为【{interface}】'
      + u'，【{directive}】，参数【playBehavior】为【{play_behavior}】，带Binary Audio Attachment')
def step_impl(context, interface, directive, play_behavior):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Play_Behavior', play_behavior)
    context.ER.should_not_null(context.AR, 'Audio_Data')


@then(u'iFlyOS服务端回复的directive为【{interface}】，【{directive}】')
def step_impl(context, interface, directive):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)


@then(u'iFlyOS服务端没有回复的directive为【{interface}】，【{directive}】')
def step_impl(context, interface, directive):
    try:
        context.comm_client.get_directive_from_event_channel_list()
    except queue.Empty:
        pass


@then(u'iFlyOS服务端音乐播放器列表不为空')
def step_impl(context):
    context.ER.should_not_null(context.AR, 'Server_Audio_List')


@then(u'iFlyOS服务端音乐播放器列表都是【{artist}】的歌')
def step_impl(context, artist):
    context.ER.should_equal(context.AR, 'Server_Audio_List_Singers', artist)


@then(u'iFlyOS服务端音乐播放器列表的列表偏移量为【{list_offset}】')
def step_impl(context, list_offset):
    context.ER.should_equal(context.AR, 'Server_Audio_List_Offset', int(list_offset))


@then(u'iFlyOS服务端音乐播放器列表的歌曲偏移量为【{song_offset}】')
def step_impl(context, song_offset):
    context.ER.should_equal(context.AR, 'Server_Audio_List_Song_Offset', int(song_offset))


@then(u'iFlyOS服务端音量为【{volume}】')
def step_impl(context, volume):
    context.ER.should_equal(context.AR, 'Server_Speaker_Volume', int(volume))


@then(u'iFlyOS服务端音量为原来的【{volume}】')
def step_impl(context, volume):
    if 0 <= context.volume + int(volume) <= 100:
        context.ER.should_equal(context.AR, 'Server_Speaker_Volume', context.volume + int(volume))
    elif context.volume + int(volume) < 0:
        context.ER.should_equal(context.AR, 'Server_Speaker_Volume', 0)
    elif context.volume + int(volume) > 100:
        context.ER.should_equal(context.AR, 'Server_Speaker_Volume', 100)


@then(u'iFlyOS服务端静音状态为【{mute}】')
def step_impl(context, mute):
    if mute.lower() == 'true':
        context.ER.should_equal(context.AR, 'Server_Speaker_Mute', True)
    elif mute.lower() == 'false':
        context.ER.should_equal(context.AR, 'Server_Speaker_Mute', False)
    else:
        logging.error("non boolean value")


@then(u'iFlyOS服务端音乐播放器状态为【{status}】')
def step_impl(context, status):
    context.ER.should_equal(context.AR, 'Server_Audio_Status', status)


@then(u'iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含从接龙词中随机选取一个')
def step_impl(context):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
    logging.info('TTS:' + context.AR.get_value('TTS'))
    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
    context.fs.flush()
    context.ER.should_not_null(context.AR, 'TTS')


@then(u'iFlyOS服务端回复的directive为【{interface}】【{directive}】')
def step_impl(context, interface, directive):
    context.comm_client.get_directive_from_event_channel_list()
    context.ER.should_equal(context.AR, 'Event_Channel_Directive', directive)
    context.ER.should_equal(context.AR, 'Event_Channel_Interface', interface)


@then(u'iFlyOS服务端下行通道回复的directive为【{interface}】，【{directive}】，参数【scheduledTime】为【{scheduled_time}】')
def step_impl(context, interface, directive, scheduled_time):
    context.comm_client.get_result_from_down_channel_queue()
    context.comm_client.get_directive_from_down_channel_list()
    context.ER.should_equal(context.AR, 'Down_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Down_Channel_Directive', directive)
    context.ER.should_contains_string(context.AR, 'Scheduled_Time', scheduled_time)


@then(u'iFlyOS服务端下行通道回复的directive为【XFSpeechRecognizer】，【IntermediateText】，参数【text】为【{text}】')
def step_impl(context, text):
    context.comm_client.get_result_from_down_channel_queue()
    context.comm_client.get_directive_from_down_channel_list()
    context.ER.should_equal(context.AR, 'Down_Channel_Interface', 'XFSpeechRecognizer')
    context.ER.should_equal(context.AR, 'Down_Channel_Directive', 'IntermediateText')
    context.ER.should_equal(context.AR, 'Intermediate_Text', text)


@then(u'iFlyOS服务端下行通道回复的directive为【{interface}】，【{directive}】')
def step_impl(context, interface, directive):
    context.comm_client.get_result_from_down_channel_queue()
    context.comm_client.get_directive_from_down_channel_list()
    context.ER.should_equal(context.AR, 'Down_Channel_Interface', interface)
    context.ER.should_equal(context.AR, 'Down_Channel_Directive', directive)


@then(u'清空闹钟列表')
def step_impl(context):
    context.execute_steps('''
              # 那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】
                # 模拟用户说出【删除所有闹钟】的识别过程
                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【删除全部闹钟】
                那么      iFlyOS服务端回复状态为【200】成功
                # 服务端下发意图
                那么      iFlyOS服务端下行通道回复的directive为【SpeechRecognizer】，【StopCapture】
                那么      iFlyOS服务端下行通道回复的directive为【XFSpeechRecognizer】，【IntermediateText】
                那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】，TTS音频为【要删除所有闹钟吗？确认还是取消】
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【204】成功
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【204】成功
                那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                # 模拟用户说出【确认】的识别过程
                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【确定】
                那么      iFlyOS服务端回复状态为【200】成功
                # 服务端下发意图
                那么      iFlyOS服务端下行通道回复的directive为【SpeechRecognizer】，【StopCapture】
                那么      iFlyOS服务端下行通道回复的directive为【XFSpeechRecognizer】，【IntermediateText】，参数【text】为【确定】
                那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】，TTS音频为【已为你删除所有闹钟】
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【204】成功
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【204】成功

                那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
                当       iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
                那么      iFlyOS服务端回复状态为【204】成功
            ''')
