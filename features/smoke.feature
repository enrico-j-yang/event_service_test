# Created by enrico at 2018/4/30
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 事件服务模块测试
    ============================================
    # 典型用例
    @Smoke
    场景大纲: 时间查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【现在几点】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | title | text_field |
            | 现在几点          | :           | BodyTemplate3 | 时间    | :          |

    @Smoke
    场景大纲: 天气查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【广州今天天气】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        # TODO 增加增加最高温、最低温、UV判断描述
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】和以下内容之一
            | weather |
            | 晴       |
            | 多云      |
            | 小雨      |
            | 雨       |
            | 阵雨      |
            | 雷阵雨     |
            | 暴雨      |
            | 霾       |
            | ℃       |
            | 热       |
            | 冷       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 |
            | 广州今天天气        | 广州          | 今天           |

    @Smoke
    场景大纲: 新闻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【新闻】技能已打开

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content                |
            | 虽然我不是很厉害，但忍不住心系天下呢         |
            | 不知道听什么的时候我也爱听新闻            |
            | 一起了解下国家大事[=shi4]吧          |
            | 我觉得[p100]这些事蛮[=man3]重要的    |
            | 这[=zhe4]些事[p100]你听了也会大吃一惊呢 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @Smoke
    场景大纲: 音乐点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【来首歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好的，一起来听     |
            | 一起来听听       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来首歌           |

    @Smoke
    场景大纲: 评书点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【评书点播】技能已打开

        # 模拟用户说出【我要听评书】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 我要听评书         |

    @Smoke
    场景大纲: 戏曲点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【我要听京剧】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 我要听京剧         |

    @Smoke
    场景大纲: 相声小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【相声小品】技能已打开

        # 模拟用户说出【我要听相声】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 我要听相声         |

    @Smoke
    场景大纲: 有声小说
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放小说】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        #那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 播放小说          |

    @Smoke
    场景大纲: 广播电台
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【广播电台】技能已打开

        # 模拟用户说出【我要听电台】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 我要听广播         |

    @Smoke
    场景大纲: 笑话
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【广播电台】技能已打开

        # 模拟用户说出【来个笑话】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 来个笑话          |

    @Smoke
    场景大纲: 历史-历史
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【历史】技能已打开

        # 模拟用户说出【我想看乾隆皇帝的历史】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 乾隆皇帝的历史       | 乾隆皇帝        |

    @Smoke
    场景大纲: 故事-故事
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【故事】技能已打开

        # 模拟用户说出【给我讲个故事吧】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 一起来听        |
            | 嗯，我们一起来听    |
            | 好啊，我们一起听听   |
            | 要乖乖睡觉了哦。    |
            | 来了，喜欢的话，记得给 |
            | 好的，小飞和你一起听  |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 给我讲个故事吧       |

    @Smoke
    场景大纲: 超级简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【超级简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content      |
            | 最新的电竞赛事报道        |
            | 掌握最新房价动态         |
            | 每天3分钟，掌握汽车新动态    |
            | 传递全球教育新知         |
            | 腾讯今天的新动作         |
            | 你喜欢的电视剧有更新啦      |
            | 吃最新鲜的瓜           |
            | 今天有哪些大公司传出了坏消息？  |
            | 每天3分钟，掌握最热资讯     |
            | 新片儿早知道           |
            | 全球体育赛事追踪         |
            | 找到你的Style        |
            | 每天提供育儿信息，呵护孩子成长  |
            | 每日供应最新鲜的财经资讯     |
            | 全面及时的NBA资讯播报     |
            | 过去的今天发生了什么？      |
            | 你不能错过的今日要闻       |
            | 速览前沿科技           |
            | 网罗全球新鲜的IT数码行业新闻  |
            | 最新的动漫、手办、游戏及周边情报 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开超级简报        |

    @Smoke
    场景大纲: 36氪快讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【36氪快讯】技能已打开

        # 模拟用户说出【打开36氪快讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content         |
            | 打开36氪快讯       | 为你播放36氪快讯，以下是最新科技新闻 |

    @Smoke
    场景大纲: 智能跑走
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【智能跑走】技能已打开

        # 模拟用户说出【智能跑走】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【停止播放】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【停止播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        例子:     语料
            | voice_content | tts_content |
            | 打开智能跑走        | 即将播放韵律跑节奏音乐 |

    @Smoke
    场景大纲: 修行者
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【修行者】技能已打开

        # 模拟用户说出【修行者】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【开始坐禅】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【开始坐禅】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【今天，你想选择多长时间的坐禅呢？5分钟，10分钟，还是15分钟呢？】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【开始坐禅】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【5分钟】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content                                 |
            | 打开修行者         | 和我说“开始坐禅”开始今天的坐禅修行。也可以和我说“播放音乐”，我会为你播放悦耳梵音。 |

    @Smoke
    场景大纲: 音量控制-设置音量
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为11%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        # 回复音量变更状态
        当        iFlyOS客户端发送event【Speaker】，【VolumeChanged】
        那么      iFlyOS服务端回复状态为【200】成功

        # 查询音量
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量多少】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | volume |
            | 把音量设置为11%     | 11     |

    @Smoke
    场景大纲: 音量控制-调整音量
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐
        假如      iFlyOS客户端音量为【<current_volume>%】

       # 查询音量
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量多少】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<current_volume>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【声音大一点】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<new_volume>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复音量变更状态
        当        iFlyOS客户端发送event【Speaker】，【VolumeChanged】
        那么      iFlyOS服务端回复状态为【200】成功

        # 查询音量
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量多少】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<new_volume>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | current_volume | new_volume |
            | 大声一点          | 50             | 60         |
            | 小声一点          | 50             | 40         |

    @Smoke
    场景大纲: 音量控制-设置静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【设置为静音】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetMute】，参数【mute】为【<mute>】
        # 回复音量变更状态
        当        iFlyOS客户端发送event【Speaker】，【MuteChanged】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端静音状态为【<mute>】

        例子:     语料
            | voice_content | mute |
            | 静音            | true |

    @Smoke
    场景大纲: 音量控制-取消静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【取消静音】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetMute】，参数【mute】为【<mute>】
        # 回复音量变更状态
        当        iFlyOS客户端发送event【Speaker】，【MuteChanged】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端静音状态为【<mute>】

        例子:     语料
            | voice_content | mute  |
            | 取消静音          | false |

    @Smoke
    场景大纲: 音频播放器-pause//暂停播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【暂停】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器状态为【STOP】

        例子: 语料
            | voice_content |
            | 暂停            |

    @Smoke @fail
    场景大纲: 音频播放器-resume//继续播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端在【60000】暂停播放了音乐

        # 模拟用户说出【继续】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，参数【offsetInMilliseconds】为【60000】
        # 回复继续播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器状态为【PLAY】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【60000】

        例子: 语料
            | voice_content |
            | 继续播放          |

    @Smoke
    场景大纲: 音乐点播-音频收藏
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音乐点播】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【喜欢这首歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【收藏】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 喜欢这首歌         |

    @Smoke
    场景大纲: 音乐点播-播放收藏的音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音乐点播】技能已打开

        # 模拟用户说出【播放我的收藏】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 播放我的收藏        |

    @Smoke
    场景大纲: 音频播放器-next//切换到播放列表中的下一个
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【下一首】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】

        例子: 语料
            | voice_content |
            | 下一首           |

    @Smoke
    场景大纲: 音频播放器-previous//切换到播放列表中的上一个
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【下一首】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一首】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】

        # 模拟用户说出【上一首】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】

        例子: 语料
            | voice_content |
            | 上一首           |

    @Smoke
    场景大纲: 音频播放器-查询当前节目
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【音频播放器】技能已打开

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦         |
            | 稻香          |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【这是什么歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | tts_content  |
            | 这是什么歌         | 现在播放的是周杰伦的稻香 |

    @Smoke @Alerts
    场景大纲: 设置闹钟/提醒-设置闹钟成功
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午八点提醒我】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】为None
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts                           |
            | 好的，已为你设置好<tts_content>的闹钟     |
            | 好的，交给我吧，我会在<tts_content>提醒你   |
            | 已帮你定好<tts_content>的闹钟，我会准时提醒你 |
            | 没问题，已帮你把闹钟设置到<tts_content>    |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【<scheduled_time>】

        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | scheduled_time | template_type | title | text_field | sub_text_field |
            | 明天上午八点提醒我     | 明天上午八点      | 00:00:00       | BodyTemplate3 | 闹钟    | 08:00      | None           |

    @Smoke @Alerts
    场景: 设置闹钟/提醒-闹钟时间到响铃
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午十点提醒我回家吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【明天上午十点提醒我回家吃饭】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts                        |
            | 好的，已为你设置好明天上午十点回家吃饭的闹钟     |
            | 好的，交给我吧，我会在明天上午十点提醒你回家吃饭   |
            | 已帮你定好明天上午十点的闹钟，我会准时提醒你回家吃饭 |
            | 没问题，已帮你把回家吃饭闹钟设置到明天上午十点    |
            | 好的，我会在明天上午十点提醒你回家吃饭        |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【02:00】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功

    @Smoke @Alerts
    场景大纲: 设置闹钟/提醒-闹钟响铃时停止闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午十点提醒我回家吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【明天上午十点提醒我回家吃饭】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts                        |
            | 好的，已为你设置好明天上午十点回家吃饭的闹钟     |
            | 好的，交给我吧，我会在明天上午十点提醒你回家吃饭   |
            | 已帮你定好明天上午十点的闹钟，我会准时提醒你回家吃饭 |
            | 没问题，已帮你把回家吃饭闹钟设置到明天上午十点    |
            | 好的，我会在明天上午十点提醒你回家吃饭        |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【02:00】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredBackground】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
        当        iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 停止闹钟          |

    @Smoke @Alerts
    场景大纲: 设置闹钟/提醒-查询闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【我有几个闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【ListTemplate1】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 你有1个闹钟，是今天晚上9点 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我有几个闹钟        |

    @Smoke @Alerts @disable
    场景大纲: 设置闹钟/提醒-删除单次闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【删除晚上九点钟的闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content                     |
            | 删除闹钟功能还在学习中，暂时请到手机APP上进行闹钟删除操作吧 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
#        当        iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
#        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 删除晚上九点钟的闹钟    |

    @Smoke @Alerts @disable
    场景大纲: 设置闹钟/提醒-删除循环闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【每天晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【删除晚上九点钟的闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content                     |
            | 删除闹钟功能还在学习中，暂时请到手机APP上进行闹钟删除操作吧 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
#        当        iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
#        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 删除每天晚上九点钟的闹钟  |

    @Smoke @Alerts
    场景大纲: 设置闹钟/提醒-清空闹钟列表
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【删除所有闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，已为你删除全部闹钟】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
        当        iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 删除所有闹钟        |

    @Smoke
    场景大纲: 计时器
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【计时器】技能已打开

        # 模拟用户说出【计时一分钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【Alerts】，【AlertStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | answer | template_type | title | text_field    | sub_text_field |
            | 一分钟倒计时        | 1分钟    | BodyTemplate3 | 倒计时   | 好的，我会在1分钟后提醒你 | 设置成功           |

    @Smoke
    场景大纲: 油价查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【油价查询】技能已打开

        # 模拟用户说出【帮我查下今天的油价】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | main_title | sub_title | left_text_field | right_text_field |
            | 安徽柴油什么价格      | 安徽省         | ListTemplate1 | 油价查询       | 安徽        | 号               | 元/升              |

    @Smoke
    场景大纲: 限行查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【限行查询】技能已打开

        # 模拟用户说出【查询今天北京的限行】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 查询今天北京的限行     | 限行          |

    @Smoke
    场景大纲: 计算器
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【计算器】技能已打开

        # 模拟用户说出【一加一等于多少】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | title | text_field | sub_text_field |
            | 1+1等于多少       | 等于2         | BodyTemplate3 | 计算    | 2          | 1+1            |

    @Smoke
    场景大纲: 放假安排
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【国庆节放假安排】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content               |
            | 2019年国庆节是2019-10-01，放假安排是 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 国庆节放假安排       |

    @Smoke
    场景大纲: 词语解释
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【词语解释】技能已打开

        # 模拟用户说出【怎么解释词语风马牛不相及】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为【<sub_title>】，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | answer     | template_type | main_title | sub_title               | text_field |
            | 怎么解释词语风马牛不相及  | 比喻事物彼此毫不相干 | BodyTemplate1 | 风马牛不相及     | fēng mǎ niú bù xiāng jí | 比喻事物彼此毫不相干 |

    @Smoke
    场景大纲: 成语查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【成语查询】技能已打开

        # 模拟用户说出【查下成语马到成功】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | answer       | template_type | main_title | text_field   |
            | 查下成语马到成功      | 形容工作刚开始就取得成功 | BodyTemplate1 | 马到成功       | 形容工作刚开始就取得成功 |

    @Smoke
    场景大纲: 股票查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【中兴通讯的股票】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | stock    | answered | template_type | title | text_field | sub_text_field |
            | 中兴通讯的股票       | 中兴通讯当前股价 | 不需要      | BodyTemplate3 | 查股票   | 元          | 中兴通讯           |

    @Smoke
    场景大纲: 翻译
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【翻译】技能已打开

        # 模拟用户说出【帮我翻译所见即所得】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<translation>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | translation                  | template_type | title | text_field                   | sub_text_field |
            | 帮我翻译所见即所得     | What you see is what you get | BodyTemplate3 | 中英翻译  | What you see is what you get | 所见即所得          |

    @Smoke
    场景大纲: 古诗词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【来一首李白的静夜思】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为【<sub_title>】，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | answer       | template_type | main_title | sub_title | text_field               |
            | 李白的静夜思        | 床前明月光，疑是地上霜。 | BodyTemplate1 | 静夜思        | 李白        | 床前明月光，疑是地上霜。举头望明月，低头思故乡。 |

    @Smoke
    场景大纲: 食物热量
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【食材百科】技能已打开

        # 模拟用户说出【200克苹果的热量】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | answer   | template_type | title | text_field | sub_text_field |
            | 200克苹果的热量     | 106千卡的热量 | BodyTemplate3 | 食物热量  | 热量         | 200克苹果         |

    @Smoke
    场景大纲: 近反义词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【近反义词】技能已打开

        # 模拟用户说出【开心的近义词】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为【<sub_title>】，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | template_type | main_title | sub_title | text_field |
            | 开心的近义词        | BodyTemplate1 | 开心         | 近义词       | 、          |

    @Smoke
    场景: 美食天下菜谱
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【美食天下菜谱】技能已打开

        # 模拟用户说出【打开美食天下】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开美食天下】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【欢迎使用美食天下】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【教我做山药】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【今天吃什么】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【我来给你推荐几道菜吧】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content      |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见               |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @Smoke
    场景大纲: 成语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【成语接龙】技能已打开

        # 模拟用户说出【打开成语接龙】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 只要进入技能后是不追问而且不结束session的就会下发AudioPlayer的stop
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【欢迎来玩成语接龙】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【我先开始】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我先开始】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content     |
            | 请先给我一个成语吧，比如：   |
            | 那请先跟我说一个成语哦，比如： |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开成语接龙        |

    @Smoke @disable
    场景大纲: 词语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【词语接龙】技能已打开

        # 模拟用户说出【打开词语接龙】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【词语接龙】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【我先开始】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【天地】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【地】
        #那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【我先开始】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【谢谢】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开词语接龙        |

    @Smoke
    场景大纲: 百科问答
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【百科问答】技能已打开

        # 模拟用户说出【恐龙为什么会灭绝】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【恐龙】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | template_type | main_title |
            | 恐龙为什么会灭绝      | BodyTemplate1 | 恐龙为什么会灭绝   |

    @Smoke @Audio
    场景: 白噪音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【白噪音】技能已打开

        # 模拟用户说出【打开白噪音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开白噪音】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放白噪音】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @Smoke @Audio
    场景: 眼保健操
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【眼保健操】技能已打开

        # 模拟用户说出【打开眼保健操】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开眼保健操】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【眼保健操开始】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @Smoke @Audio
    场景大纲: 冥想时刻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【冥想时刻】技能已打开

        # 模拟用户说出【打开冥想时刻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放冥想时刻】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 打开冥想时刻        |

    @Smoke @Audio
    场景: 好好睡觉
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【好好睡觉】技能已打开

        # 模拟用户说出【打开好好睡觉】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开好好睡觉】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放助眠音乐，晚安】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @Smoke @Audio
    场景: 越听越聪明
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【越听越聪明】技能已打开

        # 模拟用户说出【越听越聪明】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开越听越聪明】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放越听越聪明】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @Smoke @fail
    场景大纲: 口算挑战
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【口算挑战】技能已打开

        # 模拟用户说出【口算挑战】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 请回答         |
            | 请问          |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【10】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<answered>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 回答正确        |
            | 正确答案是       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【不玩了】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【共[n2]1题，您答对[n2]】和【道题,正确率为：】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | answered |
            | 打开口算挑战        | 10       |

    @Smoke
    场景大纲: 诗词挑战
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【诗词挑战】技能已打开

        # 模拟用户说出【诗词挑战】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 只要进入技能后是不追问而且不结束session的就会下发AudioPlayer的stop
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，开始挑战吧。请先选择题目类型。题目类型分为两类，一类是回答诗句、一类是回答诗人。请选择】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【回答诗句】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<asked>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，请仔细听题】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【但愿人长久】或【杜甫】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<answered>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 回答正确           |
            | 回答错误，上一题的正确答案是 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 你一题也没有答对    |
            | 全都答对了       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | asked | answered |
            | 打开诗词挑战        | 回答诗句  | 但愿人长久    |

    @Smoke
    场景大纲: 挑战单词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【挑战单词】技能已打开

        # 模拟用户说出【打开挑战单词】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content                                          |
            | 欢迎来到挑战单词。游戏有四关，难度递增。我给你一个单词，你来猜这个单词的类型。准备好了对我说“开始游戏” |
            | 欢迎回到挑战单词。你可以了解玩法或开始挑战                                |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【开始游戏】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【开始游戏】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【第1关：请直接说出这个单词的类型。第1题：】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回答
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【坦率诚实】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 正确答案是       |
            | 你答对了        |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 退出
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【不玩了】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【谢谢你参与挑战单词。你在第】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开挑战单词        |

    @Smoke
    场景大纲: 九九乘法表
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【九九乘法表】技能已打开

        # 模拟用户说出【练习九九乘法表】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的,小朋友注意了，我要出几道题考考你】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【问题答案】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【24】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 答对了         |
            | 这道题正确答案是    |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已退出】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 练习九九乘法表       |

    @Smoke
    场景大纲: 会说话的小鹦鹉
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【会说话的小鹦鹉】技能已打开

        # 模拟用户说出【打开会说话的小鹦鹉】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【小鹦鹉】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【换一个声音】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【换一个声音】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 我变了一个超有型的声音 |
            | 小鹦鹉变身成功     |
            | 小鹦鹉变身       |
            | 小鹦鹉变声成功     |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【把语速调快一点】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【把语速调快一点】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 小鹦鹉已经调整了语速  |
            | 小鹦鹉变声成功     |
            | 小鹦鹉变速成功     |
            | 我的语速要变了哦    |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我不想玩了】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content                   |
            | 今天玩的很开心，谢谢你啦，碰到有意思的东西，记得再教教我哟 |
            | 今天小鹦鹉真是收获满满，很开心跟你一起玩耍，再见啦     |
            | 小鹦鹉也要回窝休息啦，待会再玩吧              |
            | 时光一去不复回，期待下次再与你相会。            |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开会说话的小鹦鹉     |

    @Smoke @Audio @disable
    场景大纲: 打开如意冥想音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【如意冥想音乐】技能已打开

        # 模拟用户说出【如意冥想音乐】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【安然地冥想音乐帮你摆脱心念的滋扰，下雨声、鸟叫声、海浪声和流水声，随你点播】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【下雨声】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下雨声】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 退出
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已退出】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开如意冥想音乐      |

    @Smoke
    场景大纲: 英语每日一句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【英语每日一句】技能已打开

        # 模拟用户说出【英语每日一句】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】包含【<main_title>】，参数【subTile】包含【<sub_title>】，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | template_type | main_title | sub_title |
            | 我要学英语         | BodyTemplate1 | 年          | 英语每日一句    |

    @Smoke
    场景大纲: 造句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【造句】技能已打开

        # 模拟用户说出【用鸦雀无声造句】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【鸦雀无声】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | template_type | title | text_field | sub_text_field |
            | 用鸦雀无声造句       | BodyTemplate3 | 造句    | 鸦雀无声       | 鸦雀无声           |

    @Smoke
    场景大纲: 首都查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【首都查询】技能已打开

        # 模拟用户说出【中国的首都在哪】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 |
            | 中国的首都在哪       | 中国的首都       | 北京           |

    @Smoke
    场景大纲: 世界杯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【世界杯】技能已打开

        # 模拟用户说出【俄罗斯和沙特的赛果】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 俄罗斯和沙特的赛果     | 世界杯         |

    @Smoke
    场景大纲: 面积换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【面积换算】技能已打开

        # 模拟用户说出【1平方米换成平方厘米大约是多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | tts_content             | template_type | title | text_field  | sub_text_field |
            | 1平方米换成平方厘米大约是多少 | [n2]1平方米等于[n2]10000平方厘米 | BodyTemplate3 | 单位换算  | 10000(平方厘米) | 1(平方米)         |

    @Smoke
    场景大纲: 体积换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【体积换算】技能已打开

        # 模拟用户说出【1立方米等于多少升】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content         | template_type | title | text_field | sub_text_field |
            | 1立方米等于多少升     | [n2]1立方米等于[n2]1000升 | BodyTemplate3 | 单位换算  | 1000(升)    | 1(立方米)         |

    @Smoke
    场景大纲: 进制转换
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【进制转换】技能已打开

        # 模拟用户说出【二进制的1111等于十进制的多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content    | tts_content    | template_type | title | text_field | sub_text_field |
            | 二进制的1111等于十进制的多少 | 二进制1111等于十进制15 | BodyTemplate3 | 单位换算  | 15(十进制)    | 1111(二进制)      |

    @Smoke
    场景大纲: 功率换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【功率换算】技能已打开

        # 模拟用户说出【一千瓦等于多少焦耳每秒】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content           | template_type | title | text_field | sub_text_field |
            | 一千瓦等于多少焦耳每秒   | [n2]1千瓦等于[n2]1000焦耳每秒 | BodyTemplate3 | 单位换算  | 1000(焦耳每秒) | 1(千瓦)          |

    @Smoke
    场景大纲: 重量换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【重量换算】技能已打开

        # 模拟用户说出【能告诉我1吨等于多少千克吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content        | template_type | title | text_field | sub_text_field |
            | 能告诉我1吨等于多少千克吗 | [n2]1吨等于[n2]1000千克 | BodyTemplate3 | 单位换算  | 1000(千克)   | 1(吨)           |

    @Smoke
    场景大纲: 单位换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【单位换算】技能已打开

        # 模拟用户说出【8米等于多少厘米】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | title | text_field | sub_text_field |
            | 8米等于多少厘米      | 8米等于800厘米   | BodyTemplate3 | 单位换算  | 800(厘米)    | 8(米)           |

    @Smoke
    场景大纲: 单位换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【单位换算】技能已打开

        # 模拟用户说出【20摄氏度等于多少华氏度】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content          | template_type | title | text_field | sub_text_field |
            | 20摄氏度等于多少华氏度  | [n2]20摄氏度等于[n2]68华氏度 | BodyTemplate3 | 单位换算  | 68(华氏度)    | 20(摄氏度)        |

    @Smoke
    场景大纲: 省会查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【省会查询】技能已打开

        # 模拟用户说出【安徽的省会是什么】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 安徽的省会是什么      | 是合肥市        |

    @Smoke
    场景大纲: 万年历查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【万年历查询】技能已打开

        # 模拟用户说出【今天不适合做什么】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 | template_type | main_title | text_field |
            | 今天不适合做什么      | 农历          | 不适合          | BodyTemplate1 | 今天不适合做什么   | 不宜         |

    @Smoke
    场景大纲: 十万个为什么
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【十万个为什么】技能已打开

        # 模拟用户说出【为什么脑子会越用越灵】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content                                                                     | template_type | main_title | text_field          |
            | 为什么脑子会越用越灵    | 有人会担心，用脑过度会有损健康。事实上，这是没有科学根据的。相反的是人的脑子可以越用越灵。勤动脑，大脑就会永葆青春;思想懒惰了，就会反应迟钝，甚至可能成为痴呆 | BodyTemplate1 | 为什么脑子会越用越灵 | 有人会担心，用脑过度会有损健康。事实上 |

    @Smoke
    场景大纲: 热点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【热点】技能已打开

        # 模拟用户说出【赵日天是谁】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content    | template_type | main_title | text_field     |
            | 赵日天是谁         | 在下赵日天，狂霸天下之我最牛 | BodyTemplate1 | 赵日天是谁      | 在下赵日天，狂霸天下之我最牛 |

    @Smoke
    场景大纲: 生肖运势
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【生肖运势】技能已打开

        # 模拟用户说出【今年出生的是什么生肖】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】不为空，参数【subtextField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | title |
            | 今年出生的是什么生肖    | 的生肖为        | BodyTemplate3 | 生肖    |

    @Smoke
    场景大纲: 高校查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【高校查询】技能已打开

        # 模拟用户说出【北京有哪些大学】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为【<sub_title>】，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | main_title | sub_title | text_field |
            | 北京有哪些大学       | 大学          | BodyTemplate1 | 北京有哪些大学    | 高校查询      | 大学         |

    @Smoke
    场景大纲: 星座
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【星座】技能已打开

        # 模拟用户说出【白羊座今年的运势】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为【<sub_title>】，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | main_title | sub_title | text_field |
            | 白羊座今年的运势      | 白羊座的综合运势    | BodyTemplate1 | 白羊座        | 星座运势      | 白羊座的综合运势   |

    @Smoke
    场景大纲: 汇率查询与货币兑换
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【汇率查询与货币兑换】技能已打开

        # 模拟用户说出【50美元可以兑换多少人民币】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | title | text_field | sub_text_field |
            | 50美元可以兑换多少人民币 | 50美元可兑换成    | BodyTemplate3 | 查汇率   | 人民币        | 50美元           |

    @Smoke
    场景大纲: 家族关系神器
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【家族关系神器】技能已打开

        # 模拟用户说出【爸爸的爸爸是我的什么】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | title | text_field | sub_text_field |
            | 爸爸的爸爸是我的什么    | 爸爸的爸爸是你的爷爷  | BodyTemplate3 | 亲属称谓  | 爷爷         | 爸爸的爸爸是         |

    @Smoke
    场景大纲: 百家姓
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【百家姓】技能已打开

        # 模拟用户说出【百家姓你知道有哪些吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content         | template_type | main_title | text_field          |
            | 百家姓你知道有哪些吗    | 赵钱孙李，周吴郑王。冯陈楮卫，蒋沈韩杨 | BodyTemplate1 | 百家姓你知道有哪些吗 | 赵钱孙李，周吴郑王。冯陈楮卫，蒋沈韩杨 |

    @Smoke
    场景大纲: 国内城市查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【国内城市查询】技能已打开

        # 模拟用户说出【国内城市查询】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content             | template_type | main_title | text_field  |
            | 安徽省有哪些城市      | 安徽省一共有16座城市，分别是:合肥市、芜湖市 | BodyTemplate1 | 安徽省有哪些城市   | 安徽省一共有16座城市 |

    @Smoke
    场景大纲: 经典名句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【经典名句】技能已打开

        # 模拟用户说出【关于励志的经典句子】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】包含【<text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | template_type | main_title | text_field |
            | 丘吉尔的名言        | 丘吉尔         | BodyTemplate1 | 经典名言       | 丘吉尔        |

    @Smoke
    场景大纲: 飞花令
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【飞花令】技能已打开

        # 模拟用户说出【飞花令】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 打开飞花令         | 玩飞花令        |

    @Smoke
    场景大纲: 智能家居
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开灯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title  | text_field |
            | 执行失败原因 | 未找到设备      |
            | 执行失败原因 | 请检查网络      |
            | 开关控制   | 设备已开启      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好的          |
            | 没有找到这个设备    |
            | 请检查设备网络     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开灯           |

    @Smoke
    场景大纲: 党建
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【十九大报告题目】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content                  |
            | 十九大报告题目       | 决胜全面建成小康社会，夺取新时代中国特色社会主义伟大胜利 |