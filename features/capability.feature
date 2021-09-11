# Created by enrico at 2018/4/30
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 事件服务模块测试
    ============================================

    @TypicalCase @Capability @fail
    场景大纲: 端能力-不上报端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【不上报】端能力

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content        |
            | 你听了也会大吃一惊呢         |
            | 不知道听什么的时候我也爱听新闻    |
            | 这些事蛮               |
            | 一起了解下国家大事          |
            | 虽然我不是很厉害，但忍不住心系天下呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @TypicalCase @Capability @fail
    场景大纲: 端能力-上报必需端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content        |
            | 你听了也会大吃一惊呢         |
            | 不知道听什么的时候我也爱听新闻    |
            | 这些事蛮               |
            | 一起了解下国家大事          |
            | 虽然我不是很厉害，但忍不住心系天下呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @TypicalCase @Capability @fail
    场景大纲: 端能力-不上报TemplateRuntime端能力，企业平台上未配置【屏幕显示】，不下发TemplateRuntime
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content        |
            | 你听了也会大吃一惊呢         |
            | 不知道听什么的时候我也爱听新闻    |
            | 这些事蛮               |
            | 一起了解下国家大事          |
            | 虽然我不是很厉害，但忍不住心系天下呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @TypicalCase @Capability
    场景大纲: 端能力-不上报TemplateRuntime端能力，企业平台上配置【屏幕显示】，下发1.0版本TemplateRuntime
        假如      用户已有带屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content        |
            | 你听了也会大吃一惊呢         |
            | 不知道听什么的时候我也爱听新闻    |
            | 这些事蛮               |
            | 一起了解下国家大事          |
            | 虽然我不是很厉害，但忍不住心系天下呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @TypicalCase @Capability
    场景大纲: 端能力-上报TemplateRuntime端能力
        假如      用户已有带屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content        |
            | 你听了也会大吃一惊呢         |
            | 不知道听什么的时候我也爱听新闻    |
            | 这些事蛮               |
            | 一起了解下国家大事          |
            | 虽然我不是很厉害，但忍不住心系天下呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报TemplateRuntime端能力，技能需求下发的模板设备的端能力版本不支持，对模板进行降级下发处理，或过滤处理。
        假如      用户已有带屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【模板】且版本号为【1.0】

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content        |
            | 你听了也会大吃一惊呢         |
            | 不知道听什么的时候我也爱听新闻    |
            | 这些事蛮               |
            | 一起了解下国家大事          |
            | 虽然我不是很厉害，但忍不住心系天下呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-不上报Bluetooth端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【搜索蓝牙设备】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 搜索蓝牙设备        |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报Bluetooth端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【蓝牙】且版本号为【1.0】

        # 模拟用户说出【搜索蓝牙设备】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【Bluetooth】，【ScanDevices】

        当        iFlyOS客户端发送event【Bluetooth】，【ScanDevicesUpdated】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 搜索蓝牙设备        |

    @TypicalCase @Capability @fail
    场景大纲: 端能力-使用咪咕音乐的设备从未上报过端能力
        假如      用户已有带屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户产品【不上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要听刘德华的忘情水    |

    @TypicalCase @Capability @fail
    场景大纲: 端能力-使用咪咕音乐的设备上报默认端能力
        假如      用户已有带屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户产品【上报】端能力，端能力为【默认】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @fail
    场景大纲: 端能力-未发布设备上报咪咕音乐端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用未发布的客户端设备
        假如      用户产品【音乐】技能已打开
        假如      用户产品【上报】端能力，端能力为【咪咕音乐】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content                 |
            | IFLY OS现在支持咪咕音乐播放，若需体验请联系商务 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @fail
    场景大纲: 端能力-已发布设备上报咪咕音乐端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用已发布的客户端设备
        假如      用户产品【音乐】技能已打开
        假如      用户产品【上报】端能力，端能力为【咪咕音乐】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content                          |
            | 没问题，小飞的原创电台已经上线，每晚8点更新，想要听的话，对我说电音电台 |
            | 好的，一起来听                              |
            | 一起来听听                                |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @fail
    场景大纲: 端能力-不上报DND端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【休眠】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 休眠            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报DND端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【免打扰】且版本号为【1.0】

        # 模拟用户说出【休眠】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【DoNotDisturb】，【SetDoNotDisturb】

        当        iFlyOS客户端发送event【DoNotDisturb】，【ReportDoNotDisturb】，参数【enabled】为【<enabled>】
        那么     iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | enabled |
            | 休眠            | true    |

    @TypicalCase @Capability @wip
    场景: 端能力-不上报唤醒词端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 需要在小飞在线中查看设备是否有唤醒词选项

    @TypicalCase @Capability @wip
    场景: 端能力-上报唤醒词端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【唤醒词】且版本号为【1.0】

        # 需要在小飞在线中查看设备是否有唤醒词选项

    @TypicalCase @Capability @wip
    场景: 端能力-不上报Configuration端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 需要在企业平台设备弱唤醒阀值

    @TypicalCase @Capability @wip
    场景: 端能力-上报Configuration端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【云端配置】且版本号为【1.0】

        # 需要在企业平台设备弱唤醒阀值

        那么      iFlyOS服务端回复的directive为【Configuration】，【SetWeakWakeUpScore】

    @TypicalCase @Capability
    场景大纲: 端能力-不上报iFLYOS::Transparent::Infrared端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【打开灯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好的          |
            | 没有找到这个设备    |
            | 请检查设备网络     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端没有回复的directive为【iFLYOS::Transparent::Infrared】，【Control】

        例子:     语料
            | voice_content |
            | 打开灯           |

    @TypicalCase @Capability
    场景大纲: 端能力-上报iFLYOS::Transparent::Infrared端能力
        假如      用户已有红外产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【红外】且版本号为【1.0】
        假如      设备已经绑定红外家电的灯

        # 模拟用户说出【打开灯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好的          |
            | 没有找到这个设备    |
            | 请检查设备网络     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【iFLYOS::Transparent::Infrared】，【Control】

        当        iFlyOS客户端发送event【iFLYOS::Transparent::Infrared】，【InfraredControlSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开灯           |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-不上报CustomApp端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报CustomApp端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【自定义】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-不上报VisualActivityTracker端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip @debug
    场景大纲: 端能力-上报VisualActivityTracker端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【视觉焦点】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 一起来听        |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-不上报AudioActivityTracker端能力
        假如      用户已有无屏产品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户产品【上报】端能力，端能力为【空】且版本号为【1.0】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报AudioActivityTracker端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报所有端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报1.1 Alerts端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报1.0 SpeechRecognizer端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability @wip
    场景大纲: 端能力-上报1.0 System端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @TypicalCase @Capability
    场景: 端能力-设备更新、恢复出厂、设备重启、重置网络需要端能力System版本为1.1时才能使用
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用已发布的客户端设备
        假如      用户产品【音乐】技能已打开
        假如      用户产品【上报】端能力，端能力为【系统】且版本号为【1.1】

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报不存在的端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报错误的端能力版本号
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报错误的envelopeVersion
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报空的envelopeVersion
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报空的type
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报空的interface
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报空的version
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报空的capabilities
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-不上报capabilities字段
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-上报重复的端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |

    @ExtraCase @Capability @wip
    场景大纲: 端能力-只上报可选端能力，不上报必需的端能力
        假如      用户已绑定iFlyOS客户端设备
        假如      用户使用的客户端设备使用咪咕音乐
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      用户产品【不上报】端能力且端能力为【空】

        # 模拟用户说出【听歌】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么     iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content            |
            | 未开通音乐畅听权限，请打开APP查看设备详情 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么     iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么     iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 听歌            |