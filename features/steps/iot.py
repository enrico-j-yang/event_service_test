# -*- coding: utf-8 -*-
'''
smart_home.py is step implementation file for smart_home.feature

'''
import logging
from behave import *

try:
    import Queue as queue
except ImportError:
    import queue

file_var = {
    "zone.txt": "zone",
    "device_type.txt": "device_type",
    "brand.txt": "brand",
    "action_wanted.txt": "iwant",
    "color.txt": "color",
    "light.txt": "light",
    "fan_gear.txt": "fan_gear",
    "device_mode.txt": "mode",
    "light_device_type.txt": "light_device_type",
    "temperature_device_type.txt": "temperature_device_type",
    "wind_device_type.txt": "wind_device_type",
    "volume_device_type.txt": "volume_device_type",
    "content.txt": "content",
    "yq.txt": "yq"
}
table_var = {
    "turn_on": "turn_on",
    "turn_off": "turn_off",
    "set": "set",
    "add": "add",
    "minor": "minor",
    "action_play":"action_play"
}


#### Given


@given(u'从文件【{filename}】里所有{{device_type}}已打开')
def step_impl(context, filename):
    context.execute_steps('''
        当       iFlyOS客户端从以下turn_on语料和文件【''' + filename + '''】里所有语料组合用户语音{turn_on}{device_type}，而且回复：【好的，已为你打开{device_type}】
            | turn_on |
            |    打开        |
    ''')


@given(u'从文件【{filename}】里所有{{device_type}}已关闭')
def step_impl(context, filename):
    context.execute_steps('''
        当       iFlyOS客户端从以下turn_off语料和文件【''' + filename + '''】里所有语料组合用户语音{turn_off}{device_type}，而且回复：【好的，已为你关闭{device_type}】
            | turn_off |
            |    关上        |
    ''')


#### When


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}、{forth_filename}和{'
      u'fifth_filename}】里所有语料组合用户语音{text}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, fifth_filename, text,
              tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    with open("data/" + fifth_filename, "r") as f5:
                                        for fifth_word in f5:
                                            setattr(context, file_var[fifth_filename], fifth_word.strip())
                                            if len(getattr(context, file_var[fifth_filename])) == 0:
                                                continue
                                            for row in context.table:
                                                setattr(context, table_var[action], row[table_var[action]])
                                                speech_text = ""
                                                for word in speech:
                                                    speech_text += getattr(context, word)
                                                context.execute_steps('''
                                                    # 模拟用户说出【打开空调】的识别过程
                                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                                # 服务端下发意图
                                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                                try:
                                                    context.comm_client.get_directive_from_event_channel_list()
                                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive',
                                                                            'Speak')
                                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface',
                                                                            'SpeechSynthesizer')
                                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                                except Exception as e:
                                                    fail_case = fail_case + 1
                                                context.execute_steps('''
                                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                                    那么      iFlyOS服务端回复状态为【200】成功
                                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                                    那么      iFlyOS服务端回复状态为【200】成功
                                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}和{forth_filename}】里所有语料组合用户语音{text}{{set}}{number}档{{fan_gear}}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, text, number,
              tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    for row in context.table:
                                        setattr(context, table_var[action], row[table_var[action]])
                                        speech_text = ""
                                        for word in speech:
                                            speech_text += getattr(context, word)
                                        context.execute_steps('''
                                            # 模拟用户说出【打开空调】的识别过程
                                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档''' + context.fan_gear + '''】
                                            那么      iFlyOS服务端回复状态为【200】成功''')
                                        # 服务端下发意图
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                        try:
                                            context.comm_client.get_directive_from_event_channel_list()
                                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                            context.ER.should_equal(context.AR, 'Event_Channel_Interface',
                                                                    'SpeechSynthesizer')
                                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                        except Exception as e:
                                            fail_case = fail_case + 1
                                        context.execute_steps('''
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}和{forth_filename}】里所有语料组合用户语音{'
      u'text}{{add}}{number}档，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, text, number,
              tts_answer):
    text += '{add}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    for row in context.table:
                                        setattr(context, table_var[action], row[table_var[action]])
                                        speech_text = ""
                                        for word in speech:
                                            speech_text += getattr(context, word)
                                        context.execute_steps('''
                                            # 模拟用户说出【打开空调】的识别过程
                                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                                            那么      iFlyOS服务端回复状态为【200】成功''')
                                        # 服务端下发意图
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                        try:
                                            context.comm_client.get_directive_from_event_channel_list()
                                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                            context.ER.should_equal(context.AR, 'Event_Channel_Interface',
                                                                    'SpeechSynthesizer')
                                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                        except Exception as e:
                                            fail_case = fail_case + 1
                                        context.execute_steps('''
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}和{forth_filename}】里所有语料组合用户语音{'
      u'text}{{add}}{number}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, text, number,
              tts_answer):
    text += '{add}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    for row in context.table:
                                        setattr(context, table_var[action], row[table_var[action]])
                                        speech_text = ""
                                        for word in speech:
                                            speech_text += getattr(context, word)
                                        context.execute_steps('''
                                            # 模拟用户说出【打开空调】的识别过程
                                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                                            那么      iFlyOS服务端回复状态为【200】成功''')
                                        # 服务端下发意图
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                        try:
                                            context.comm_client.get_directive_from_event_channel_list()
                                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                            context.ER.should_equal(context.AR, 'Event_Channel_Interface',
                                                                    'SpeechSynthesizer')
                                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                        except Exception as e:
                                            fail_case = fail_case + 1
                                        context.execute_steps('''
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}和{forth_filename}】里所有语料组合用户语音{'
      u'text}{{minor}}{number}档，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, text, number,
              tts_answer):
    text += '{minor}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    for row in context.table:
                                        setattr(context, table_var[action], row[table_var[action]])
                                        speech_text = ""
                                        for word in speech:
                                            speech_text += getattr(context, word)
                                        context.execute_steps('''
                                            # 模拟用户说出【打开空调】的识别过程
                                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                                            那么      iFlyOS服务端回复状态为【200】成功''')
                                        # 服务端下发意图
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                        try:
                                            context.comm_client.get_directive_from_event_channel_list()
                                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                            context.ER.should_equal(context.AR, 'Event_Channel_Interface',
                                                                    'SpeechSynthesizer')
                                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                        except Exception as e:
                                            fail_case = fail_case + 1
                                        context.execute_steps('''
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}和{forth_filename}】里所有语料组合用户语音{'
      u'text}{{minor}}{number}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, text, number,
              tts_answer):
    text += '{minor}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    for row in context.table:
                                        setattr(context, table_var[action], row[table_var[action]])
                                        speech_text = ""
                                        for word in speech:
                                            speech_text += getattr(context, word)
                                        context.execute_steps('''
                                            # 模拟用户说出【打开空调】的识别过程
                                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                                            那么      iFlyOS服务端回复状态为【200】成功''')
                                        # 服务端下发意图
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                        try:
                                            context.comm_client.get_directive_from_event_channel_list()
                                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                            context.ER.should_equal(context.AR, 'Event_Channel_Interface',
                                                                    'SpeechSynthesizer')
                                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                        except Exception as e:
                                            fail_case = fail_case + 1
                                        context.execute_steps('''
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}和{forth_filename}】里所有语料组合用户语音{'
      u'first_text}颜色{second_text}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, first_text,
              second_text,
              tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    for row in context.table:
                                        setattr(context, table_var[action], row[table_var[action]])
                                        first_speech_text = ""
                                        for word in first_speech:
                                            first_speech_text += getattr(context, word)
                                        second_speech_text = ""
                                        for word in second_speech:
                                            second_speech_text += getattr(context, word)
                                        context.execute_steps('''
                                            # 模拟用户说出【打开空调】的识别过程
                                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' +
                                                              first_speech_text + '''颜色''' + second_speech_text + '''】
                                            那么      iFlyOS服务端回复状态为【200】成功''')
                                        # 服务端下发意图
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                        try:
                                            context.comm_client.get_directive_from_event_channel_list()
                                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                            context.ER.should_equal(context.AR, 'Event_Channel_Interface',
                                                                    'SpeechSynthesizer')
                                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                        except Exception as e:
                                            fail_case = fail_case + 1
                                        context.execute_steps('''
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}、{third_filename}和{forth_filename}】里所有语料组合用户语音{'
      u'text}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, forth_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            with open("data/" + forth_filename, "r") as f4:
                                for forth_word in f4:
                                    setattr(context, file_var[forth_filename], forth_word.strip())
                                    if len(getattr(context, file_var[forth_filename])) == 0:
                                        continue
                                    for row in context.table:
                                        setattr(context, table_var[action], row[table_var[action]])
                                        speech_text = ""
                                        for word in speech:
                                            speech_text += getattr(context, word)
                                        context.execute_steps('''
                                            # 模拟用户说出【打开空调】的识别过程
                                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                                            那么      iFlyOS服务端回复状态为【200】成功''')
                                        # 服务端下发意图
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                        try:
                                            context.comm_client.get_directive_from_event_channel_list()
                                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                        except Exception as e:
                                            fail_case = fail_case + 1
                                        context.execute_steps('''
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                            那么      iFlyOS服务端回复状态为【200】成功
                                        ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}的温度{{add}}{number}度，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【空调温度调到26度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度调到26度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '好的，已为您调整温度')
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    # 服务端下发意图
                                    那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    # 模拟用户说出【空调的温度调高1度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                                    context, table_var[action]) + number + '''度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}的温度{{minor}}{'
      u'number}度，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                                    context, table_var[action]) + number + '''度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{first_text}温度调到{second_text}度，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, first_filename, second_filename, third_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            first_speech_text = ""
                            for word in first_speech:
                                first_speech_text += getattr(context, word)
                            if len(second_speech) > 1:
                                second_speech_text = ""
                                for word in second_speech:
                                    second_speech_text += getattr(context, word)
                            else:
                                second_speech_text = second_text
                            context.execute_steps('''
                                # 模拟用户说出【打开空调】的识别过程
                                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                                  '''温度调到''' + second_speech_text + '''度】
                                那么      iFlyOS服务端回复状态为【200】成功''')
                            # 服务端下发意图
                            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                            try:
                                context.comm_client.get_directive_from_event_channel_list()
                                context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                            except Exception as e:
                                fail_case = fail_case + 1
                            context.execute_steps('''
                                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                那么      iFlyOS服务端回复状态为【200】成功
                                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                那么      iFlyOS服务端回复状态为【200】成功
                            ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{first_text}调到{second_text}度，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, first_filename, second_filename, third_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            first_speech_text = ""
                            for word in first_speech:
                                first_speech_text += getattr(context, word)
                            if len(second_speech) > 1:
                                second_speech_text = ""
                                for word in second_speech:
                                    second_speech_text += getattr(context, word)
                            else:
                                second_speech_text = second_text
                            context.execute_steps('''
                                # 模拟用户说出【打开空调】的识别过程
                                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                                  '''调到''' + second_speech_text + '''度】
                                那么      iFlyOS服务端回复状态为【200】成功''')
                            # 服务端下发意图
                            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                            try:
                                context.comm_client.get_directive_from_event_channel_list()
                                context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                            except Exception as e:
                                fail_case = fail_case + 1
                            context.execute_steps('''
                                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                那么      iFlyOS服务端回复状态为【200】成功
                                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                那么      iFlyOS服务端回复状态为【200】成功
                            ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}的亮度，追问{asked}且追问回复【{brightness_value}】，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, asked, brightness_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的亮度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【需要为您调到多少呢】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    # 服务端下发意图
                                    那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【需要为您调到多少呢】
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【50】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + brightness_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}亮度{{set}}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''亮度''' + getattr(
                                    context, table_var[action]) + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''                                    
                                    那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{set}}{number}档{{'
    u'fan_gear}}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档''' + context.fan_gear + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer +'''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}音量{{set}}{number}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                                    context, table_var[action]) + number + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type +'''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}音量{{add}}一点，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                                    context, table_var[action]) + '''一点】                 
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}音量{{minor}}一点，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                                    context, table_var[action]) + '''一点】                 
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}音量{{add}}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                                    context, table_var[action]) + '''】                 
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}声音{{add}}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''声音''' + getattr(
                                    context, table_var[action]) + '''】                 
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}音量{{minor}}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                                    context, table_var[action]) + '''】                 
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}声音{{minor}}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                if len(speech) > 1:
                                    speech_text = ""
                                    for word in speech:
                                        speech_text += getattr(context, word)
                                else:
                                    speech_text = getattr(context, speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''声音''' + getattr(
                                    context, table_var[action]) + '''】                 
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{set}}{number}档，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{{set}}{text}，而且回复：【{'u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + getattr(context,
                                                                                                               table_var[
                                                                                                                   action]) + speech_text + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{set}}{{'
      u'mode}}，而且回复：【{'u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    text += '{set}{mode}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{set}}温度，追问{asked}且追问回复{temperature_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, asked, temperature_value,
              tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)

                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【50】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + temperature_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                     ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{set}}风速，追问{asked}且追问回复{wind_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, asked, wind_value, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)

                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''风速】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【50】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + wind_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                     ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{first_text}{{set}}{second_text}风速，追问{asked}且追问回复{wind_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, first_text, second_text, asked,
              wind_value, tts_answer):
    first_text += '{set}'
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                first_speech_text = ""
                                for word in first_speech:
                                    first_speech_text += getattr(context, word)
                                if len(second_speech) > 1:
                                    second_speech_text = ""
                                    for word in second_speech:
                                        second_speech_text += getattr(context, word)
                                else:
                                    second_speech_text = getattr(context, second_speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text + second_speech_text + '''风速】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【50】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + wind_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                     ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{first_text}{{set}}{second_text}温度，追问{asked}且追问回复{temperature_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, first_text, second_text, asked,
              temperature_value, tts_answer):
    first_text += '{set}'
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                first_speech_text = ""
                                for word in first_speech:
                                    first_speech_text += getattr(context, word)
                                if len(second_speech) > 1:
                                    second_speech_text = ""
                                    for word in second_speech:
                                        second_speech_text += getattr(context, word)
                                else:
                                    second_speech_text = getattr(context, second_speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text + second_speech_text + '''温度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【50】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + temperature_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                     ''')

    if fail_case > 0:
        assert False

@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{first_text}{{set}}{second_text}的亮度，追问{asked}且追问回复{brightness_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, first_text, second_text, asked,
              brightness_value, tts_answer):
    first_text += '{set}'
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                first_speech_text = ""
                                for word in first_speech:
                                    first_speech_text += getattr(context, word)
                                if len(second_speech) > 1:
                                    second_speech_text = ""
                                    for word in second_speech:
                                        second_speech_text += getattr(context, word)
                                else:
                                    second_speech_text = getattr(context, second_speech[0])
                                context.execute_steps('''
                                    # 模拟用户说出【设置台灯的亮度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text + second_speech_text + '''的亮度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【50】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + brightness_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                     ''')

    if fail_case > 0:
        assert False

@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{first_text}颜色{'
      u'second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                first_speech_text = ""
                                for word in first_speech:
                                    first_speech_text += getattr(context, word)
                                second_speech_text = ""
                                for word in second_speech:
                                    second_speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' +
                                                      first_speech_text + '''颜色''' + second_speech_text + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False

@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{set}}{number}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{add}}{'
      u'number}档，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    text += '{add}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{add}}{'
      u'number}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    text += '{add}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{minor}}{'
      u'number}档，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    text += '{minor}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{minor}}{'
      u'number}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, number, tts_answer):
    text += '{minor}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}，而且回复：【{'
      u'tts_answer}{{device_type}}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False

@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}温度，追问{asked}且追问回复{temperature_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, asked, temperature_value,
              tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)

                                context.execute_steps('''
                                    # 模拟用户说出【设置客厅空调温度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功

                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【1】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + temperature_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}风速，追问{asked}且追问回复{wind_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, asked, wind_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)

                                context.execute_steps('''
                                    # 模拟用户说出【设置客厅空调温度】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''风速】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                                except queue.Empty:
                                    fail_case = fail_case + 1
                                    continue
                                except Exception as e:
                                    fail_case = fail_case + 1
                                    continue
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功

                                    # 服务端下发追问
                                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                                    # 模拟用户说出【1】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + wind_value + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{mode}}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    text += '{mode}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}{{turn_on}}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    text += '{turn_on}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}、{second_filename}和{third_filename}】里所有语料组合用户语音{text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, third_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    with open("data/" + third_filename, "r") as f3:
                        for third_word in f3:
                            setattr(context, file_var[third_filename], third_word.strip())
                            if len(getattr(context, file_var[third_filename])) == 0:
                                continue
                            for row in context.table:
                                setattr(context, table_var[action], row[table_var[action]])
                                speech_text = ""
                                for word in speech:
                                    speech_text += getattr(context, word)
                                context.execute_steps('''
                                    # 模拟用户说出【打开空调】的识别过程
                                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                                    那么      iFlyOS服务端回复状态为【200】成功''')
                                # 服务端下发意图
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                                try:
                                    context.comm_client.get_directive_from_event_channel_list()
                                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                                except Exception as e:
                                    fail_case = fail_case + 1
                                context.execute_steps('''

                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                                    那么      iFlyOS服务端回复状态为【200】成功
                                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}的亮度，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的亮度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}亮度{{set}}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''亮度'''
                                              + getattr(context, table_var[action]) + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}的温度{{add}}{number}度，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【空调温度调到26度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度调到26度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '好的，已为您调整温度')
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps('''
                            # 服务端下发意图
                            那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            # 模拟用户说出【空调的温度调高1度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                            context, table_var[action]) + number + '''度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}的温度{{minor}}{number}度，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【空调温度调到26度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度调到26度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '好的，已为您调整温度')
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps(''' 
                            # 服务端下发意图
                            那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            # 模拟用户说出【空调的温度调低1度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                            context, table_var[action]) + number + '''度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}的温度{{add}}一点，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                            context, table_var[action]) + '''一点】                 
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}的温度{{minor}}一点，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                            context, table_var[action]) + '''一点】                 
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}音量{{add}}一点，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                            context, table_var[action]) + '''一点】                 
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}音量{{minor}}一点，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                            context, table_var[action]) + '''一点】                 
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}音量{{add}}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                            context, table_var[action]) + '''】                 
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}音量{{minor}}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                            context, table_var[action]) + '''】                 
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{first_filename}和{second_filename}】里所有语料组合用户语音{first_text}温度调到{second_text}度，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, first_filename, second_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    first_speech_text = ""
                    for word in first_speech:
                        first_speech_text += getattr(context, word)
                    if len(second_speech) > 1:
                        second_speech_text = ""
                        for word in second_speech:
                            second_speech_text += getattr(context, word)
                    else:
                        second_speech_text = second_text
                    context.execute_steps('''
                        # 模拟用户说出【打开空调】的识别过程
                        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                          '''温度调到''' + second_speech_text + '''度】
                        那么      iFlyOS服务端回复状态为【200】成功''')
                    # 服务端下发意图
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                    try:
                        context.comm_client.get_directive_from_event_channel_list()
                        context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                        context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                        context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                        context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                    except Exception as e:
                        fail_case = fail_case + 1
                    context.execute_steps('''
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                        那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{first_filename}和{second_filename}】里所有语料组合用户语音{first_text}调到{second_text}度，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, first_filename, second_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    first_speech_text = ""
                    for word in first_speech:
                        first_speech_text += getattr(context, word)
                    if len(second_speech) > 1:
                        second_speech_text = ""
                        for word in second_speech:
                            second_speech_text += getattr(context, word)
                    else:
                        second_speech_text = second_text
                    context.execute_steps('''
                        # 模拟用户说出【打开空调】的识别过程
                        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                          '''调到''' + second_speech_text + '''度】
                        那么      iFlyOS服务端回复状态为【200】成功''')
                    # 服务端下发意图
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                    try:
                        context.comm_client.get_directive_from_event_channel_list()
                        context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                        context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                        context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                        context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                    except Exception as e:
                        fail_case = fail_case + 1
                    context.execute_steps('''
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                        那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{first_filename}和{second_filename}】里所有语料组合用户语音{first_text}声音{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, first_filename, second_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    first_speech_text = ""
                    for word in first_speech:
                        first_speech_text += getattr(context, word)
                    if len(second_speech) > 1:
                        second_speech_text = ""
                        for word in second_speech:
                            second_speech_text += getattr(context, word)
                    else:
                        second_speech_text = second_text
                    context.execute_steps('''
                        # 模拟用户说出【打开空调】的识别过程
                        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                          '''声音''' + second_speech_text + '''】
                        那么      iFlyOS服务端回复状态为【200】成功''')
                    # 服务端下发意图
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                    try:
                        context.comm_client.get_directive_from_event_channel_list()
                        context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                        context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                        context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                        context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                    except Exception as e:
                        fail_case = fail_case + 1
                    context.execute_steps('''
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                        那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{first_text}颜色{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        first_speech_text = ""
                        for word in first_speech:
                            first_speech_text += getattr(context, word)
                        second_speech_text = ""
                        for word in second_speech:
                            second_speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                              '''颜色''' + second_speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}的温度，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{set}}{number}档{{'
      u'fan_gear}}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档''' + context.fan_gear + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{set}}{number}档，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{add}}{number}档{{'
      u'fan_gear}}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{add}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档''' + context.fan_gear + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{add}}{number}档，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{add}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{minor}}{number}档{{'
      u'fan_gear}}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{minor}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档''' + context.fan_gear + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{minor}}{number}档，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{minor}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''档】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}音量{{set}}{number}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                            context, table_var[action]) + number + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}音量，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}声音，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[first_filename], first_text.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_text in f2:
                    setattr(context, file_var[second_filename], second_text.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        if len(speech) > 1:
                            speech_text = ""
                            for word in speech:
                                speech_text += getattr(context, word)
                        else:
                            speech_text = getattr(context, speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''声音】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            # 服务端下发意图
                            #那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                            那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{set}}{{mode}}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    text += '{set}{mode}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{set}}温度，追问{asked}且追问回复{temperature_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, asked, temperature_value, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【50】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + temperature_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                             ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{set}}的亮度，追问{asked}且追问回复{brightness_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, asked, brightness_value, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的亮度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【50】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + brightness_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                             ''')

    if fail_case > 0:
        assert False

@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{set}}风速，追问{asked}且追问回复{wind_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, asked, wind_value, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''风速】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【50】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + wind_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                             ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{first_text}{{set}}{second_text}风速，追问{asked}且追问回复{wind_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, first_text, second_text, asked, wind_value, tts_answer):
    first_text += '{set}'
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        first_speech_text = ""
                        for word in first_speech:
                            first_speech_text += getattr(context, word)
                        if len(second_speech) > 1:
                            second_speech_text = ""
                            for word in second_speech:
                                second_speech_text += getattr(context, word)
                        else:
                            second_speech_text = getattr(context, second_speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text + second_speech_text + '''风速】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【50】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + wind_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                             ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{first_text}{{set}}{second_text}温度，追问{asked}且追问回复{temperature_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, first_text, second_text, asked, temperature_value,
              tts_answer):
    first_text += '{set}'
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        first_speech_text = ""
                        for word in first_speech:
                            first_speech_text += getattr(context, word)
                        if len(second_speech) > 1:
                            second_speech_text = ""
                            for word in second_speech:
                                second_speech_text += getattr(context, word)
                        else:
                            second_speech_text = getattr(context, second_speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【设置台灯的亮度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text + second_speech_text + '''温度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【50】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + temperature_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                             ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}温度，追问{asked}且追问回复{temperature_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, asked, temperature_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【设置客厅空调温度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功

                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【1】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + temperature_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps(''' 
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}风速，追问{asked}且追问回复{wind_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, asked, wind_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【设置客厅空调温度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''风速】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功

                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【1】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + wind_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False

@when(
    u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}的亮度，追问{asked}且追问回复{brightness_value}，而且回复：【{'
    u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, asked, brightness_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【设置客厅空调温度】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的亮度】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', asked)
                        except queue.Empty:
                            fail_case = fail_case + 1
                            continue
                        except Exception as e:
                            fail_case = fail_case + 1
                            continue
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功

                            # 服务端下发追问
                            那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                            # 模拟用户说出【1】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + brightness_value + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False

@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{{set}}{text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + getattr(context,
                                                                                                       table_var[
                                                                                                           action]) + speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{set}}{number}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{set}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{add}}{number}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{add}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{minor}}{number}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, number, tts_answer):
    text += '{minor}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + number + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{first_text}声音{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, first_filename, second_filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        first_speech_text = ""
                        for word in first_speech:
                            first_speech_text += getattr(context, word)
                        if len(second_speech) > 1:
                            second_speech_text = ""
                            for word in second_speech:
                                second_speech_text += getattr(context, word)
                        else:
                            second_speech_text = getattr(context, second_speech[0])
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                              '''声音''' + second_speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}关闭声音，而且回复：【{tts_answer}】')
def step_impl(context, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue

                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                    # speech_text = getattr(context, speech[0] )
                    context.execute_steps('''
                        # 模拟用户说出【设置台灯的亮度】的识别过程
                        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''关闭声音】
                        那么      iFlyOS服务端回复状态为【200】成功''')
                    # 服务端下发意图
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                    # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                    try:
                        context.comm_client.get_directive_from_event_channel_list()
                        context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                        context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                        context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                        context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                    except Exception as e:
                        fail_case = fail_case + 1
                    context.execute_steps('''
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                        当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                        那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}，而且回复：【{tts_answer}{{'
      u'device_type}}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}静音，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''静音】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}设为无声，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''设为无声】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{mode}}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    text += '{mode}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}{{turn_on}}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    text += '{turn_on}'
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)
                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您把''' + context.mode_device_type + '''设为''' + context.mode + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}，而且回复对应内容')
def step_impl(context, action, first_filename, second_filename, text):
    super_brief = {
        "超级早报": "超级早报，资讯早知道",
        "超级晚报": "超级晚报，资讯先知道",
        "娱乐简报": "即将为你提供热门娱乐简报",
        "娱乐简讯": "即将为你提供热门娱乐简报",
        "历史上的今天": "过去的今天发生了什么",
        "科技简讯": "速览前沿科技",
        "科技简报": "速览前沿科技",
        "商业简报": "每日供应最新鲜的财经资讯",
        "商业简讯": "每日供应最新鲜的财经资讯",
        "全网热议": "每天3分钟，掌握最热资讯"
    }
    
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【打开科技简报可以吗】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            if 'TTS'.endswith("服务出错，未找到内容"):
                                context.ER.should_contains_string(context.AR, '服务出错，未找到内容', 'TTS')
                            else:
                                context.ER.should_contains_string(context.AR, 'TTS', super_brief[first_word.strip()])
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                            
                            那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
                            那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
    
                            当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
    
                            当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False
        

@when(u'iFlyOS客户端从以下{action}语料和文件【{first_filename}和{second_filename}】里所有语料组合用户语音{text}，而且回复：【{tts_answer}】')
def step_impl(context, action, first_filename, second_filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + first_filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[first_filename], first_word.strip())
            if len(getattr(context, file_var[first_filename])) == 0:
                continue
            with open("data/" + second_filename, "r") as f2:
                for second_word in f2:
                    setattr(context, file_var[second_filename], second_word.strip())
                    if len(getattr(context, file_var[second_filename])) == 0:
                        continue
                    for row in context.table:
                        setattr(context, table_var[action], row[table_var[action]])
                        speech_text = ""
                        for word in speech:
                            speech_text += getattr(context, word)

                        context.execute_steps('''
                            # 模拟用户说出【打开空调】的识别过程
                            当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                            那么      iFlyOS服务端回复状态为【200】成功''')
                        # 服务端下发意图
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                        # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                        try:
                            context.comm_client.get_directive_from_event_channel_list()
                            context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                            context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                            context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                            context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                        except Exception as e:
                            fail_case = fail_case + 1
                        context.execute_steps('''  
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                            那么      iFlyOS服务端回复状态为【200】成功
                            当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                            那么      iFlyOS服务端回复状态为【200】成功
                        ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{filename}】里所有语料组合用户语音{first_text}温度调到{second_text}度，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[filename], first_word.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            first_speech_text = ""
            for word in first_speech:
                first_speech_text += getattr(context, word)
            if len(second_speech) > 1:
                second_speech_text = ""
                for word in second_speech:
                    second_speech_text += getattr(context, word)
            else:
                second_speech_text = second_text
            context.execute_steps('''
                # 模拟用户说出【打开空调】的识别过程
                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                  '''温度调到''' + second_speech_text + '''度】
                那么      iFlyOS服务端回复状态为【200】成功''')
            # 服务端下发意图
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
            try:
                context.comm_client.get_directive_from_event_channel_list()
                context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
            except Exception as e:
                fail_case = fail_case + 1
            context.execute_steps('''  
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【200】成功
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【200】成功
            ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{filename}】里所有语料组合用户语音{first_text}调到{second_text}度，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[filename], first_word.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            first_speech_text = ""
            for word in first_speech:
                first_speech_text += getattr(context, word)
            if len(second_speech) > 1:
                second_speech_text = ""
                for word in second_speech:
                    second_speech_text += getattr(context, word)
            else:
                second_speech_text = second_text
            context.execute_steps('''
                # 模拟用户说出【打开空调】的识别过程
                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                  '''调到''' + second_speech_text + '''度】
                那么      iFlyOS服务端回复状态为【200】成功''')
            # 服务端下发意图
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
            try:
                context.comm_client.get_directive_from_event_channel_list()
                context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
            except Exception as e:
                fail_case = fail_case + 1
            context.execute_steps('''  
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【200】成功
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【200】成功
            ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{first_text}声音{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[filename], first_word.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                first_speech_text = ""
                for word in first_speech:
                    first_speech_text += getattr(context, word)
                if len(second_speech) > 1:
                    second_speech_text = ""
                    for word in second_speech:
                        second_speech_text += getattr(context, word)
                else:
                    second_speech_text = getattr(context, second_speech[0])
                context.execute_steps('''
                    # 模拟用户说出【打开空调】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                      '''声音''' + second_speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{filename}】里所有语料组合用户语音{first_text}声音{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[filename], first_word.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            first_speech_text = ""
            for word in first_speech:
                first_speech_text += getattr(context, word)
            if len(second_speech) > 1:
                second_speech_text = ""
                for word in second_speech:
                    second_speech_text += getattr(context, word)
            else:
                second_speech_text = second_text[0]
            context.execute_steps('''
                # 模拟用户说出【打开空调】的识别过程
                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                  '''声音''' + second_speech_text + '''】
                那么      iFlyOS服务端回复状态为【200】成功''')
            # 服务端下发意图
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
            try:
                context.comm_client.get_directive_from_event_channel_list()
                context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
            except Exception as e:
                fail_case = fail_case + 1
            context.execute_steps('''  
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【200】成功
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【200】成功
            ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}的温度{{add}}{number}度，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])

                context.execute_steps('''
                    # 模拟用户说出【空调温度调到26度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度调到26度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '好的，已为您调整温度')
                except queue.Empty:
                    fail_case = fail_case + 1
                    continue
                except Exception as e:
                    fail_case = fail_case + 1
                    continue
                context.execute_steps(''' 
                    # 服务端下发意图
                    那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    # 模拟用户说出【空调的温度调高1度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                    context, table_var[action]) + number + '''度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''                  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}的温度{{minor}}{number}度，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【空调温度调到26度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度调到26度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为您调整温度】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '好的，已为您调整温度')
                except queue.Empty:
                    fail_case = fail_case + 1
                    continue
                except Exception as e:
                    fail_case = fail_case + 1
                    continue
                context.execute_steps(''' 
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    # 模拟用户说出【空调的温度调低1度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                    context, table_var[action]) + number + '''度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps(''' 
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}的温度{{add}}一点，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                    context, table_var[action]) + '''一点】                 
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}的温度{{minor}}一点，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度''' + getattr(
                    context, table_var[action]) + '''一点】                 
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}音量{{add}}一点，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                    context, table_var[action]) + '''一点】                 
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}音量{{minor}}一点，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                    context, table_var[action]) + '''一点】                 
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}音量{{add}}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                    context, table_var[action]) + '''】                 
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}音量{{minor}}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                    context, table_var[action]) + '''】                 
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}音量{{set}}{number}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, number, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量''' + getattr(
                    context, table_var[action]) + number + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}亮度{{set}}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)
                context.execute_steps('''
                    # 模拟用户说出【打开空调】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''亮度''' + getattr(
                    context, table_var[action]) + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + context.device_type'''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}的亮度，追问{asked}且追问回复【{brightness_value}】，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, asked, brightness_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的亮度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + speech_text + '''】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', asked)
                except queue.Empty:
                    fail_case = fail_case + 1
                    continue
                except Exception as e:
                    fail_case = fail_case + 1
                    continue
                context.execute_steps(''' 
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    # 服务端下发追问
                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                    # 模拟用户说出【50】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + brightness_value + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps(''' 
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}的温度，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的温度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}音量，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''音量】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}声音，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''声音】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}静音，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''静音】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{filename}】里所有语料组合用户语音{text}关闭声音，而且回复：【{tts_answer}】')
def step_impl(context, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            speech_text = getattr(context, speech[0])
            context.execute_steps('''
                # 模拟用户说出【设置台灯的亮度】的识别过程
                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''关闭声音】
                那么      iFlyOS服务端回复状态为【200】成功''')
            # 服务端下发意图
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
            # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
            try:
                context.comm_client.get_directive_from_event_channel_list()
                context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
            except Exception as e:
                fail_case = fail_case + 1
            context.execute_steps('''  
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【200】成功
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【200】成功
            ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}设为无声，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''设为无声】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}温度，追问{asked}且追问回复{temperature_value}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, asked, temperature_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])
                context.execute_steps('''
                    # 模拟用户说出【设置空调温度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''温度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                    continue
                context.execute_steps('''
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功

                    # 服务端下发追问
                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                    # 模拟用户说出【1】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + temperature_value + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps(''' 
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}风速，追问{asked}且追问回复{wind_value}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, asked, wind_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])

                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''风速】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                    continue
                context.execute_steps('''
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功

                    # 服务端下发追问
                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                    # 模拟用户说出【1】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + wind_value + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps(''' 
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False

@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}的亮度，追问{asked}且追问回复{brightness_value}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, asked, brightness_value, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                if len(speech) > 1:
                    speech_text = ""
                    for word in speech:
                        speech_text += getattr(context, word)
                else:
                    speech_text = getattr(context, speech[0])

                context.execute_steps('''
                    # 模拟用户说出【设置台灯的亮度】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''的亮度】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + asked + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                    continue
                context.execute_steps('''
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功

                    # 服务端下发追问
                    那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
                    # 模拟用户说出【1】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + brightness_value + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps(''' 
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{first_text}订阅号{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[filename], first_word.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                first_speech_text = ""
                for word in first_speech:
                    first_speech_text += getattr(context, word)
                if len(second_speech) > 1:
                    second_speech_text = ""
                    for word in second_speech:
                        second_speech_text += getattr(context, word)
                else:
                    second_speech_text = getattr(context, second_speech[0])
                context.execute_steps('''
                    # 模拟用户说出【打开订阅号汽车简报】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                      '''订阅号''' + second_speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

                if first_speech_text in ["打开", "播放", "收听"]:
                    context.execute_steps('''  
                        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
                        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
                
                        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                
                        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
                        那么      iFlyOS服务端回复状态为【200】成功
                        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
                        那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{first_text}取消{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[filename], first_word.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                first_speech_text = ""
                for word in first_speech:
                    first_speech_text += getattr(context, word)
                if len(second_speech) > 1:
                    second_speech_text = ""
                    for word in second_speech:
                        second_speech_text += getattr(context, word)
                else:
                    second_speech_text = getattr(context, second_speech[0])
                context.execute_steps('''
                    # 模拟用户说出【汽车简报取消关注】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + first_speech_text +
                                      '''取消''' + second_speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音把{first_text}从列表中{second_text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, first_text, second_text, tts_answer):
    first_speech = first_text[1:len(first_text) - 1].split('}{')
    second_speech = second_text[1:len(second_text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_word in f1:
            setattr(context, file_var[filename], first_word.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                first_speech_text = ""
                for word in first_speech:
                    first_speech_text += getattr(context, word)
                if len(second_speech) > 1:
                    second_speech_text = ""
                    for word in second_speech:
                        second_speech_text += getattr(context, word)
                else:
                    second_speech_text = getattr(context, second_speech[0])
                context.execute_steps('''
                    # 模拟用户说出【把大公司不开心从列表中移除】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【把''' + first_speech_text +
                                      '''从列表中''' + second_speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音把{text}订阅列表，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)
                context.execute_steps('''
                    # 模拟用户说出【打开订阅号汽车简报】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【把''' + speech_text + '''订阅列表】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音取消{text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)
                context.execute_steps('''
                    # 模拟用户说出【取消订阅汽车简报】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【取消''' + speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}【{auxiliary}】订阅，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, text, auxiliary, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)

                if auxiliary != '空':
                    context.execute_steps('''
                        # 模拟用户说出【取消大公司不开心的订阅】的识别过程
                        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + auxiliary + '''订阅】
                        那么      iFlyOS服务端回复状态为【200】成功''')
                else:
                    context.execute_steps('''
                        # 模拟用户说出【取消大公司不开心订阅】的识别过程
                        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''订阅】
                        那么      iFlyOS服务端回复状态为【200】成功''')
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音不想{text}，而且回复：【{'
      u'tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)

                context.execute_steps('''
                    # 模拟用户说出【打开订阅号汽车简报】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【不想''' + speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')

                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''  
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}，而且回复对应内容')
def step_impl(context, action, filename, text):
    super_brief = {
        "超级早报": "超级早报，资讯早知道",
        "超级晚报": "超级晚报，资讯先知道",
        "娱乐简报": "即将为你提供热门娱乐简报",
        "娱乐简讯": "即将为你提供热门娱乐简报",
        "历史上的今天": "过去的今天发生了什么",
        "科技简讯": "速览前沿科技",
        "科技简报": "速览前沿科技",
        "商业简报": "每日供应最新鲜的财经资讯",
        "商业简讯": "每日供应最新鲜的财经资讯",
        "全网热议": "每天3分钟，掌握最热资讯"
    }
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)
                context.execute_steps('''
                    # 模拟用户说出【打开科技简报】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', super_brief[first_text.strip()])
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                    
                    那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
                    那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
            
                    当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
            
                    当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从以下{action}语料和文件【{filename}】里所有语料组合用户语音{text}，而且回复：【{tts_answer}】')
def step_impl(context, action, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            for row in context.table:
                setattr(context, table_var[action], row[table_var[action]])
                speech_text = ""
                for word in speech:
                    speech_text += getattr(context, word)
                context.execute_steps('''
                    # 模拟用户说出【打开空调】的识别过程
                    当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【''' + speech_text + '''】
                    那么      iFlyOS服务端回复状态为【200】成功''')
                # 服务端下发意图
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【''' + tts_answer + '''】
                # 那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【没有找到这个设备】
                try:
                    context.comm_client.get_directive_from_event_channel_list()
                    context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                    context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                    context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
                    context.ER.should_contains_string(context.AR, 'TTS', '没有找到这个设备')
                except Exception as e:
                    fail_case = fail_case + 1
                context.execute_steps('''    
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                    那么      iFlyOS服务端回复状态为【200】成功
                    当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                    那么      iFlyOS服务端回复状态为【200】成功
                ''')

    if fail_case > 0:
        assert False


@when(u'iFlyOS客户端从文件【{filename}】里所有语料组合用户语音订阅号{text}更新了什么，而且回复：【{tts_answer}】')
def step_impl(context, filename, text, tts_answer):
    speech = text[1:len(text) - 1].split('}{')
    fail_case = 0

    with open("data/" + filename, "r") as f1:
        for first_text in f1:
            setattr(context, file_var[filename], first_text.strip())
            if len(getattr(context, file_var[filename])) == 0:
                continue
            speech_text = getattr(context, speech[0])
            context.execute_steps('''
                # 模拟用户说出【订阅号汽车简报更新了什么】的识别过程
                当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【订阅号''' + speech_text + '''更新了什么】
                那么      iFlyOS服务端回复状态为【200】成功''')
            try:
                context.comm_client.get_directive_from_event_channel_list()
                context.ER.should_equal(context.AR, 'Event_Channel_Directive', 'Speak')
                context.ER.should_equal(context.AR, 'Event_Channel_Interface', 'SpeechSynthesizer')
                context.ER.should_contains_string(context.AR, 'TTS', tts_answer)
                context.fs.write('TTS:' + context.AR.get_value('TTS') + '\n')
            except Exception as e:
                fail_case = fail_case + 1
            context.execute_steps('''  
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
                那么      iFlyOS服务端回复状态为【200】成功
                当       iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
                那么      iFlyOS服务端回复状态为【200】成功
                
                那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
                那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        
                当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
                那么      iFlyOS服务端回复状态为【200】成功
        
                当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
                那么      iFlyOS服务端回复状态为【200】成功
                当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
                那么      iFlyOS服务端回复状态为【200】成功
            ''')

    if fail_case > 0:
        assert False


