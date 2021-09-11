# Created by enrico at 2018/7/26
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 事件服务模块测试
    ============================================

# 典型用例

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【超级简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 	每天3分钟，掌握最热资讯	 |
            | 	每日供应最新鲜的财经资讯	 |
            | 	过去的今天发生了什么？	 |
            | 	速览前沿科技	 |
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
            | 打开超级简讯   |

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报-科技简讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【打开科技简讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【速览前沿科技】

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
            | 打开科技简讯   |

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报-商业简讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【打开商业简讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【每日供应最新鲜的财经资讯】

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
            | 打开商业简讯   |

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报-全网热议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【打开全网热议】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【每天3分钟，掌握最热资讯】

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
            | 打开全网热议   |

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报-历史上的今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【打开历史上的今天】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【过去的今天发生了什么】

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
            | 打开历史上的今天   |

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报-超级早报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【打开大公司不开心】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【超级早报，资讯早知道】

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
            | 打开超级早报   |

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报-超级晚报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【打开大公司不开心】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【超级晚报，资讯先知道】

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
            | 打开超级晚报   |

    @TypicalCase @SuperBriefing
        场景大纲: 内容信源-超级简报-娱乐简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【打开大公司不开心】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【即将为你提供热门娱乐简报】

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
            | 打开娱乐简报   |


# 扩展用例
    @ExtraCase @SuperBriefing
        场景大纲: 内容信源-超级简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

        # 模拟用户说出【超级简报】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 	每天3分钟，掌握最热资讯	 |
            | 	每日供应最新鲜的财经资讯	 |
            | 	过去的今天发生了什么？	 |
            | 	速览前沿科技	 |
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
            | 超级简报       |
            | 超级简讯       |
            | 打开超级简报   |
            | 播放超级简讯   |

    @ExtraCase @SuperBriefing
        场景大纲: 内容信源-超级简报-科技简讯/商业简报/全网热议/历史上的今天/超级早报/超级晚报/娱乐简报
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【超级简报】技能已打开

#        # 模拟用户说出【打开科技简讯】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【速览前沿科技】
#
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

        # 模拟用户说出【打开科技简讯】的识别过程
        当       iFlyOS客户端从以下turn_on语料和文件【content.txt】里所有语料组合用户语音{turn_on}{content}，而且回复对应内容
            | turn_on  |
            | 打开      |
            | 播放      |
            | 听        |
            | 看        |

        # 模拟用户说出【打开科技简讯可以吗】的识别过程
        当       iFlyOS客户端从以下turn_on语料和文件【content.txt和yq.txt】里所有语料组合用户语音{turn_on}{content}{yq}，而且回复对应内容
            | turn_on  |
            | 打开      |
            | 播放      |
            | 听        |
            | 看        |

        例子:     语料
            | voice_content |
            | 科技简讯       |
