# Created by enrico at 2018/7/26
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 事件服务模块测试
    ============================================

# 典型用例

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号汽车简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号汽车简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放汽车简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号汽车简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号电影简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号电影简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放电影简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号电影简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号明星简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号明星简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放明星简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号明星简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号体育简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号体育简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放体育简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号体育简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号科技简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号科技简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放科技简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号科技简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号综合简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号综合简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放综合简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号综合简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号时尚简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号时尚简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放时尚简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号时尚简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号房产简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号房产简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放房产简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号房产简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号教育简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号教育简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放教育简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号教育简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号电竞简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号电竞简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放电竞简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号电竞简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号商业简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号商业简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放商业简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号商业简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号NBA简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号NBA简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放NBA简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号NBA简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号数码简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号数码简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放数码简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号数码简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号二次元简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号二次元简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放二次元简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号二次元简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号全网热议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号全网热议】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放全网热议|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号全网热议|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号企鹅动态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号企鹅动态】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放企鹅动态|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号企鹅动态|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号历史上的今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号历史上的今天】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放历史上的今天|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号历史上的今天|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号大公司不开心
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【打开订阅号大公司不开心】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放大公司不开心|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号大公司不开心|

    @TypicalCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开
        假如      用户已删除所有订阅号

        # 订阅列表为空
        # 模拟用户说出【打开订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【你还没有订阅任何内容，快去订阅喜欢的内容吧】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 只有一个订阅号有更新
        假如      用户已添加订阅内容【汽车简报】
        # 模拟用户说出【打开订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好嘞 正在为你播放汽车简报】
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

        # 多个订阅号有更新
        假如      用户已添加订阅内容【大公司不开心】
        # 模拟用户说出【打开订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 更新的订阅号有：大公司不开心,汽车简报, 你要收听哪个订阅号呢？|
            | 更新的订阅号有：汽车简报,大公司不开心, 你要收听哪个订阅号呢？|
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【中午十二点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【汽车简报】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放汽车简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content |
            | 打开订阅号     |

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅汽车简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅汽车简报】的识别过程
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
            | 订阅汽车简报   | 已帮你订阅汽车简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅电影简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅电影简报】的识别过程
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
            | 订阅电影简报   | 已帮你订阅电影简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅明星简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅明星简报】的识别过程
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
            | 订阅明星简报   | 已帮你订阅明星简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅体育简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅体育简报】的识别过程
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
            | 订阅体育简报   | 已帮你订阅体育简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅科技简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅科技简报】的识别过程
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
            | 订阅科技简报   | 已帮你订阅科技简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅综合简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅综合简报】的识别过程
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
            | 订阅综合简报   | 已帮你订阅综合简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅时尚简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅时尚简报】的识别过程
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
            | 订阅时尚简报   | 已帮你订阅时尚简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅房产简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅房产简报】的识别过程
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
            | 订阅房产简报   |已帮你订阅房产简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅教育简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅教育简报】的识别过程
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
            | 订阅教育简报   | 已帮你订阅教育简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅电竞简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅电竞简报】的识别过程
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
            | 订阅电竞简报   | 已帮你订阅电竞简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅商业简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅商业简报】的识别过程
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
            | 订阅商业简报   | 已帮你订阅商业简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅NBA简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅NBA简报】的识别过程
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
            | 订阅NBA简报    | 已帮你订阅NBA简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅数码简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅数码简报】的识别过程
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
            | 订阅数码简报   | 已帮你订阅数码简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅二次元简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅二次元简报】的识别过程
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
            | 订阅二次元简报 | 已帮你订阅二次元简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅全网热议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅全网热议】的识别过程
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
            | 订阅全网热议   | 已帮你订阅全网热议|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅企鹅动态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅企鹅动态】的识别过程
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
            | 订阅企鹅动态   | 已帮你订阅企鹅动态|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅历史上的今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅历史上的今天】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  | tts_content |
            | 订阅历史上的今天| 已帮你订阅历史上的今天|

    @TypicalCase @Subscription
        场景大纲: 订阅号-添加订阅内容-订阅大公司不开心
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【订阅大公司不开心】的识别过程
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
            | 订阅大公司不开心| 已帮你订阅大公司不开心|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅汽车简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅汽车简报】的识别过程
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
            | 取消订阅汽车简报| 已取消订阅汽车简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅电影简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅电影简报】的识别过程
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
            | 取消订阅电影简报| 已取消订阅电影简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅明星简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅明星简报】的识别过程
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
            | 取消订阅明星简报| 已取消订阅明星简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅体育简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅体育简报】的识别过程
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
            | 取消订阅体育简报| 已取消订阅体育简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅科技简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅科技简报】的识别过程
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
            | 取消订阅科技简报| 已取消订阅科技简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅综合简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅综合简报】的识别过程
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
            | 取消订阅综合简报| 已取消订阅综合简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅时尚简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅时尚简报】的识别过程
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
            | 取消订阅时尚简报| 已取消订阅时尚简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅房产简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅房产简报】的识别过程
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
            | 取消订阅房产简报| 已取消订阅房产简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅教育简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅教育简报】的识别过程
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
            | 取消订阅教育简报| 已取消订阅教育简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅电竞简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅电竞简报】的识别过程
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
            | 取消订阅电竞简报| 已取消订阅电竞简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅商业简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅商业简报】的识别过程
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
            | 取消订阅商业简报| 已取消订阅商业简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅NBA简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅NBA简报】的识别过程
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
            | 取消订阅NBA简报| 已取消订阅NBA简报 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅数码简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅数码简报】的识别过程
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
            | 取消订阅数码简报| 已取消订阅数码简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅二次元简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅二次元简报】的识别过程
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
            | 取消订阅二次元简报| 已取消订阅二次元简报|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅全网热议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅全网热议】的识别过程
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
            | 取消订阅全网热议| 已取消订阅全网热议|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅企鹅动态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅企鹅动态】的识别过程
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
            | 取消订阅企鹅动态| 已取消订阅企鹅动态|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅历史上的今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅历史上的今天】的识别过程
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
            | 取消订阅历史上的今天| 已取消订阅历史上的今天|

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消订阅大公司不开心
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

        # 模拟用户说出【取消订阅大公司不开心】的识别过程
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
            | 取消订阅大公司不开心| 已取消订阅大公司不开心 |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除订阅内容-删除订阅号
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开
        假如      用户已删除所有订阅号

        # 只有一个订阅号
        假如      用户已添加订阅内容【汽车简报】
        # 模拟用户说出【删除订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅汽车简报】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 多个订阅号
        假如      用户已添加订阅内容【汽车简报】
        假如      用户已添加订阅内容【大公司不开心】
        # 模拟用户说出【删除订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 你的订阅号有：大公司不开心,汽车简报, 你要删除哪个订阅号呢？|
            | 你的订阅号有：汽车简报,大公司不开心, 你要删除哪个订阅号呢？|
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【大公司不开心】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【大公司不开心】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 删除订阅号     |

    @TypicalCase @Subscription
        场景大纲: 订阅号-删除所有订阅号
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开
        假如      用户已添加订阅内容【汽车简报】

        # 模拟用户说出【删除所有订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已为你删除所有的订阅号】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 删除所有订阅号 |


#扩展用例
    @ExtraCase @Subscription
        场景大纲: 订阅号-打开订阅号-订阅号{content}更新了什么
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【订阅号汽车简报更新了什么】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
#            | tts_content |
#            | 好嘞 正在为你播放汽车简报|
#            | 您没有更新的消息了，去订阅更多的内容吧。 |
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
#        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
#
#        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【content.txt】里所有语料组合用户语音订阅号{content}更新了什么，而且回复：【好嘞 正在为你播放】

        例子:     语料
            | voice_content |
            | 订阅号汽车简报更新了什么|

    @ExtraCase @Subscription
        场景大纲: 订阅号-打开订阅号-(打开|播放|收听)订阅号{content}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【打开订阅号汽车简报】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
#            | tts_content |
#            | 好嘞 正在为你播放汽车简报|
#            | 您没有更新的消息了，去订阅更多的内容吧。 |
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
#        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
#
#        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下turn_on语料和文件【content.txt】里所有语料组合用户语音{turn_on}订阅号{content}，而且回复：【好嘞 正在为你播放】
            | turn_on  |
            | 打开      |
            | 播放      |
            | 收听      |

        例子:     语料
            | voice_content |
            | 打开订阅号汽车简报|

    @ExtraCase @Subscription
        场景大纲: 订阅号-打开订阅号-打开订阅号
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开
        假如      用户已删除所有订阅号

        # 订阅列表为空
        # 模拟用户说出【打开订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【你还没有订阅任何内容，快去订阅喜欢的内容吧】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 只有一个订阅号有更新
        假如      用户已添加订阅内容【汽车简报】
        # 模拟用户说出【打开订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好嘞 正在为你播放汽车简报】
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

        # 多个订阅号有更新
        假如      用户已添加订阅内容【大公司不开心】
        # 模拟用户说出【打开订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 更新的订阅号有：大公司不开心,汽车简报, 你要收听哪个订阅号呢？|
            | 更新的订阅号有：汽车简报,大公司不开心, 你要收听哪个订阅号呢？|

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【中午十二点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【汽车简报】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好嘞 正在为你播放汽车简报|
            | 您没有更新的消息了，去订阅更多的内容吧。 |

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

        例子:     语料
            | voice_content   |
            | 打开订阅号       |
            | 播放订阅号       |
            | 听订阅号         |
            | 收听订阅号       |
            | 订阅号更新了什么 |

    @ExtraCase @Subscription
        场景大纲: 订阅号-添加订阅内容-(订阅|关注){content}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【订阅科技简报】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已帮你订阅科技简报】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【content.txt】里所有语料组合用户语音{add}{content}，而且回复：【好嘞 正在为你播放】
            | add  |
            | 订阅      |
            | 关注      |

        例子:     语料
            | voice_content |
            | 订阅科技简报|

    @ExtraCase @Subscription
        场景大纲: 订阅号-添加订阅内容-(添加|关注)订阅号{content}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【添加订阅号科技简报】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已帮你订阅科技简报】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【content.txt】里所有语料组合用户语音{add}订阅号{content}，而且回复：【已帮你订阅】
            | add  |
            | 添加      |
            | 关注      |

        例子:     语料
            | voice_content |
            | 添加订阅号科技简报|

    @ExtraCase @Subscription
        场景大纲: 订阅号-添加订阅内容-把{content}(加入|加进)订阅列表
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【把科技简报加入订阅列表】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已帮你订阅科技简报】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【content.txt】里所有语料组合用户语音把{content}{add}订阅列表，而且回复：【已帮你订阅】
            | add  |
            | 加入 |
            | 加进 |

        例子:     语料
            | voice_content |
            | 把科技简报加入订阅列表|

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除订阅内容-(删除|取消)订阅号{content}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【取消订阅号大公司不开心】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下minor语料和文件【content.txt】里所有语料组合用户语音{minor}订阅号{content}，而且回复：【已帮你订阅】
            | minor  |
            | 删除      |
            | 取消      |

        例子:     语料
            | voice_content |
            | 取消订阅号大公司不开心|

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除订阅内容-(删除|取消){content}[的]订阅
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【取消大公司不开心订阅】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下minor语料和文件【content.txt】里所有语料组合用户语音{minor}{content}【的】订阅，而且回复：【已取消】
            | minor|
            | 删除 |
            | 取消 |

        当       iFlyOS客户端从以下minor语料和文件【content.txt】里所有语料组合用户语音{minor}{content}【空】订阅，而且回复：【已取消】
            | minor|
            | 删除 |
            | 取消 |

        例子:     语料
            | voice_content |
            | 取消大公司不开心订阅|

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消(订阅|关注){content}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【取消订阅大公司不开心】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下minor语料和文件【content.txt】里所有语料组合用户语音取消{minor}{content}，而且回复：【已取消】
            | minor  |
            | 订阅      |
            | 关注      |

        例子:     语料
            | voice_content |
            | 取消订阅大公司不开心|

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除订阅内容-{content}取消(订阅|关注)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【大公司不开心取消订阅】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下minor语料和文件【content.txt】里所有语料组合用户语音{content}取消{minor}，而且回复：【已取消】
            | minor  |
            | 订阅      |
            | 关注      |

        例子:     语料
            | voice_content |
            | 大公司不开心取消订阅|

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除订阅内容-把{content}从列表中(移除|删除)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【把大公司不开心从列表中移除】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下minor语料和文件【content.txt】里所有语料组合用户语音把{content}从列表中{minor}，而且回复：【已取消】
            | minor  |
            | 移除 |
            | 删除 |

        例子:     语料
            | voice_content |
            | 把大公司不开心从列表中移除|

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除订阅内容-不想(订阅|关注)[订阅号]{content}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开

#        # 模拟用户说出【不想订阅大公司不开心】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下minor语料和文件【content.txt】里所有语料组合用户语音不想{minor}{content}，而且回复：【已取消】
            | minor  |
            | 订阅 |
            | 关注 |

        例子:     语料
            | voice_content |
            | 不想订阅大公司不开心|

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除订阅内容-取消/删除订阅号
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开
        假如      用户已删除所有订阅号

        # 只有一个订阅号
        假如      用户已添加订阅内容【汽车简报】
        # 模拟用户说出【删除订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅汽车简报】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 多个订阅号
        假如      用户已添加订阅内容【汽车简报】
        假如      用户已添加订阅内容【大公司不开心】
        # 模拟用户说出【删除订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 你的订阅号有：大公司不开心,汽车简报, 你要删除哪个订阅号呢？|
            | 你的订阅号有：汽车简报,大公司不开心, 你要删除哪个订阅号呢？|

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【大公司不开心】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【大公司不开心】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已取消订阅大公司不开心】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 删除订阅号     |
            | 取消订阅号     |

    @ExtraCase @Subscription
        场景大纲: 订阅号-删除所有订阅号-(删除|取消)(全部|所有)[的]订阅号
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【订阅号】技能已打开
        假如      用户已添加订阅内容【汽车简报】

        # 模拟用户说出【删除所有订阅号】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已为你删除所有的订阅号】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 删除全部订阅号 |
            | 删除所有订阅号 |
            | 取消全部订阅号 |
            | 取消所有订阅号 |
            | 删除全部的订阅号 |
            | 删除所有的订阅号 |
            | 取消全部的订阅号 |
            | 取消所有的订阅号 |
