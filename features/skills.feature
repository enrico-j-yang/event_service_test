# Created by enrico at 2018/4/30
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 事件服务模块测试
    ============================================

# 典型用例
    @TypicalCase  @Datetime
    场景大纲: 时间查询-查询时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 现在几点       | :            | BodyTemplate3 | 时间  | :            |

    @TypicalCase  @Datetime
    场景大纲: 时间查询-查询日期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【今天几号】
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
            | 今天几号       | -            | BodyTemplate3 | 时间   | 年          | 今天             |

    @TypicalCase  @Datetime
    场景大纲: 时间查询-查询星期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【今天星期几】
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
            | 今天星期几     | 星期         | BodyTemplate3 | 时间  | 星期        |       今天      |

    @TypicalCase  @Datetime
    场景大纲: 时间查询-查询某地点时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【美国几点了】
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
            | 美国几点了     | :            | BodyTemplate3 | 时间  | :            | 美国            |

    @TypicalCase  @Datetime
    场景大纲: 时间查询-查询农历
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【今天农历多少】
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
            | 今天农历多少   | 月           | BodyTemplate3 | 时间  | 农历       | -                |

    @TypicalCase  @Datetime
    场景大纲: 时间查询-查询节日时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【国庆节是哪天】
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
            | 国庆节是哪天   | -            | BodyTemplate3 | 时间  | 年           | 国庆节          |

    @TypicalCase  @Datetime
    场景大纲: 时间查询-查询距离某个节点还有多少时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【距离国庆还有多久】
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
            | voice_content | tts_content | template_type | title | text_field  | sub_text_field |
            | 距离国庆还有多久| 还有        | BodyTemplate3 | 时间  | 还有         | 距离国庆        |

    @TypicalCase  @TrafficRestriction
    场景大纲: 限行查询-查询某地某日限行
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @TrafficRestriction
    场景大纲: 限行查询-查询某车牌号是否限行
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【限行查询】技能已打开

        # 模拟用户说出【粤A64E09今天限行吗】
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
            | 粤A64E09今天限行吗  | 限行          |

    @TypicalCase  @News
    场景大纲: 新闻-随机播放新闻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【新闻】技能已打开

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 虽然我不是很厉害，但忍不住心系天下呢 |
            | 不知道听什么的时候我也爱听新闻       |
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

        例子:     语料
            | voice_content |
            | 来点新闻          |

    @TypicalCase  @News
    场景大纲: 新闻-特定新闻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【新闻】技能已打开

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content          |
            | 一起来听听体育新闻吧 |
            | 嗯[=en4]，我们了解下体育新闻吧|
            | 体育新闻来了          |
            | 你真的很喜欢听体育新闻呢[=ne4]|
            | 这些体育新闻你肯定感兴趣，对吗|

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

        例子:     语料
            | voice_content |
            | 我想听体育新闻    |

    @TypicalCase  @Calculator
    场景大纲: 计算器-计算器
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 1+1等于多少    | 等于2        | BodyTemplate3 | 计算  | 2           | 1+1          |

    @TypicalCase  @Holiday @disable
    场景大纲: 节假日查询-根据节假日名称查询放假时间-不放假
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【儿童节放假安排】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content          |
            | 不放假哦，好好学习才是好孩子       |
            | 别老想着放假呦，工作使人快乐       |
            | 即使是儿童节，也还是不能停下脚步歇息的哦 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 儿童节放假安排       |

    @TypicalCase  @Holiday @https://task.iflyos.cn/T2427
    场景大纲: 节假日查询-查询某一天是否休假-周末放假
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年4月14号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和以下内容之一
            | tts_content |
            | 是休息日        |
            | 是周末哦，好好享受吧  |
            | 是周末，好好休息一下吧 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content       | date       |
            | 2018年4月14号上班吗 | 2018年4月14 |

    @TypicalCase  @Holiday @https://task.iflyos.cn/T2427
    场景大纲: 节假日查询-查询某一天是否休假-法定节假日放假
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年10月1号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content       | date          | answer |
            | 2018年10月1号上班吗 | 2018年10月1号 | 假期     |

    @TypicalCase  @Holiday @https://task.iflyos.cn/T2427
    场景大纲: 节假日查询-查询某一天是否休假-调休上班
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年2月11号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和以下内容之一
            | tts_content  |
            | 调休上班      |
            | 需要上班      |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content       | date          |
            | 2018年2月11号上班吗 | 2018年2月11   |

    @TypicalCase  @Holiday @https://task.iflyos.cn/T2427
    场景大纲: 节假日查询-查询某一天是否休假-周工作日
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年1月2号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和以下内容之一
            | tts_content      |
            | 是工作日             |
            | 当然要上班啊           |
            | 要上班，好好上班周末才能好好玩哦 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content       | date         |
            | 2018年1月2号上班吗  | 2018年1月2   |

    @TypicalCase  @Holiday
    场景大纲: 节假日查询-查询下一个假期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【什么时候放假】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 最近的节假日是     |
            | 下一次放假是      |
            | 今年已经没有国家法定节假日可以放 |
            | 今年7个法定假期都已经结束了，期待明年假期的到来吧 |
            | 今年没有假期了呢，静候明年假期的安排出来      |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 什么时候放假   |

    @TypicalCase  @WordsMeaning
    场景大纲: 词语解释-词语解释
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content             | answer               | template_type | main_title  | sub_title                 | text_field |
            | 怎么解释词语风马牛不相及  | 比喻事物彼此毫不相干 | BodyTemplate1 | 风马牛不相及 | fēng mǎ niú bù xiāng jí | 比喻事物彼此毫不相干 |

    @TypicalCase  @WordsMeaning
    场景大纲: 词语解释-解释词语
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【词语解释】技能已打开

        # 模拟用户说出【魑魅魍魉是啥意思】
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
            | voice_content | answer   |template_type | main_title  | sub_title | text_field |
            | 魑魅魍魉是啥意思      | 指各种各样的坏人 |BodyTemplate1 | 魑魅魍魉     | chī mèi wǎng liǎng   | 指各种各样的坏人     |

    @TypicalCase  @Idiom
    场景大纲: 成语查询-查询成语解释
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content     | answer                    | template_type  | main_title  | text_field |
            | 查下成语马到成功   | 形容工作刚开始就取得成功 | BodyTemplate1  | 马到成功     | 形容工作刚开始就取得成功 |

    @TypicalCase  @Idiom
    场景大纲: 成语查询-查询成语出处
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语查询】技能已打开

        # 模拟用户说出【马到成功的出处】的识别过程
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
            | voice_content | answer                                                      | template_type  | main_title  | sub_title | text_field |
            | 马到成功的出处 | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 | BodyTemplate1  | 马到成功     | 成语出处   | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询某一天天气/温度-不指定地点和日期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【天气怎么样】
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
            | 今天广州天气        | 广州          | 今天           |
            | 天气怎么样         | 广州          | 今天           |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询某一天天气/温度-日期在未来一周内
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天北京天气怎么样】
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
            | 热       |
            | 冷       |
            | ℃       |
            | 热       |
            | 冷       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 |
            | 今天北京天气怎么样     | 北京          | 今天           |
            | 深圳明天天气怎么样     | 深圳          | 明天           |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询某一天下雨吗-不指定地点和日期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【下雨吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】和【<tts_content3>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 | tts_content3 |
            | 北京今天下雨吗       | 北京          | 今天           | 雨            |
            | 下雨吗           | 北京          | 今天           | 雨            |
            | 可以洗车吗         | 北京          | 今天           | 洗车           |
            | 需要带伞吗         | 北京          | 今天           | 伞            |
            | 能穿白鞋吗         | 北京          | 今天           | 穿            |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询某一天下雨吗-日期在未来一周内
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【广州今天下雨吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】和【<tts_content3>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 | tts_content3 |
            | 广州今天下雨吗       | 广州          | 今天           | 雨            |
            | 广州今天可以洗车吗     | 广州          | 今天           | 洗车           |
            | 深圳今天需要带伞吗     | 深圳          | 今天           | 伞            |
            | 北京今天能穿白鞋吗     | 今天          | 北京           | 穿            |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询空气质量-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【空气怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 优         |
            | 良         |
            | 轻度污染   |
            | 中度污染   |
            | 重度污染   |
            | 严重污染   |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 空气质量优         |
            | 空气质量良         |
            | 空气质量轻度污染   |
            | 空气质量中度污染   |
            | 空气质量重度污染   |
            | 空气质量严重污染   |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的空气质量  |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询空气质量-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【广州周六空气质量】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content         |
            | 空气质量需要实时获取，还不支持周六空气质量的查询|

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 广州周六空气质量 |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询穿衣指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的穿衣指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 春秋装            |
            | 早春晚秋装        |
            | 夏装              |
            | 盛夏装            |
            | 初冬装            |
            | 冬装              |
            | 严冬装            |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 今天的穿衣指数  | 服装         |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询穿衣指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的穿衣指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content       |
            | 我只知道今天穿什么衣服       |
            | 需要穿什么衣服需要当天才能知道   |
            | 你可以参考这个温度来决定穿什么衣服 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的穿衣指数  |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询防晒指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的防晒指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 弱                |
            | 较弱              |
            | 中等              |
            | 强                |
            | 极强              |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 紫外线         |
            | 紫外辐射        |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的防晒指数  |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询防晒指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的防晒指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 明天的防晒指数要明天才知道哦 |
            | 我只知道今天         |
            | 防晒指数我只有今天的哦    |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的防晒指数  |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询逛街指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【适合逛街吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜                |
            | 较适宜              |
            | 较不宜              |
            | 不适宜              |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 今天的逛街指数  | 逛街         |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询逛街指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【合肥明天可以逛街吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 明天的逛街指数要明天才知道哦 |
            | 我只知道今天适不适合逛街   |
            | 我只知道今天的逛街指数    |
            | 逛街指数我只有今天的哦    |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 合肥明天可以逛街吗     |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询空气湿度-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天空气湿度】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 现在相对湿度 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天空气湿度    |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询空气湿度-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天空气湿度】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 湿度信息需要实时测量计算，明天的湿度等明天再来问我吧 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天空气湿度    |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询pm2.5-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天pm2.5】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | pm2.5指数    |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天pm2.5      |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询pm2.5-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天pm2.5】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 空气质量需要实时获取，还不支持明天空气质量的查询 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天pm2.5      |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询晨练指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天晨练指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜                |
            | 较适宜              |
            | 较不宜              |
            | 不宜                |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 晨练         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天晨练指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询晨练指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天晨练指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 晨练指数我只有今天的哦         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天晨练指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询舒适度指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的舒适度指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 舒适                |
            | 较舒适              |
            | 不舒适              |
            | 非常不舒适          |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 舒适         |
            | 接受         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的舒适度指数 |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询舒适度指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的舒适度指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 舒适指数我只有今天的哦  |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的舒适度指数 |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询钓鱼指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的钓鱼指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜              |
            | 较适宜            |
            | 不宜              |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 垂钓         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的钓鱼指数  |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询钓鱼指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的钓鱼指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 钓鱼指数我只有今天的哦 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的钓鱼指数  |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询感冒指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的感冒指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 少发              |
            | 较易发            |
            | 易发              |
            | 极易发            |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 感冒         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的感冒指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询感冒指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的感冒指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 感冒指数我只有今天的哦 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的感冒指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询旅游指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的旅游指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜              |
            | 较适宜            |
            | 不太适宜          |
            | 不适宜            |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 旅游         |
            | 出游         |
            | 出行         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的旅游指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询旅游指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的旅游指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 旅行指数我只有今天的哦 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的旅游指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询紫外线强度指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的紫外线强度指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather|
            | 最弱             |
            | 弱               |
            | 中等             |
            | 强               |
            | 很强             |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 紫外线       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的紫外线强度指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询紫外线强度指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的紫外线强度指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 紫外线指数我只有今天的哦 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的紫外线强度指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询洗车指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的洗车指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather|
            | 适宜             |
            | 较适宜           |
            | 较不宜           |
            | 不宜             |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 洗车         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的洗车指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询洗车指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的洗车指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 洗车         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的洗车指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询运动指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的运动指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather|
            | 适宜             |
            | 较适宜           |
            | 较不宜           |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 运动         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的运动指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询运动指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【明天的运动指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 运动指数我只有今天的哦 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 明天的运动指数   |

    @TypicalCase  @Weather
    场景大纲: 天气查询-查询时间段天气
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【周末广州天气怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content         | tts_content  | tts_content2 |
            | 周末广州天气怎么样     | 广州周六      | 周日        |

    @TypicalCase  @Stock
    场景大纲: 股票查询-查看大盘投资建议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【今天有哪些股票可以买】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content               |
            | 今天没有股票出现买入机会，请明天开盘后再来试试   |
            | 股票出现买入机会，请打开小飞在线APP查看股票名单 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content        | template_type | title    | text_field      | sub_text_field |
            | 今天有哪些股票可以买 | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票名称查询股票概况
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【雷科防务的股票】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 当前操作建议为空仓   |
            | 当前操作建议为减仓   |
            | 当前操作建议为持仓，需要我们提供最近的买入价吗？ |
            | 当前操作建议为买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content  | stock             | answered  | template_type | title  | text_field | sub_text_field |
            | 雷科防务的股票  | 雷科防务当前股价 | 需要       | BodyTemplate3 | 查股票  | 元         | 雷科防务        |
            | 中兴通讯的股票  | 中兴通讯当前股价 | 不需要     | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票名称查询实时股价
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【查询科大讯飞的股价】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一
            | tts_content |
            | 今日涨幅        |
            | 今日跌幅        |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | stock            | template_type | title | text_field | sub_text_field |
            | 查询股价科大讯飞 | 科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元        | 科大讯飞        |

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票名称查询投资风险
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【科大讯飞有什么投资风险】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content          | stock                         | template_type | title   | text_field | sub_text_field |
            | 科大讯飞有什么投资风险 | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票名称查询投资建议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【科大讯飞有什么投资建议】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 空仓   |
            | 减仓   |
            | 持仓，需要我们提供最近的买入价吗？ |
            | 买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content            | stock                | answered  |
            | 科大讯飞有什么投资建议     | 科大讯飞的建议操作为 | 需要       |
            | 建议买入中兴通讯的股票吗？ | 中兴通讯的建议操作为 | 不需要     |

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票代码查询股票概况
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【股票查询002271】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 当前操作建议为空仓   |
            | 当前操作建议为减仓   |
            | 当前操作建议为持仓，需要我们提供最近的买入价吗？ |
            | 当前操作建议为买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content     | stock                   | answered | template_type | title  | text_field | sub_text_field |
            | 股票查询002271    | 002271东方雨虹当前股价 | 好        | BodyTemplate3 | 查股票  | 元         | 002271          |
            | 查询002413的股票  | 002413雷科防务当前股价 | 不用了    | BodyTemplate3 | 查股票  | 元         | 002413          |

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票代码查询实时股价
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【查询002230的股价】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一
            | tts_content |
            | 今日涨幅        |
            | 今日跌幅        |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content    | stock                   | template_type | title  | text_field | sub_text_field |
            | 002230的股票价格 | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票代码查询投资风险
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【002230有什么投资风险】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content              | stock                                | template_type | title   | text_field | sub_text_field |
            | 002230的股票有什么投资风险 | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |

    @TypicalCase  @Stock
    场景大纲: 股票查询-根据股票代码查询投资建议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【002410的股票现在值得买吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 空仓   |
            | 减仓   |
            | 持仓，需要我们提供最近的买入价吗？ |
            | 买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content           | stock                     | answered |
            | 002410的股票现在值得买吗 | 002410广联达的建议操作为   | 好的      |
            | 000065值得买吗？         | 000065北方国际的建议操作为 | 算了      |

    @TypicalCase  @Translation
    场景大纲: 翻译-中文翻译成英文
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content     | translation                    | template_type | title   | text_field | sub_text_field |
            | 帮我翻译所见即所得 | What you see is what you get | BodyTemplate3 | 中英翻译| What you see is what you get | 所见即所得  |

    @TypicalCase  @Chatting
    场景大纲: 闲聊技能
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【闲聊】技能已打开

        # 模拟用户说出【对你彻底无语了】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 对你彻底无语了       |

    @TypicalCase  @Poetry @https://task.iflyos.cn/T428
    场景大纲: 古诗词-搜索古诗词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content     | answer                    |  template_type  | main_title  | sub_title | text_field |
            | 来一首李白的静夜思 | 床前明月光，疑是地上霜。 |  BodyTemplate1  | 静夜思       | 李白       | 床前明月光，疑是地上霜。举头望明月，低头思故乡。 |

    @TypicalCase  @Poetry
    场景大纲: 古诗词-查询某一首诗歌
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【静夜思】
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
            | voice_content | answer                    |  template_type  | main_title  | sub_title | text_field |
            | 静夜思         | 床前明月光，疑是地上霜。 |  BodyTemplate1  | 静夜思       | 李白       | 床前明月光，疑是地上霜。举头望明月，低头思故乡。 |

    @TypicalCase  @Poetry
    场景大纲: 古诗词-查询某位诗人有哪些作品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【李白有什么代表作】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为【<sub_title>】，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content   | template_type  | main_title  | sub_title |
            | 李白有什么代表作 | BodyTemplate1  | 李白         | 唐代         |

    @TypicalCase  @Poetry
    场景大纲: 古诗词-查询古诗词的作者
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【庄生晓梦迷蝴蝶是谁写的】
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
            | voice_content        | answer  | template_type | title  | text_field | sub_text_field |
            | 庄生晓梦迷蝴蝶是谁写的 | 李商隐  | BodyTemplate3 | 古诗词  | 李商隐      | 庄生晓梦迷蝴蝶   |

    @TypicalCase  @Poetry
    场景大纲: 古诗词-查询上/下一句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【床前明月光的下一句是什么】
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
            | voice_content            | answer     | template_type | title   | text_field | sub_text_field |
            | 床前明月光的下一句是什么 | 疑是地上霜   | BodyTemplate3 | 古诗词   | 疑是地上霜  | 床前明月光       |

    @TypicalCase  @Food
    场景大纲: 食物热量-营养成分
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【食材百科】技能已打开

        # 模拟用户说出【200克苹果的热量】
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
            | voice_content            | answer                 | template_type  | main_title  | sub_title  | text_field |
            | 薯片的营养成分包括多少   | 100克的薯片中包含热量 | BodyTemplate1  | 薯片          | 营养成分   | 100克的薯片中包含热量  |

    @TypicalCase  @Food
    场景大纲: 食物热量-食物的热量、蛋白质、脂肪、碳水化合物
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    | answer          | template_type | title    | text_field | sub_text_field |
            | 200克苹果的热量   | 106千卡的热量  | BodyTemplate3 | 食物热量  | 热量        | 200克苹果      |
            | 薯片有多少卡路里  | 480千卡的热量  | BodyTemplate3 | 食物热量  | 热量        | 100克薯片       |

    @TypicalCase  @HomoionymAntonym
    场景大纲: 近反义词-搜索近反义词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | template_type  | main_title  | sub_title | text_field |
            | 开心的近义词   | BodyTemplate1  | 开心         | 近义词     | 、         |
            | 开心的反义词   | BodyTemplate1  | 开心         | 反义词     | 、         |

    @TypicalCase  @meishichina
    场景: 美食天下菜谱-打开美食天下菜谱
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @meishichina
    场景大纲: 美食天下菜谱-具体菜式的菜谱
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【可乐鸡翅怎么做】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 可乐鸡翅怎么做       | 可乐鸡翅        |

    @TypicalCase  @meishichina
    场景大纲: 美食天下菜谱-模糊菜式的菜谱
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【教我做川菜】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 教我做川菜         | 鱼香肉丝        |

    @TypicalCase  @meishichina
    场景: 美食天下菜谱-菜谱步骤
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【美食天下菜谱】技能已打开

        # 模拟用户说出【打开美食天下菜谱】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开美食天下】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【欢迎使用美食天下】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【可乐鸡翅怎么做】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【可乐鸡翅怎么做】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【可乐鸡翅】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【下一步】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一步】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【鸡翅洗净，加入适量料酒】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【下一步】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一步】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【葱姜切片】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【再说一遍】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【再说一遍】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【葱姜切片】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【上一步】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【上一步】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【鸡翅洗净，加入适量料酒】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @IdiomGame
    场景大纲: 成语接龙-打开成语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content |
            | 请先给我一个成语吧，比如：|
            | 那请先跟我说一个成语哦，比如：|
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开成语接龙   |

    @TypicalCase  @IdiomGame
    场景大纲: 成语接龙-游戏中
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开
        假如      iFlyOS客户端已经打开成语接龙

        # 模拟用户说出【一丝不苟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【该我啦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 一丝不苟          |

    @TypicalCase  @IdiomGame
    场景大纲: 成语接龙-重新开始一局
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开
        假如      iFlyOS客户端已经打开成语接龙

        # 模拟用户说出【重新来】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【欢迎你再次来玩成语接龙，你可以先说一个成语，我来接】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 再来一局       |

    @TypicalCase  @IdiomGame
    场景大纲: 成语接龙-关闭成语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开
        假如      iFlyOS客户端已经打开成语接龙

        # 模拟用户说出【不玩了】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【期待您下次再来玩成语接龙】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 退出            |

    @TypicalCase  @WordGame @disable
    场景大纲: 词语接龙-打开词语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【词语接龙】技能已打开

        # 模拟用户说出【打开词语接龙】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【词语接龙】
        #那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
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

    @TypicalCase  @VoiceNote  @disable
    场景大纲: 语记-完整完成语记
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【语记】技能已打开

        # 模拟用户说出【打开语记】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<enter_voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已打开语记，你可以对我说“开始记录”和“停止记录”】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【打开语记开始录音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<start_voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】【ExpectSpeech】

        # 模拟用户说出需要记录的内容的识别过程，包含【停止录音】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | enter_voice_content | start_voice_content | voice_content                                                                                                         |
            | 打开语记                | 打开语记开始录音            | 4月10日，博鳌亚洲论坛2018年年会在山青海碧、日暖风轻的海南开幕，习近平主席出席开幕式并发表主旨演讲。他强调顺应时代潮流，坚持开放共赢，宣布中国扩大开放新的重大举措。央视网特提炼出演讲重点，各方就主旨演讲的解读，以飨读者。停止录音 |

    @TypicalCase  @Dictionary  @disable
    场景大纲: 汉语词典-查询词语
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【汉语词典】技能已打开

        # 模拟用户说出【打开汉语词典】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开汉语词典】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【汉语词典】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【一马当先是什么意思】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【退出】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 一马当先是什么意思     |

    @TypicalCase  @DairyEnglish  @disable
    场景大纲: 每日英语-查询词语
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【每日英语】技能已打开

        # 模拟用户说出【打开每日英语】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开每日英语】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【英文】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【打开每日英语】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【每日英语已结束】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 打开每日英语        |

    @TypicalCase  @Encyclopedia
    场景大纲: 百科问答-查询问题
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【百科问答】技能已打开

        # 模拟用户说出【恐龙为什么会灭绝】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | template_type  | main_title  |
            | 恐龙为什么会灭绝| BodyTemplate1  | 恐龙为什么会灭绝|

    @TypicalCase  @BodyExercise  @disable
    场景: 广播操
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广播操】技能已打开

        # 模拟用户说出【广播体操】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开广播操】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【慢的】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【慢的】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【慢的】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【退出】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @Bible  @disable
    场景大纲: 圣经
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【圣经】技能已打开

        # 模拟用户说出【打开每日英语】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开圣经】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【圣经】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【播放圣经】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【播放圣经】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【创世纪】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【第一章】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<chapter>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【感谢使用】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | chapter |
            | 创世纪           | 第一章     |

    @TypicalCase  @FiveMinuteExercise  @disable
    场景: 五分钟锻炼
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【五分钟锻炼】技能已打开

        # 模拟用户说出【五分钟锻炼】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开五分钟锻炼】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【平板支撑】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【平板支撑】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【轻量级】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【轻量级】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功


        # 模拟用户说出【退出】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @CoinTossing  @disable
    场景: 抛硬币
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【抛硬币】技能已打开

        # 模拟用户说出【我要抛硬币】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要抛硬币】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【一枚亮晶晶的硬币准备好了】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【抛硬币】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【抛】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【面】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【再抛一次】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【再抛一次】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【面】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【记得再来】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @Alerts
    场景大纲: 设置闹钟/提醒-设置闹钟成功-没有content什么都不显示
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午八点提醒我】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】为None
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好<tts_content>的闹钟         |
            | 好的，交给我吧，我会在<tts_content>提醒你     |
            | 已帮你定好<tts_content>的闹钟，我会准时提醒你 |
            | 没问题，已帮你把闹钟设置到<tts_content>       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【<scheduled_time>】

        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content             | tts_content          | scheduled_time | template_type | title | text_field |  sub_text_field |
            | 明天上午八点提醒我        | 明天上午八点           | 00:00:00       | BodyTemplate3 | 闹钟  | 08:00      | None            |
            | 设置每月25号晚上8点的闹钟 | 每月25日晚上8点       | 12:00:00       | BodyTemplate3 | 闹钟  | 20:00      | None            |
            | 设置每年4月1号22点整的提醒| 每年4月01日晚上10点   | 14:00:00       | BodyTemplate3 | 闹钟  | 22:00      | None            |
            | 设置每天上午九点十分的闹钟| 每天上午9点10分       | 01:10:00        | BodyTemplate3 | 闹钟  | 09:10      | None            |
            | 设置工作日上午10:15的提醒 | 每个工作日上午10点15分| 02:15:00       | BodyTemplate3 | 闹钟  | 10:15      | None            |
            | 订一个节假日上午11点一刻的闹钟|法定节假日中午11点15分| 03:15:00    | BodyTemplate3 | 闹钟  | 11:15      | None            |
            | 定一个明天凌晨6点的闹钟   | 明天凌晨6点            | 22:00:00       | BodyTemplate3 | 闹钟  | 06:00      | None            |
            | 定一个周末下午1点半的提醒 | 周末下午1点半          | 05:30:00       | BodyTemplate3 | 闹钟  | 13:30      | None            |
            | 帮我设置一个每周五下午2:45的闹钟| 每周五下午2点45分| 06:45:00        | BodyTemplate3 | 闹钟  | 14:40     | None            |
            | 帮我设置一个周一到周五下午3:50的提醒| 每周一到周五下午3点50分| 07:50:00| BodyTemplate3 | 闹钟  | 15:50   | None            |

    @TypicalCase  @Alerts
    场景大纲: 设置闹钟/提醒-设置闹钟成功-显示content
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午八点叫我起床】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好<tts_content><content>的闹钟         |
            | 好的，交给我吧，我会在<tts_content>提醒你<content>     |
            | 好的，我会在<tts_content>提醒你<content>                |
            | 已帮你定好<tts_content>的闹钟，我会准时提醒你<content> |
            | 没问题，已帮你把<content>闹钟设置到<tts_content>       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【<scheduled_time>】

        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content                  | tts_content          | content | scheduled_time| template_type | title | text_field |  sub_text_field |
            | 提醒我明天下午三点开会         | 明天下午三点          | 开会     | 07:00:00       | BodyTemplate3 | 闹钟  | 15:00      | 开会             |
            | 明天上午八点提醒我去看电影     | 明天上午八点          | 去看电影 | 00:00:00       | BodyTemplate3 | 闹钟  | 08:00      | 看电影           |
            | 每天上午九点十分叫我去看电影   | 每天上午9点10分       | 去看电影 | 01:10:00      | BodyTemplate3 | 闹钟  | 09:10      | 看电影            |
            | 工作日上午10:15我要回公司      | 每个工作日上午10点15分| 回公司   | 02:15:00      | BodyTemplate3 | 闹钟  | 10:15      | 回公司            |
            | 节假日上午11点一刻叫我去看电影 | 法定节假日中午11点15分| 去看电影 | 03:15:00      | BodyTemplate3 | 闹钟  | 11:15      | 看电影            |
            | 设置周末下午1点半起床的闹钟    | 周末下午1点半          | 起床     | 05:30:00      | BodyTemplate3 | 闹钟  | 13:30      | 起床             |
            | 设置每周五下午2:45睡觉的提醒   | 每周五下午2点45分     | 睡觉     | 06:45:00      | BodyTemplate3 | 闹钟  | 14:40      | 睡觉              |
            | 设置每月25号晚上8点休息的闹钟  | 每月25日晚上8点       | 休息     | 12:00:00       | BodyTemplate3 | 闹钟  | 20:00      | 休息            |
            | 设置每年4月1号22点整睡觉的提醒 | 每年4月01日晚上10点   | 睡觉     | 14:00:00       | BodyTemplate3 | 闹钟  | 22:00      | 睡觉            |
            | 订一个周一至周五下午3:50游玩的闹钟| 每周一到周五下午3点50分 | 游玩 | 07:50:00      | BodyTemplate3 | 闹钟  | 15:50      | 游玩              |
            | 定一个周六周日下午三点游玩的闹钟| 周六周日下午3点        | 游玩 | 05:00:00      | BodyTemplate3 | 闹钟  | 15:00      | 游玩              |

    @TypicalCase  @Alerts
    场景大纲: 设置闹钟/提醒-用户表述不清楚，追问时间，设置闹钟成功
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【提醒我吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【中午十二点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<time>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好<tts_content><content>的闹钟         |
            | 好的，交给我吧，我会在<tts_content>提醒你<content>     |
            | 已帮你定好<tts_content>的闹钟，我会准时提醒你<content> |
            | 没问题，已帮你把<content>闹钟设置到<tts_content>       |
            | 好的，我会在<tts_content>提醒你<content>                |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【<scheduled_time>】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | asked                       | time          | scheduled_time | tts_content  | content |
            | 提醒我吃饭     | 好的，你希望在几点收到提醒 | 明天中午十二点| 04:00:00        | 明天中午12点 | 吃饭    |
            | 帮我设置一个闹钟| 好的，你希望把闹钟定在几点| 明天下午2点   | 06:00:00        | 明天下午2点  |  |
            | 帮我设置一个去看电影的闹钟| 好的，你希望把闹钟定在几点| 明天上午8点 | 00:00:00 | 明天上午8点  | 看电影 |

    @TypicalCase  @Alerts
    场景: 设置闹钟/提醒-闹钟时间到响铃
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午十点提醒我回家吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【明天上午十点提醒我回家吃饭】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好明天上午十点回家吃饭的闹钟         |
            | 好的，交给我吧，我会在明天上午十点提醒你回家吃饭     |
            | 已帮你定好明天上午十点的闹钟，我会准时提醒你回家吃饭 |
            | 没问题，已帮你把回家吃饭闹钟设置到明天上午十点       |
            | 好的，我会在明天上午十点提醒你回家吃饭                |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【02:00】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端下行通道回复的directive为【TemplateRuntime】，【RenderTemplate】
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @Alerts
    场景大纲: 设置闹钟/提醒-闹钟响铃时停止闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午十点提醒我回家吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【明天上午十点提醒我回家吃饭】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好明天上午十点回家吃饭的闹钟         |
            | 好的，交给我吧，我会在明天上午十点提醒你回家吃饭     |
            | 已帮你定好明天上午十点的闹钟，我会准时提醒你回家吃饭 |
            | 没问题，已帮你把回家吃饭闹钟设置到明天上午十点       |
            | 好的，我会在明天上午十点提醒你回家吃饭                |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【02:00】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredBackground】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

#        那么      iFlyOS服务端下行通道回复的directive为【TemplateRuntime】，【RenderTemplate】
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
        当        iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 停止闹钟       |

    @TypicalCase  @Alerts
    场景大纲: 设置闹钟/提醒-查询闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【我有几个闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【ListTemplate1】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content|
            |  你有1个闹钟，是今天晚上9点       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我有几个闹钟    |

    @TypicalCase  @Alerts @disable
    场景大纲: 设置闹钟/提醒-删除单次闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【删除晚上九点钟的闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content     |
            | 删除闹钟功能还在学习中，暂时请到手机APP上进行闹钟删除操作吧  |
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
            | 删除吃饭的闹钟    |

    @TypicalCase  @Alerts @disable
    场景大纲: 设置闹钟/提醒-删除循环闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【每天晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【删除晚上九点钟的闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content     |
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
            | 删除每天晚上九点钟的闹钟    |

    @TypicalCase  @Alerts
    场景大纲: 设置闹钟/提醒-清空闹钟列表
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 删除所有闹钟   |

    @TypicalCase  @Timers
    场景大纲: 计时器-设置倒计时
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | answer | template_type | title | text_field                |  sub_text_field |
            | 一分钟倒计时    | 1分钟  | BodyTemplate3 | 倒计时 | 好的，我会在1分钟后提醒你 | 设置成功          |

    @TypicalCase  @Timers
    场景大纲: 计时器-计时时间不足15秒
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器】技能已打开

        # 模拟用户说出【计时十秒钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | answer         |
            | 计时十秒钟      | 暂时不支持15秒以内的倒计时 |

    @TypicalCase  @Timers  @disable
    场景大纲: 计时器-停止计时
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器】技能已打开

         # 模拟用户说出【计时一分钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【计时一分钟】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【1分钟】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【停止计时】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【Alerts】，【Alert】，参数【scheduledTime】为【？】
        当        iFlyOS客户端发送event【Alerts】，【AlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】Delete
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 停止计时          |

    @TypicalCase  @Timers  @disable
    场景大纲: 计时器-询问计时时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器】技能已打开

         # 模拟用户说出【计时一分钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【计时一分钟】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【一分钟】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【停止计时】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【Alerts】，【Alert】，参数【scheduledTime】为【？】
#        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
#        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】Delete
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 计时多久了         |

    @TypicalCase  @AudioPlayer  @disable
    场景: 音乐点播-播放流式音乐成功，从IDLE状态切换到PLAY状态，从PLAY状态切换到BUFFER_UNDERRUN状态，从BUFFER_UNDERRUN状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器列表不为空
        那么      iFlyOS服务端音乐播放器列表都是【周杰伦】的歌
        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @TypicalCase  @AudioPlayer
    场景: 音乐点播-播放链接音乐成功，从IDLE状态切换到PLAY状态，从PLAY状态切换到BUFFER_UNDERRUN状态，从BUFFER_UNDERRUN状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的稻香】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦，稻香                      |
            | 现在带来的是周杰伦的稻香        |
            | 小飞也很喜欢这首歌，一起唱起来吧  |
            | 来，一起听周杰伦的稻香          |
            | 好的，一起来听周杰伦的稻香      |
            | 一起来听听周杰伦的稻香          |

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

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表都是【周杰伦】的歌
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @TypicalCase  @AudioPlayer
    场景: 音乐点播-播放中被对话打断再恢复，从PLAY状态切换到PAUSED状态，从PAUSED状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【你好】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【你好】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【60000】

    @TypicalCase  @AudioPlayer
    场景: 音乐点播-流式播放上一个歌播放直到结束，下一个开始播放，从PLAY状态切换到FINISHED状态，从FINISHED状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放流式音乐

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【ENQUEUE】，带Binary Audio Attachment

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @TypicalCase  @AudioPlayer
    场景: 音乐点播-链接播放上一个歌播放直到结束，下一个开始播放，从PLAY状态切换到FINISHED状态，从FINISHED状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放链接音乐

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

        当       iFlyOS客户端音乐播放器定位到【120000】
        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【ENQUEUE】

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @TypicalCase  @AudioPlayer
    场景: 音乐点播-获取音乐信息
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复音乐信息
        当        iFlyOS客户端发送event【AudioPlayer】，【StreamMetadataExtracted】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @AudioPlayer  @wip
    场景: 音乐点播-清空播放队列并停止播放，从PLAY状态切换到STOPPED状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【ClearQueue】，参数【clearBehavior】为【CLEAR_ALL】
        # 回复音乐信息
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackQueueCleared】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @AudioPlayer  @wip
    场景: 音乐点播-清空播放队列但不停止当前音乐播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【ClearQueue】，参数【clearBehavior】为【CLEAR_ENQUEUED】
        # 回复音乐信息
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackQueueCleared】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @AudioPlayer
    场景: 音乐点播-链接播放，带progressReportIntervalInMilliseconds
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的稻香】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

#        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦       |
            | 稻香        |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，参数【progressReportIntervalInMilliseconds】为【30000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复播放进度
#        当       用户等待30秒
        当        iFlyOS客户端发送event【AudioPlayer】，【ProgressReportIntervalElapsed】，参数【offsetInMilliseconds】为【30000】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复播放进度
#        当       用户等待30秒
        当        iFlyOS客户端发送event【AudioPlayer】，【ProgressReportIntervalElapsed】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【停止播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @StoryTelling
    场景大纲: 评书点播-随机搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 我要听评书         |

    @TypicalCase  @StoryTelling
    场景大纲: 评书点播-根据表演者搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【评书点播】技能已打开

        # 模拟用户说出【我要听单田芳的评书】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听单田芳的评书     | 单田芳    |

    @TypicalCase  @StoryTelling
    场景大纲: 评书点播-根据评书名称搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【评书点播】技能已打开

        # 模拟用户说出【我要听三国演义】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听三国演义 | 三国演义   |

    @TypicalCase  @StoryTelling
    场景大纲: 评书点播-根据演员名称+评书名称搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【评书点播】技能已打开

        # 模拟用户说出【我要听三国演义】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】和【<answer2>】
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

        例子: 语料
            | voice_content | answer | answer2 |
            | 我要听单田芳的三国演义   | 三国演义   | 单田芳     |

    @TypicalCase  @Drama
    场景大纲: 戏曲点播-根据类别搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【我要听白蛇传】
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

        例子: 语料
            | voice_content |
            | 我要听京剧         |

    @TypicalCase  @Drama
    场景大纲: 戏曲点播-根据戏曲名称+类别搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【我要听京剧白蛇传】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听京剧白蛇传      | 白蛇传    |

    @TypicalCase  @Drama
    场景大纲: 戏曲点播-根据演员名称+类别搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【播放梅兰芳的京剧】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听于魁智的京剧     | 于魁智    |

    @TypicalCase  @Drama
    场景大纲: 戏曲点播-根据戏曲名称+演员名称搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【我要听于魁智的空城计】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        #服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听于魁智的空城计    | 空城计   |

    @TypicalCase  @Sketch_CrossTalk
    场景大纲: 相声小品-随机播放相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 我要听相声         |
            | 播放小品          |

    @TypicalCase  @Sketch_CrossTalk
    场景大纲: 相声小品-根据演员名称搜索相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【相声小品】技能已打开

        # 模拟用户说出【我要听陈佩斯的小品】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听陈佩斯的小品     | 陈佩斯    |

    @TypicalCase  @Sketch_CrossTalk
    场景大纲: 相声小品-根据名称搜索相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【相声小品】技能已打开

        # 模拟用户说出【我要听小品吃面条】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听小品吃面条      | 吃面条    |
            | 播放相声满腹经纶      | 满腹经纶   |

    @TypicalCase  @Sketch_CrossTalk
    场景大纲: 相声小品-根据演员+名称搜索相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【相声小品】技能已打开

        # 模拟用户说出【我要听陈佩斯的主角与配角】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】和【<answer2>】
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

        例子: 语料
            | voice_content | answer | answer2 |
            | 我要听陈佩斯的主角与配角  | 主角与配角  | 陈佩斯     |

    @TypicalCase  @Novel
    场景大纲: 有声小说-随机播放小说
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放小说】
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

        例子: 语料
            | voice_content |
            | 播放小说          |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按书名点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放逆战】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放叶泽坤的逆战第1集】
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

        例子: 语料
            | voice_content |
            | 播放逆战       |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按作者点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放叶泽坤的小说】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放叶泽坤的逆战第1集】
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

        例子: 语料
            | voice_content |
            | 播放叶泽坤的小说 |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按播音员点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放弋凡播的小说】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放弋凡的中国是部金融史（二）第1集】
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

        例子: 语料
            | voice_content |
            | 播放弋凡播的小说 |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按类型/标签点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放武侠小说】
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

        例子: 语料
            | voice_content |
            | 播放武侠小说   |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【第三集】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【播放小说逆战】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放叶泽坤的逆战第1集】
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

        # 模拟用户说出【第五集】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放叶泽坤的逆战第5集】
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

        例子: 语料
            | voice_content |
            | 第五集         |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按书名+集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放逆战第二集】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放叶泽坤的逆战第2集】
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

        例子: 语料
            | voice_content |
            | 播放逆战第二集 |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按书名+上下部点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放平凡的世界上】
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

        例子: 语料
            | voice_content   | tts_content|
            | 播放平凡的世界上 | 为你播放路遥的平凡的世界（上）第1集|

    @TypicalCase  @Novel
    场景大纲: 有声小说-按作者+书名点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放叶泽坤的逆战】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放叶泽坤的逆战第1集】
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

        例子: 语料
            | voice_content |
            | 播放叶泽坤的逆战 |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按播音员+书名点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放姐姐的瘦金笔下乱繁华】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放姐姐的瘦金笔下乱繁华第1集】
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

        例子: 语料
            | voice_content |
            | 播放姐姐的瘦金笔下乱繁华 |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按作者+书名+集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放叶泽坤的逆战第五集】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放叶泽坤的逆战第5集】
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

        例子: 语料
            | voice_content |
            | 播放叶泽坤的逆战第五集 |

    @TypicalCase  @Novel
    场景大纲: 有声小说-按书名+上下部+集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放平凡的世界上第2集】
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

        例子: 语料
            | voice_content         | tts_content|
            | 播放平凡的世界上第2集 | 为你播放路遥的平凡的世界（上）第2集|

    @TypicalCase  @Radio
    场景大纲: 广播电台-随机搜索广播电台
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 我要听广播         |

    @TypicalCase  @Radio
    场景大纲: 广播电台-根据类别搜索广播电台
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广播电台】技能已打开

        # 模拟用户说出【我要听电台】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听经济电台       | 经济     |

    @TypicalCase  @Radio
    场景大纲: 广播电台-根据关键词搜索广播电台
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广播电台】技能已打开

        # 模拟用户说出【我要听电台】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听中央广播电台     | 中央     |

    @TypicalCase  @WhiteNoise
    场景: 白噪音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @EyeExercise
    场景: 眼保健操
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @MeditationMoments
    场景大纲: 冥想时刻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 打开冥想时刻   |

    @TypicalCase  @SleepMusic
    场景: 好好睡觉
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @PrenatalEducationMusic
    场景: 越听越聪明
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @OralComputingChallenge
    场景大纲: 口算挑战
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【口算挑战】技能已打开

        # 模拟用户说出【口算挑战】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【请回答】
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
            | tts_content         |
            | 回答正确             |
            | 正确答案是           |

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
            | 口算挑战       | 10        |

    @TypicalCase  @PoetryChallenge
    场景大纲: 诗词挑战
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content                 |
            | 回答正确                     |
            | 回答错误，上一题的正确答案是|

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 你一题也没有答对 |
            | 全都答对了       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | asked     | answered   |
            | 打开诗词挑战   | 回答诗句  | 但愿人长久 |
            | 打开诗词挑战   | 回答诗人  | 杜甫       |

    @TypicalCase  @MultiplicationTable
    场景大纲: 九九乘法表
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content    |
            | 答对了          |
            | 这道题正确答案是|

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
            | voice_content        |
            | 练习九九乘法表   |

    @TypicalCase  @TalkingLittleParrot
    场景大纲: 会说话的小鹦鹉
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content    |
            | 我变了一个超有型的声音 |
            | 小鹦鹉变身成功         |
            | 小鹦鹉变身             |
            | 小鹦鹉变声成功         |
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
            | tts_content    |
            | 小鹦鹉已经调整了语速 |
            | 小鹦鹉变声成功       |
            | 小鹦鹉变速成功       |
            | 我的语速要变了哦     |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我不想玩了】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 今天玩的很开心，谢谢你啦，碰到有意思的东西，记得再教教我哟 |
            | 今天小鹦鹉真是收获满满，很开心跟你一起玩耍，再见啦       |
            | 小鹦鹉也要回窝休息啦，待会再玩吧                |
            | 时光一去不复回，期待下次再与你相会。              |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content      |
            | 打开会说话的小鹦鹉   |

    @TypicalCase  @ChallengeWords
    场景大纲: 挑战单词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【挑战单词】技能已打开

        # 模拟用户说出【打开挑战单词】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 欢迎来到挑战单词。游戏有四关，难度递增。我给你一个单词，你来猜这个单词的类型。准备好了对我说“开始游戏” |
            | 欢迎回到挑战单词。你可以了解玩法或开始挑战      |

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
            | 正确答案是      |
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
            | voice_content  |
            | 打开挑战单词    |

    @TypicalCase  @MeditationMusic @disable @http://jira.iflyos.vip/browse/IVS-745
    场景大纲: 打开如意冥想音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    |
            | 打开如意冥想音乐  |

    @TypicalCase  @DairyEnglish @https://task.iflyos.cn/T2177
    场景大纲: 英语每日一句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【再来一个】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【再来一个】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】包含【<main_title>】，参数【subTile】包含【<sub_title>】，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content    | template_type  | main_title  | sub_title  |
            | 我要学英语        | BodyTemplate1  | 年          | 英语每日一句   |

    @TypicalCase  @MakeSentence
    场景大纲: 造句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    | template_type | title | text_field | sub_text_field |
            | 用鸦雀无声造句    |  BodyTemplate3 | 造句  | 鸦雀无声     | 鸦雀无声      |

    @TypicalCase  @CapitalInquiry
    场景大纲: 首都查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | tts_content | tts_content2|
            | 中国的首都在哪  | 中国的首都   | 北京          |

    @TypicalCase  @AnimalSound  @disable
    场景大纲: 动物叫声
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【动物叫声】技能已打开

        # 模拟用户说出【学一下猪叫】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【猪是这样叫的】
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
            | voice_content  |
            | 学一下猪叫      |

    @TypicalCase  @ChildModel  @disable
    场景大纲: 儿童模式
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【儿童模式】技能已打开

        # 模拟用户说出【打开儿童模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已进入儿童模式，小朋友我们来聊天吧】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【关闭儿童模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【关闭儿童模式】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已退出儿童模式】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 打开儿童模式    |

    @TypicalCase  @KinderMusic  @disable
    场景: 幼儿音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【幼儿音乐】技能已打开

        # 模拟用户说出【幼儿音乐】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【幼儿音乐】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @Guangchangwu  @disable
    场景: 广场舞时刻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广场舞时刻】技能已打开

        # 模拟用户说出【广场舞时刻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【广场舞时刻】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值设置正常范围11-89，不播放TTS只给值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 把音量设置为11% | 11   |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值小于等于10%，播放TTS提示“好的，当前音量过小，建议在10%以上；”
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为10%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，当前音量过小，建议在10%以上】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点小，建议在10%以上】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | volume |
            | 把音量设置为10%| 10     |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值大于等于90%，播放TTS提示“好的，当前音量过大，我可能会听不清你说话哦“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为90%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【当前音量过大，我可能会听不清你说话哦】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | volume |
            | 把音量设置为90% | 90      |

    @TypicalCase  @VolumeControl @http://jira.iflyos.vip/browse/SKILL-140
    场景大纲: 音量控制-设置音量，音量值等于100%，播放TTS提示“音量已调到最大，我可能会听不清你说话哦“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为100%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【音量已调到最大，我可能会听不清你说话哦】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | volume |
            | 把音量设置为100% | 100   |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值小于5%，将音量设置到5%，即用户设置音量最小值是5%
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为4%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，当前音量过小，建议在10%以上】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点小，建议在10%以上】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content| volume|
            | 把音量设置为4%| 5     |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值大于100%，将音量设置到100%，即用户设置音量最大值是100%
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为200%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【音量已调到最大，我可能会听不清你说话哦】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | volume|
            | 把音量设置为200%| 100    |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-查询音量，音量值设置正常范围11-89，播放TTS提示”现在音量为百分之X“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        假如      iFlyOS客户端音量为【<volume>%】
        # 模拟用户说出【现在音量是多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量是多少】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | volume |
            | 89     |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-查询音量，音量值小于等于10%，播放TTS提示”现在音量为百分之X，声音有点小，建议在10%以上“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        假如      iFlyOS客户端音量为【<volume>%】
        # 模拟用户说出【现在音量是多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量是多少】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点小，建议在10%以上】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | volume |
            | 9      |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-查询音量，音量值大于等于90%，播放TTS提示”现在音量为百分之X，声音有点大，我可能会听不清你说话哦“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        假如      iFlyOS客户端音量为【<volume>%】
        # 模拟用户说出【现在音量是多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量是多少】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | volume |
            | 90     |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-音量相对设置，调节后音量值范围在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【把声音调高30】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  | current_volume | new_volume | tts_content |
            | 把声音调高10    | 50              | 60          | 现在音量为百分之60|
            | 帮我把声音调高20| 50              | 70          | 现在音量为百分之70|

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-音量相对设置，调节后音量值范围不在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【把声音调高30】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<new_volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content1>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | current_volume | new_volume | tts_content | tts_content1 |
            | 把声音调高35    | 60             | 95          | 好的，当前音量过大，我可能会听不清你说话哦| 现在音量为百分之95，声音有点大，我可能会听不清你说话哦|

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-调整音量，调节后音量值范围在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 声音大一点     | 50              | 60          |
            | 声音小一点     | 50              | 40          |

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-调整音量，调节后音量值范围不在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content1>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | current_volume | new_volume | tts_content | tts_content1 |
            | 声音大一点     | 89              | 99          | 好的，当前音量过大，我可能会听不清你说话哦| 现在音量为百分之99，声音有点大，我可能会听不清你说话哦|
            | 声音小一点     | 20              | 10          | 好的，当前音量过小，建议在10%以上   | 现在音量为百分之10，声音有点小，建议在10%以上|

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-设置静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @VolumeControl
    场景大纲: 音量控制-取消静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @PlaybackControl
    场景大纲: 音频播放器-pause//暂停播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @Like
    场景大纲: 音乐点播-音频收藏
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 喜欢这首歌         |

    @TypicalCase  @Like
    场景大纲: 音乐点播-播放收藏的音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 播放我的收藏         |

    @TypicalCase  @PlaybackControl
    场景大纲: 音频播放器-resume//继续播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端在【60000】暂停播放了音乐

        # 模拟用户说出【继续】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，参数【offsetInMilliseconds】为【60000】
        # 回复继续播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器状态为【PLAY】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【60000】

        例子: 语料
            | voice_content |
            | 继续播放          |

    @TypicalCase  @PlaybackControl
    场景大纲: 音频播放器-next//切换到播放列表中的下一个
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【下一首】
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

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】

        例子: 语料
            | voice_content |
            | 下一首           |

    @TypicalCase  @PlaybackControl
    场景大纲: 音频播放器-previous//切换到播放列表中的上一个
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【下一首】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一首】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

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
        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】

        例子: 语料
            | voice_content |
            | 上一首           |

    @TypicalCase  @PlaybackControl  @disable
    场景大纲: 音频播放器-stop//停止播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【停止播放】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为您暂停播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器状态为【STOP】

        例子: 语料
            | voice_content |
            | 停止播放          |

    @TypicalCase  @PlaybackControl
    场景大纲: 音频播放器-查询当前节目
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦|
            | 稻香  |
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

        # 模拟用户说出【这是什么歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | tts_content |
            | 这是什么歌         | 现在播放的是周杰伦的稻香  |

    @TypicalCase  @PlaybackControl
    场景大纲: 音频播放器-查询当前艺人/作者
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦，稻香                     |
            | 现在带来的是周杰伦的稻香        |
            | 也很喜欢这首歌，一起唱起来吧    |
            | 来，一起听周杰伦的稻香          |
            | 好的，一起来听周杰伦的稻香      |
            | 一起来听听周杰伦的稻香          |
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

        # 模拟用户说出【这是谁的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | tts_content  |
            | 这是谁的歌     | 现在播放的是周杰伦的稻香 |

    @TypicalCase  @OilPrice
    场景大纲: 油价查询-油价查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    | tts_content |  template_type | main_title | sub_title | left_text_field | right_text_field |
            | 安徽柴油什么价格  | 安徽省         | ListTemplate1  | 油价查询    | 安徽       | 号               | 元/升              |

    @TypicalCase  @OilPrice
    场景大纲: 油价查询-查询某号石油价格
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【油价查询】技能已打开

        # 模拟用户说出【帮我查下今天的油价】
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
            | voice_content              | tts_content   | template_type | title     | text_field | sub_text_field |
            | 帮我查下今天95号汽油的价格 | 今日95号汽油    | BodyTemplate3 | 油价查询  | 元/升       | 省              |

    @TypicalCase  @WorldCup
    场景大纲: 世界杯-世界杯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @AreaConversion
    场景大纲: 面积换算-面积换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                | tts_content                     | template_type | title     | text_field   | sub_text_field |
            | 1平方米换成平方厘米大约是多少 | [n2]1平方米等于[n2]10000平方厘米 | BodyTemplate3  | 单位换算  | 10000(平方厘米) | 1(平方米)        |

    @TypicalCase  @VolumeConversion
    场景大纲: 体积换算-体积换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    | tts_content              | template_type | title     | text_field | sub_text_field |
            | 1立方米等于多少升| [n2]1立方米等于[n2]1000升 | BodyTemplate3 | 单位换算  | 1000(升)     | 1(立方米)              |

    @TypicalCase  @BinaryConversion
    场景大纲: 进制转换-进制转换
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                | tts_content          | template_type | title    | text_field | sub_text_field |
            | 二进制的1111等于十进制的多少 | 二进制1111等于十进制15 | BodyTemplate3 | 单位换算  | 15(十进制) | 1111(二进制)   |

    @TypicalCase  @PowerConversion
    场景大纲: 功率换算-功率换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content       | tts_content                    | template_type | title     | text_field   | sub_text_field |
            | 一千瓦等于多少焦耳每秒| [n2]1千瓦等于[n2]1000焦耳每秒 | BodyTemplate3 | 单位换算  | 1000(焦耳每秒) | 1(千瓦)              |

    @TypicalCase  @WeightConversion
    场景大纲: 重量换算-重量换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content            | tts_content             | template_type | title    | text_field | sub_text_field |
            | 能告诉我1吨等于多少千克吗 | [n2]1吨等于[n2]1000千克 | BodyTemplate3 | 单位换算  | 1000(千克)   | 1(吨)              |

    @TypicalCase  @UnitConversion
    场景大纲: 单位换算-长度换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content   | tts_content    | template_type | title     | text_field | sub_text_field |
            | 8米等于多少厘米  | 8米等于800厘米 | BodyTemplate3 | 单位换算  | 800(厘米)     | 8(米)              |

    @TypicalCase  @UnitConversion
    场景大纲: 单位换算-温度换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content          | tts_content                  | template_type | title     | text_field | sub_text_field |
            | 20摄氏度等于多少华氏度  | [n2]20摄氏度等于[n2]68华氏度 | BodyTemplate3 | 单位换算  | 68(华氏度)    | 20(摄氏度)        |

    @TypicalCase  @ProvincialCapital
    场景大纲: 省会查询-省会查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

    @TypicalCase  @History
    场景大纲: 历史-历史
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子:     语料
            | voice_content | tts_content |
            | 乾隆皇帝的历史  | 乾隆皇帝        |

    @TypicalCase  @Story
    场景大纲: 故事-故事
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【故事】技能已打开

        # 模拟用户说出【给我讲个故事吧】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content          |
            | 一起来听              |
            | 嗯，我们一起来听      |
            | 好啊，我们一起听听    |
            | 要乖乖睡觉了哦。      |
            | 来了，喜欢的话，记得给|
            | 好的，小飞和你一起听 |
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

        例子:     语料
            | voice_content |
            | 给我讲个故事吧 |

    @TypicalCase  @Abandon
    场景大纲: 用户放弃-用户放弃
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【不用了】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好的          |
            | 那我走了        |
            | 有需要的时候再叫我吧  |
            | 好的，待会见      |
            | 嗯嗯          |
            |             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 不用了           |

    @TypicalCase  @Calendar
    场景大纲: 万年历查询-万年历查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content   | tts_content | tts_content2 | template_type  | main_title    | text_field |
            | 今天不适合做什么 | 农历         | 不适合        |  BodyTemplate1 | 今天不适合做什么 | 不宜          |

    @TypicalCase  @Why
    场景大纲: 十万个为什么-十万个为什么
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【十万个为什么】技能已打开

        # 模拟用户说出【为什么脑子会越用越灵】的识别过程
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
            | voice_content       | tts_content                                                                                                                                                          |  template_type  | main_title           | text_field |
            | 为什么脑子会越用越灵| 有人会担心，用脑过度会有损健康。事实上，这是没有科学根据的。相反的是人的脑子可以越用越灵。勤动脑，大脑就会永葆青春;思想懒惰了，就会反应迟钝，甚至可能成为痴呆 |  BodyTemplate1 | 为什么脑子会越用越灵  | 有人会担心，用脑过度会有损健康。事实上 |

    @TypicalCase  @HotSpot
    场景大纲: 热点-热点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【热点】技能已打开

        # 模拟用户说出【赵日天是谁】的识别过程
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
            | voice_content | tts_content                  |  template_type | main_title  | text_field |
            | 赵日天是谁     | 在下赵日天，狂霸天下之我最牛 |  BodyTemplate1 | 赵日天是谁  | 在下赵日天，狂霸天下之我最牛 |

    @TypicalCase  @Zodiac
    场景大纲: 生肖运势-查询某年的生肖
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content          | tts_content       | template_type | title |
            | 今年出生的是什么生肖    | 的生肖为          | BodyTemplate3 | 生肖   |

    @TypicalCase  @Zodiac
    场景大纲: 生肖运势-查询运势
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【生肖运势】技能已打开

        # 模拟用户说出【属龙的生肖运势怎么样】的识别过程
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
            | voice_content        | tts_content | template_type | main_title | sub_title | text_field |
            | 属龙的生肖运势怎么样 | 生肖龙的运势 | BodyTemplate1 | 龙        | 生肖运势  | 生肖龙的运势|

    @TypicalCase  @Zodiac
    场景大纲: 生肖运势-查询优缺点、事业爱情财富健康
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【生肖运势】技能已打开

        # 模拟用户说出【属龙的生肖运势怎么样】的识别过程
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
            | voice_content                | tts_content                     | template_type | main_title | sub_title | text_field |
            | 属猴的男生可以找属马的女生吗 | 你们是需要相互关照，常历常新的一对 | BodyTemplate1 | 马和猴        | 生肖配对  | 你们是需要相互关照，常历常新的一对|
            | 属龙的优点                   | 生肖龙的优点                       | BodyTemplate1 | 龙        | 优点  | 生肖龙的优点|

    @TypicalCase  @University
    场景大纲: 高校查询-查询高校的地址
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【高校查询】技能已打开

        # 模拟用户说出【北京有哪些大学】的识别过程
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
            | voice_content        | tts_content | template_type | title |
            | 安徽大学在安徽哪个市 | 安徽省合肥市 | BodyTemplate3 | 高校查询|

    @TypicalCase  @University @https://task.iflyos.cn/T2218
    场景大纲: 高校查询-查询某所大学
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【高校查询】技能已打开

        # 模拟用户说出【中央戏剧学院】的识别过程
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
            | voice_content | tts_content| template_type | main_title    | sub_title | text_field |
            | 中央戏剧学院   | 位于北京市 | BodyTemplate1 | 中央戏剧学院  | 高校查询   | 位于北京市  |

    @TypicalCase  @University
    场景大纲: 高校查询-查询某个标签下的高校
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    | tts_content | template_type | main_title      | sub_title | text_field |
            | 有哪些艺术类大学 | 学院         | BodyTemplate1 | 有哪些艺术类大学  | 高校查询   | 学院       |

    @TypicalCase  @University
    场景大纲: 高校查询-查询某个位置的高校
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | tts_content | template_type | main_title      | sub_title | text_field |
            | 北京有哪些大学 | 大学         | BodyTemplate1 | 北京有哪些大学  | 高校查询   | 大学       |

    @TypicalCase  @Constellation
    场景大纲: 星座-查询运势
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    | tts_content     | template_type | main_title | sub_title | text_field |
            | 白羊座今年的运势 | 白羊座的综合运势 | BodyTemplate1 | 白羊座     | 星座运势   | 白羊座的综合运势  |

    @TypicalCase  @Constellation
    场景大纲: 星座-查询男女生特点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【星座】技能已打开

        # 模拟用户说出【白羊座女生的特点】的识别过程
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
            | voice_content  | tts_content     | template_type | main_title | sub_title | text_field |
            | 白羊座女生的特点| 白羊座女生的特点 | BodyTemplate1 | 白羊座女生 | 星座特点   | 白羊座女生的特点  |

    @TypicalCase  @Constellation
    场景大纲: 星座-查询星座的配对情况
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【星座】技能已打开

        # 模拟用户说出【摩羯座与白羊座的最佳配偶】的识别过程
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
            | voice_content         | tts_content| template_type | main_title   | sub_title | text_field |
            | 摩羯座与白羊座的最佳配偶| 摩羯        | BodyTemplate1 | 白羊座和摩羯座 | 星座配对   | 摩羯  |

    @TypicalCase  @CurrencyExchange
    场景大纲: 汇率查询与货币兑换-汇率查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【汇率查询与货币兑换】技能已打开

        # 模拟用户说出【50美元可以兑换多少人民币】的识别过程
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
            | voice_content      | tts_content     | template_type | title  |
            | 美元和人民币的汇率 | 美元和人民币的汇率 | BodyTemplate3 | 查汇率 |

    @TypicalCase  @CurrencyExchange
    场景大纲: 汇率查询与货币兑换-货币兑换
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content           | tts_content    | template_type | title  | text_field | sub_text_field|
            | 50美元可以兑换多少人民币 | 50美元可兑换成   | BodyTemplate3 | 查汇率 | 人民币      | 50美元          |

    @TypicalCase  @CurrencyExchange
    场景大纲: 汇率查询与货币兑换-汇率查询与货币兑换-追问
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【汇率查询与货币兑换】技能已打开

        # 模拟用户说出【50美元可以兑换多少人民币】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 追问说
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【100】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content         | asked                  | template_type | title  |  text_field | sub_text_field| tts_content     |
            | 我要把人民币兑换成美元  | 请说出您持有的货币数量 | BodyTemplate3 | 查汇率  | 美元         | 100            | 100人民币可兑换成 |

    @TypicalCase  @FamilyRelationship
    场景大纲: 家族关系神器-家族关系神器
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content        | tts_content          | template_type | title     | text_field | sub_text_field |
            | 爸爸的爸爸是我的什么 | 爸爸的爸爸是你的爷爷 | BodyTemplate3 | 亲属称谓  | 爷爷        | 爸爸的爸爸是    |
            | 爸爸的爸爸叫我什么   | 爸爸的爸爸           | BodyTemplate3 | 亲属称谓  | 孙子、孙女  | 爸爸的爸爸  |

    @TypicalCase  @HundredFamilyName
    场景大纲: 百家姓-百家姓
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content        | tts_content                      | template_type   | main_title          | text_field |
            | 百家姓你知道有哪些吗 | 赵钱孙李，周吴郑王。冯陈楮卫，蒋沈韩杨 | BodyTemplate1  | 百家姓你知道有哪些吗| 赵钱孙李，周吴郑王。冯陈楮卫，蒋沈韩杨 |

    @TypicalCase  @City
    场景大纲: 国内城市查询-国内城市查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content    | tts_content                                  | template_type  | main_title      | text_field |
            | 安徽省有哪些城市 | 安徽省一共有16座城市，分别是:合肥市、芜湖市 | BodyTemplate1  | 安徽省有哪些城市| 安徽省一共有16座城市 |

    @TypicalCase  @ClassicName
    场景大纲: 经典名句-经典名句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | tts_content | template_type  | main_title | text_field |
            | 丘吉尔的名言   | 丘吉尔       | BodyTemplate1  | 经典名言   | 丘吉尔      |

    @TypicalCase  @36KryptonNews
    场景大纲: 36氪快讯-打开快讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子:     语料
            | voice_content | tts_content         |
            | 打开36氪快讯   | 为你播放36氪快讯，以下是最新科技新闻 |

    @TypicalCase  @36KryptonNews
    场景大纲: 36氪快讯-暂停/恢复快讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【36氪快讯】技能已打开

        # 模拟用户说出【36氪快讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
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

        # 模拟用户说出【暂停】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【暂停】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【继续播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【继续播放】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 服务端下发意图
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content         |
            | 36氪快讯         | 为你播放36氪快讯，以下是最新科技新闻 |

    @TypicalCase  @36KryptonNews
    场景大纲: 36氪快讯-上一条/下一条快讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【36氪快讯】技能已打开

        # 模拟用户说出【36氪快讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
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

        # 模拟用户说出【下一条】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一条】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【上一条】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【上一条】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content         |
            | 36氪快讯         | 为你播放36氪快讯，以下是最新科技新闻 |

    @TypicalCase  @running
    场景大纲: 智能跑走-智能跑走
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | tts_content           |
            | 智能跑走       | 即将播放韵律跑节奏音乐 |

    @TypicalCase  @Newsletter
    场景大纲: 数闻简讯-数闻简讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【数闻简讯】技能已打开

        # 模拟用户说出【数闻简讯】的识别过程
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
        # 模拟用户说出【最近的新闻内容】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【最近的新闻内容】
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

        例子:     语料
            | voice_content | tts_content          |
            | 数闻简讯        | 听新闻，就在数闻简讯 |

    @TypicalCase  @Stylite
    场景大纲: 修行者-修行者，开始坐禅
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子:     语料
            | voice_content | tts_content |
            | 修行者          | 和我说“开始坐禅”开始今天的坐禅修行。也可以和我说“播放音乐”，我会为你播放悦耳梵音。|

    @TypicalCase  @Stylite
    场景大纲: 修行者-修行者，播放音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
        # 模拟用户说出【播放音乐】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【播放音乐】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

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

        例子:     语料
            | voice_content | tts_content |
            | 修行者          | 和我说“开始坐禅”开始今天的坐禅修行。也可以和我说“播放音乐”，我会为你播放悦耳梵音。|

    @TypicalCase  @FlyingFlowerOrder
    场景大纲: 飞花令-飞花令
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 飞花令         | 玩飞花令      |

# 扩展用例

    @ExtraCase  @Datetime
    场景大纲: 时间查询-查询时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | tts_content | template_type | title | text_field | sub_text_field |
            | 现在几点       | :           | BodyTemplate3  | 时间  | :            | 市              |
            | 现在时间       | :           | BodyTemplate3  | 时间  | :            | 市              |
            | 几点了         | :           | BodyTemplate3  | 时间  | :            | 市              |
            | 什么时间了     | :           | BodyTemplate3  | 时间  | :            | 市              |
            | 报时           | :           | BodyTemplate3  | 时间  | :            | 市              |

    @ExtraCase  @Datetime
    场景大纲: 时间查询-查询日期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【今天几号】
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
            | 今天几号       | -            | BodyTemplate3 | 时间   | 年          | 今天                |
            | 今天日期       | -            | BodyTemplate3 | 时间   | 年          | 今天                |
            | 周六几号       | -            | BodyTemplate3 | 时间   | 年          | 周六                |
            | 大后天日期     | -            | BodyTemplate3 | 时间   | 年          | 大后天              |

    @ExtraCase  @Datetime
    场景大纲: 时间查询-查询星期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【今天星期几】
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
            | voice_content      | tts_content | template_type | title | text_field | sub_text_field |
            | 今天星期几          | 星期         | BodyTemplate3 | 时间  | 星期        | 今天           |
            | 今天周几            | 星期         | BodyTemplate3 | 时间  | 星期        | 今天           |

    @ExtraCase  @Datetime
    场景大纲: 时间查询-查询某地点时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【美国几点了】
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
            | 美国几点了     | :            | BodyTemplate3 | 时间  | :            | 美国            |
	        | 伦敦现在几点   | :           | BodyTemplate3  | 时间  | :            | 伦敦            |

    @ExtraCase  @Datetime
    场景大纲: 时间查询-查询农历
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【今天农历多少】
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
            | 今天农历多少   | 月           | BodyTemplate3 | 时间  | 农历       | -                |
            | 农历几号       | 月           | BodyTemplate3 | 时间  | 农历       | -                |

    @ExtraCase  @Datetime
    场景大纲: 时间查询-查询节日时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【国庆节是哪天】
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
            | 国庆节是哪天   | -     | BodyTemplate3 | 时间  | 年    | 国庆节          |
            | 国庆节是几号   | -     | BodyTemplate3 | 时间  | 年    | 国庆节          |

    @ExtraCase  @Datetime
    场景大纲: 时间查询-查询距离某个节点还有多少时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【时间查询】技能已打开

        # 模拟用户说出【距离国庆还有多久】
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
            | voice_content   | tts_content | template_type | title | text_field | sub_text_field |
            | 距离国庆还有多久 | 还有        | BodyTemplate3 | 时间  | 还有        | 距离国庆            |
            | 离国庆还有多久   | 还有        | BodyTemplate3 | 时间  | 还有        | 距离国庆            |

    @ExtraCase  @TrafficRestriction
    场景大纲: 限行查询-查询某地某日限行
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 明天上海几号限行      | 限行          |
            | 后天杭州限行规则      | 限行          |
            | 后天北京限行标准      | 限行          |
            | 今天限行的尾号是多少    | 限行          |
            | 北京市的限行规则是什么   | 限行          |

    @ExtraCase  @TrafficRestriction
    场景大纲: 限行查询-查询某车牌号是否限行
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【限行查询】技能已打开

        # 模拟用户说出【粤A64E09今天限行吗】
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
            | 粤A64E09今天限行吗  | 限行          |
            | 粤B12345今天限行吗  | 限行          |
            | 京A67890今天限行吗  | 限行          |

    @ExtraCase  @News
    场景大纲: 新闻-随机播放新闻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【新闻】技能已打开

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 虽然我不是很厉害，但忍不住心系天下呢 |
            | 不知道听什么的时候我也爱听新闻       |
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

        例子:     语料
            | voice_content |
            | 来点新闻       |
            | 给我讲个新闻   |

    @ExtraCase  @News
    场景大纲: 新闻-特定新闻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【新闻】技能已打开

        # 模拟用户说出【来点新闻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content          |
            | 一起来听听            |
            | 嗯[=en4]，我们了解下 |
            | 新闻来了              |
            | 你真的很喜欢听        |
            | 你肯定感兴趣，对吗    |

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

        例子:     语料
            | voice_content |
            | 我想听体育新闻    |
            | 有什么社会新闻    |
            | 有没有杨幂的新闻  |
            | 今天有什么新闻    |

    @ExtraCase  @Calculator
    场景大纲: 计算器-计算器
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                    | tts_content            | template_type | title | text_field           | sub_text_field |
            | 一加一等于多少                    | 等于2                   | BodyTemplate3 | 计算  | 2                     | 一加一             |
            | 二的十次方等于几                  | 等于1024                | BodyTemplate3 | 计算  | 1024                  | 二的十次方     |
            | 一万减一是多少                    | 等于9999                | BodyTemplate3 | 计算  | 9999                  | 一万减        |
            | 4万减2万一千是几                  | 等于19000               | BodyTemplate3 | 计算  | 19000                | 4万减2万一千    |
            | 一千三百三十二除以二的结果是什么 | 等于666                 | BodyTemplate3 | 计算  | 666                   | 一千三百三十二除以二        |
            | 一万减一的结果是多少              | 等于9999               | BodyTemplate3 | 计算  | 9999                   | 一万减一       |
            | 二除以零的结果是几                | 零是不可以作为除数的哦 | BodyTemplate3 | 计算  | 零是不可以作为除数的哦| 二除以零          |
            | 零除以二得多少                    | 等于0                   | BodyTemplate3 | 计算  | 0                      | 零除以二          |
            | 二分之一加三分之一得几           | 等于0.8333              | BodyTemplate3 | 计算  | 0.8333                 | 二分之一加三分之一  |

    @ExtraCase  @Holiday @disable
    场景大纲: 节假日查询-根据节假日名称查询放假时间-不放假
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【儿童节放假安排】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content          |
            | 不放假哦，好好学习才是好孩子       |
            | 别老想着放假呦，工作使人快乐       |
            | 即使是儿童节，也还是不能停下脚步歇息的哦 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 儿童节放假安排       |

    @ExtraCase  @Holiday
    场景大纲: 节假日查询-查询某一天是否休假-周末放假
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年4月14号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和以下内容之一
            | tts_content |
            | 是休息日        |
            | 是周末哦，好好享受吧  |
            | 是周末，好好休息一下吧 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | date       |
            | 2018年4月14号上班吗 | 2018年4月14 |
            | 2018年4月14日放假吗 | 2018年4月14 |
            | 十二月二十九号有假吗| 十二月二十九 |

    @ExtraCase  @Holiday
    场景大纲: 节假日查询-查询某一天是否休假-法定节假日放假
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年10月1号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | date       | answer |
            | 2018年10月1号上班吗 | 2018年10月1 | 假期     |
            | 2018年1月1日放假吗  | 1月1日       | 放假     |
            | 2018年2月15号有假吗 | 2018年2月15 | 假期     |
            | 2018年2月17号上班吗 | 2018年2月17 | 假期     |
            | 2018年4月5号放假吗  | 2018年4月5 | 假期     |
            | 2018年5月1号有假吗  | 2018年5月1 | 假期     |
            | 2018年6月18号上班吗 | 2018年6月18 | 假期     |
            | 2018年9月24号放假吗 | 2018年9月24 | 假期     |
            | 2018年10月1日有假吗 | 2018年10月1 | 假期     |
            | 十月一号要上班吗     | 十月一      | 假期     |

    @ExtraCase  @Holiday
    场景大纲: 节假日查询-查询某一天是否休假-调休上班
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年2月11号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | date       | answer |
            | 2018年2月11号上班吗 | 2018年2月11 | 调休上班   |
            | 2018年2月24号放假吗 | 2018年2月24 | 调休上班   |
            | 2018年4月8号有假吗  | 2018年4月8 | 调休上班   |
            | 2018年4月28号上班吗 | 2018年4月28 | 调休上班   |
            | 2018年9月29日放假吗 | 2018年9月29 | 调休上班   |
            | 九月三十号有假吗     | 九月三十    | 调休上班   |

    @ExtraCase  @Holiday
    场景大纲: 节假日查询-查询某一天是否休假-周工作日
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【2018年1月2号上班吗】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<date>】和以下内容之一
            | tts_content      |
            | 是工作日             |
            | 当然要上班啊           |
            | 要上班，好好上班周末才能好好玩哦 |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | date       |
            | 2018年1月2号上班吗  | 2018年1月2 |
            | 2018年2月2日放假吗  | 2018年2月2 |
            | 2018年3月8号有假吗  | 2018年3月8 |
            | 2018年6月1号上班吗  | 2018年6月1 |
            | 十二月二十五号放假吗| 十二月二十五|

    @ExtraCase  @Holiday
    场景大纲: 节假日查询-查询下一个假期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【什么时候放假】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 最近的节假日是     |
            | 下一次放假是      |
            | 今年已经没有国家法定节假日可以放 |
            | 今年7个法定假期都已经结束了，期待明年假期的到来吧 |
            | 今年没有假期了呢，静候明年假期的安排出来      |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 什么时候放假        |
            | 最近的节假日是什么时候   |
            | 下一次放假是什么时候    |

    @ExtraCase  @WordsMeaning
    场景大纲: 词语解释-词语解释
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content             | answer               | template_type | main_title  | sub_title | text_field |
            | 怎么解释词语风马牛不相及  | 比喻事物彼此毫不相干 | BodyTemplate1 | 风马牛不相及 | fēng mǎ niú bù xiāng jí   | 比喻事物彼此毫不相干 |
            | 魑魅魍魉是啥意思          | 指各种各样的坏人      | BodyTemplate1 | 魑魅魍魉     | chī mèi wǎng liǎng   | 指各种各样的坏人     |

    @ExtraCase  @Idiom
    场景大纲: 成语查询-查询成语解释
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content     | answer                    | template_type  | main_title  | text_field |
            | 查下成语马到成功   | 形容工作刚开始就取得成功 | BodyTemplate1  | 马到成功     | 形容工作刚开始就取得成功 |
            | 马到成功            | 形容工作刚开始就取得成功 | BodyTemplate1  | 马到成功     | 形容工作刚开始就取得成功 |

    @ExtraCase  @Idiom
    场景大纲: 成语查询-查询成语出处
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语查询】技能已打开

        # 模拟用户说出【马到成功的出处】的识别过程
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
            | voice_content   | answer                                                      | template_type  | main_title  | sub_title | text_field |
            | 马到成功的出处   | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 | BodyTemplate1  | 马到成功     | 成语出处   | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 |
            | 马到成功的出处   | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 | BodyTemplate1  | 马到成功     | 成语出处   | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 |
            | 马到成功出自哪里 | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 | BodyTemplate1  | 马到成功     | 成语出处   | 元·无名氏《小尉迟》第二折：“那老尉迟这一去，马到成功。 |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询某一天天气/温度-不指定地点和日期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【天气怎么样】
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
            | 今天广州天气        | 广州          | 今天           |
            | 天气怎么样         | 广州          | 今天           |
            | 气温怎么样         | 广州          | 今天           |
            | 温度怎么样         | 广州          | 今天           |
            | 查询天气          | 广州          | 今天           |
            | 查询气温          | 广州          | 今天           |
            | 查询温度          | 广州          | 今天           |
            | 什么天气          | 广州          | 今天           |
            | 天气            | 广州          | 今天           |
            | 气温            | 广州          | 今天           |
            | 温度            | 广州          | 今天           |
            | 热吗            | 广州          | 今天           |
            | 热不热           | 广州          | 今天           |
            | 冷吗            | 广州          | 今天           |
            | 冷不冷           | 广州          | 今天           |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询某一天天气/温度-日期在未来一周内
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天北京天气怎么样】
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
            | 热       |
            | 冷       |
            | ℃       |
            | 热       |
            | 冷       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 |
            | 今天北京天气怎么样     | 北京          | 今天           |
            | 明天上海气温怎么样     | 上海          | 明天           |
            | 周六徐州温度怎么样     | 徐州          | 周六           |
            | 深圳明天天气怎么样     | 深圳          | 明天           |
            | 宿州周一气温怎么样     | 宿州          | 周一           |
            | 徐州后天温度怎么样     | 徐州          | 后天           |
            | 北京天气怎么样       | 北京          | 后天           |
            | 北京气温怎么样       | 北京          | 后天           |
            | 北京温度怎么样       | 北京          | 后天           |
            | 今天天气怎么样       | 北京          | 今天           |
            | 明天气温怎么样       | 北京          | 明天           |
            | 后天温度怎么样       | 北京          | 后天           |
            | 查询明天北京天气      | 北京          | 明天           |
            | 查询明天北京气温      | 北京          | 明天           |
            | 查询后天沈阳温度      | 沈阳          | 后天           |
            | 查询武汉明天天气      | 武汉          | 明天           |
            | 查询重庆今天气温      | 重庆          | 今天           |
            | 查询拉萨今天温度      | 拉萨          | 今天           |
            | 今天北京什么天气      | 北京          | 今天           |
            | 查询徐州天气        | 徐州          | 今天           |
            | 查询徐州气温        | 徐州          | 今天           |
            | 查询徐州温度        | 徐州          | 今天           |
            | 查询今天天气        | 徐州          | 今天           |
            | 查询大后天气温       | 徐州          | 大后天          |
            | 查询周一温度        | 徐州          | 周一           |
            | 广州明天什么天气      | 广州          | 明天           |
            | 明天什么天气        | 广州          | 明天           |
            | 广州什么天气        | 广州          | 明天           |
            | 明天杭州天气        | 杭州          | 明天           |
            | 后天昆明气温        | 昆明          | 后天           |
            | 大后天桂林温度       | 桂林          | 大后天          |
            | 贵阳今天天气        | 贵阳          | 今天           |
            | 澳门明天气温        | 澳门          | 明天           |
            | 香港周一温度        | 香港          | 周一           |
            | 北京天气          | 北京          | 周一           |
            | 北京气温          | 北京          | 周一           |
            | 北京温度          | 北京          | 周一           |
            | 今天天气          | 北京          | 今天           |
            | 明天气温          | 北京          | 明天           |
            | 后天温度          | 北京          | 后天           |
            | 今天广州热吗        | 广州          | 今天           |
            | 今天徐州热不热       | 徐州          | 今天           |
            | 明天北京冷吗        | 北京          | 明天           |
            | 后天杭州冷不冷       | 杭州          | 后天           |
            | 深圳今天热吗        | 深圳          | 今天           |
            | 合肥周六热不热       | 合肥          | 周六           |
            | 厦门冷吗          | 厦门          | 周六           |
            | 澳门明天冷不冷       | 澳门          | 明天           |
            | 北京热吗          | 北京          | 明天           |
            | 北京热不热         | 北京          | 明天           |
            | 北京冷吗          | 北京          | 明天           |
            | 北京冷不冷         | 北京          | 明天           |
            | 今天热吗          | 北京          | 今天           |
            | 今天热不热         | 北京          | 今天           |
            | 今天冷吗          | 北京          | 今天           |
            | 今天冷不冷         | 北京          | 今天           |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询某一天下雨吗-不指定地点和日期
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【下雨吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】和【<tts_content3>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 | tts_content3 |
            | 北京今天下雨吗       | 北京          | 今天           | 雨            |
            | 下雨吗           | 北京          | 今天           | 雨            |
            | 可以洗车吗         | 北京          | 今天           | 洗车           |
            | 需要带伞吗         | 北京          | 今天           | 伞           |
            | 能穿白鞋吗         | 北京          | 今天           | 穿           |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询某一天下雨吗-日期在未来一周内
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【广州今天下雨吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】和【<tts_content3>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content | tts_content2 | tts_content3 |
            | 广州今天下雨吗       | 广州          | 今天           | 雨            |
            | 明天宿州下雨吗       | 宿州          | 明天           | 雨            |
            | 广州下雨吗         | 广州          | 明天           | 雨            |
            | 今天下雨吗         | 广州          | 今天           | 雨            |
            | 广州今天可以洗车吗     | 广州          | 今天           | 洗车           |
            | 今天徐州可以洗车吗     | 徐州          | 今天           | 洗车           |
            | 广州可以洗车吗       | 广州          | 今天           | 洗车           |
            | 今天可以洗车吗       | 广州          | 今天           | 洗车           |
            | 深圳今天需要带伞吗     | 深圳          | 今天           | 伞            |
            | 明天徐州需要带伞吗     | 徐州          | 明天           | 伞            |
            | 深圳需要带伞吗       | 深圳          | 明天           | 伞            |
            | 后天需要带伞吗       | 深圳          | 后天           | 伞            |
            | 北京今天能穿白鞋吗     | 今天          | 北京           | 穿           |
            | 后天宿州能穿白鞋吗     | 后天          | 宿州           | 穿           |
            | 广州能穿白鞋吗       | 后天          | 广州           | 穿           |
            | 明天能穿白鞋吗       | 明天          | 广州           | 穿           |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询空气质量-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【空气怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 优         |
            | 良         |
            | 轻度污染   |
            | 中度污染   |
            | 重度污染   |
            | 严重污染   |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 空气质量优         |
            | 空气质量良         |
            | 空气质量轻度污染   |
            | 空气质量中度污染   |
            | 空气质量重度污染   |
            | 空气质量严重污染   |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天广州空气质量      |
            | 空气怎么样         |
            | 空气好吗          |
            | 空气质量          |
            | 空气如何          |
            | 广州今天空气怎么样     |
            | 合肥今天空气好吗      |
            | 宿州今天空气如何      |
            | 今天广州空气怎么样     |
            | 今天合肥空气好吗      |
            | 今天广州空气质量      |
            | 今天宿州空气如何      |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询雾霾情况-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【空气怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 雾霾         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 有雾霾吗          |
            | 有霾吗           |
            | 广州今天有雾霾吗      |
            | 广州今天有霾吗       |
            | 今天北京有雾霾吗      |
            | 今天石家庄有霾吗      |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询空气质量-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【广州周六空气质量】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content         |
            | 空气质量需要实时获取，还不支持周六空气质量的查询 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 广州周六空气质量      |
            | 周六广州空气质量      |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询穿衣指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【应该穿什么】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 春秋装            |
            | 早春晚秋装        |
            | 夏装              |
            | 盛夏装            |
            | 初冬装            |
            | 冬装              |
            | 严冬装            |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 广州今天应该穿什么     | 服装          |
            | 应该穿什么         | 服装          |
            | 需要穿毛衣吗        | 服装          |
            | 可以穿毛衣吗        | 服装          |
            | 穿衣指数          | 服装          |
            | 今天北京应该穿什么     | 服装          |
            | 今天宿州需要穿毛衣吗    | 服装          |
            | 今天合肥可以穿毛衣吗    | 服装          |
            | 今天广州穿衣指数      | 服装          |
            | 北京今天应该穿什么     | 服装          |
            | 香港今天需要穿毛衣吗    | 服装          |
            | 广州今天可以穿薄外套吗   | 服装          |
            | 深圳今天穿衣指数      | 服装          |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询穿衣指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【广州明天应该穿什么】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content       |
            | 我只知道今天穿什么衣服       |
            | 需要穿什么衣服需要当天才能知道   |
            | 你可以参考这个温度来决定穿什么衣服 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 广州明天应该穿什么     |
            | 后天广州应该穿什么     |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询防晒指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【晒吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 弱                |
            | 较弱              |
            | 中等              |
            | 强                |
            | 极强              |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 紫外线         |
            | 紫外辐射        |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天广州晒吗        |
            | 今天广州出门会变黑吗    |
            | 今天徐州需要防晒吗     |
            | 今天徐州防晒指数      |
            | 晒吗            |
            | 出门会变黑吗        |
            | 需要防晒吗         |
            | 防晒指数          |
            | 上海今天晒吗        |
            | 上海今天出门会变黑吗    |
            | 上海今天需要防晒吗     |
            | 上海今天防晒指数      |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询防晒指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【上海明天晒吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 明天的防晒指数要明天才知道哦 |
            | 我只知道今天         |
            | 防晒指数我只有今天的哦    |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 上海明天晒吗        |
            | 后天上海晒吗        |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询逛街指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【适合逛街吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜                |
            | 较适宜              |
            | 较不宜              |
            | 不适宜              |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 今天适合逛街吗       | 逛街          |
            | 今天可以逛街吗       | 逛街          |
            | 今天北京适合逛街吗     | 逛街          |
            | 今天广州可以逛街吗     | 逛街          |
            | 合肥今天适合逛街吗     | 逛街          |
            | 合肥今天可以逛街吗     | 逛街          |
            | 适合逛街吗         | 逛街          |
            | 可以逛街吗         | 逛街          |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询逛街指数-非今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【合肥明天可以逛街吗】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 明天的逛街指数要明天才知道哦 |
            | 我只知道今天适不适合逛街   |
            | 我只知道今天的逛街指数    |
            | 逛街指数我只有今天的哦    |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 合肥明天可以逛街吗     |
            | 后天合肥可以逛街吗     |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询空气湿度-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天空气湿度】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 现在相对湿度 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天空气湿度    |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询pm2.5-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天pm2.5】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | pm2.5指数    |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天pm2.5      |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询晨练指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天晨练指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜                |
            | 较适宜              |
            | 较不宜              |
            | 不宜                |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 晨练         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天晨练指数   |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询舒适度指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的舒适度指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 舒适                |
            | 较舒适              |
            | 不舒适              |
            | 非常不舒适          |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 舒适         |
            | 感到有些凉意 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的舒适度指数 |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询钓鱼指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的钓鱼指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜              |
            | 较适宜            |
            | 不宜              |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 垂钓         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的钓鱼指数  |
            | 今天适合钓鱼吗  |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询感冒指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的感冒指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 少发              |
            | 较易发            |
            | 易发              |
            | 极易发            |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 感冒         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的感冒指数   |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询旅游指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的旅游指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather |
            | 适宜              |
            | 较适宜            |
            | 不太适宜          |
            | 不适宜            |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 旅游         |
            | 旅行         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的旅游指数   |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询紫外线强度指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的紫外线强度指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather|
            | 最弱             |
            | 弱               |
            | 中等             |
            | 强               |
            | 很强             |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content   |
            | 紫外线强度      |
            | 紫外辐射        |
            | 紫外线辐射      |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的紫外线强度指数   |
            | 今天晒吗       |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询洗车指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的洗车指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather|
            | 适宜             |
            | 较适宜           |
            | 较不宜           |
            | 不宜             |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 洗车         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的洗车指数   |
            | 今天可以洗车吗   |
            | 今天适合洗车吗   |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询运动指数-今天
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【今天的运动指数】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】，参数【currentWeather】包含以下内容之一
            | current_weather|
            | 适宜             |
            | 较适宜           |
            | 较不宜           |
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 运动         |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 今天的运动指数   |
            | 今天适合运动吗   |

    @ExtraCase  @Weather
    场景大纲: 天气查询-查询时间段天气
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【周末广州天气怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】和【<tts_content2>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content         | tts_content | tts_content2|
            | 周末广州天气怎么样     | 广州周六      | 周日          |
            | 合肥本周末天气怎么样   | 合肥周六      | 周日          |
            | 查询北京假期天气       | 北京周六      | 周日          |
            | 查询这周上海天气       | 上海          | 这周          |
            | 查询接下来三天深圳天气 | 接下来三天    | 深圳          |
            | 查询接下来五天杭州天气 | 接下来五天    | 杭州          |

    @ExtraCase  @Stock
    场景大纲: 股票查询-查看大盘投资建议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【今天推荐买什么股票】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content               |
            | 今天没有股票出现买入机会，请明天开盘后再来试试   |
            | 股票出现买入机会，请打开小飞在线APP查看股票名单 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content        | template_type | title    | text_field      | sub_text_field |
	        | 今天有哪些股票可以买 | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 今天推荐买什么股票   | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 今天有什么股票可以买 | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 今天有什么投资建议   | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 今天建议买什么股票   | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 推个票呗             | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 今天又什么投资机会   | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 有哪些股票可以买     | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |
            | 我想买股票           | BodyTemplate3 | 查股票   | 股票出现买入机会 | 大盘投资建议    |

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票名称查询股票概况
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【中兴通讯的股票怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 当前操作建议为空仓   |
            | 当前操作建议为减仓   |
            | 当前操作建议为持仓，需要我们提供最近的买入价吗？ |
            | 当前操作建议为买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content             | stock            | answered  | template_type | title  | text_field | sub_text_field |
            | 中兴通讯的股票怎么样      | 中兴通讯当前股价 | 是        | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 帮我查一下中兴通讯的股票  | 中兴通讯当前股价 | 好的      | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 股票查询中兴通讯          | 中兴通讯当前股价 | 好        | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 查询股票中兴通讯          | 中兴通讯当前股价 | 需要      | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 查询中兴通讯的股票        | 中兴通讯当前股价 | 不用了   | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 查询中兴通讯这只股票      | 中兴通讯当前股价 | 不用     | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 查询中兴通讯这个股票      | 中兴通讯当前股价 | 不需要   | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 我想查询中兴通讯这只股票  | 中兴通讯当前股价 | 算了     | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 我想查询中兴通讯这个股票  | 中兴通讯当前股价 | 好       | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 帮我查询中兴通讯这只股票  | 中兴通讯当前股价 | 需要     | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 帮我查询中兴通讯这个股票  | 中兴通讯当前股价 | 不了     | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 中兴通讯的股票            | 中兴通讯当前股价 | 需要     | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |
            | 中兴通讯的股票            | 中兴通讯当前股价 | 不需要   | BodyTemplate3 | 查股票  | 元         | 中兴通讯        |

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票名称查询实时股价
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【查询科大讯飞的股价】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一
            | tts_content |
            | 今日涨幅        |
            | 今日跌幅        |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content              | stock            | template_type | title | text_field | sub_text_field |
            | 查询科大讯飞的股价          | 科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元        | 科大讯飞        |
            | 股价查询银河生物            | 银河生物当前股价 | BodyTemplate3 | 查股票  | 元        | 银河生物        |
            | 北方国际现在多少钱一股      | 北方国际当前股价 | BodyTemplate3 | 查股票  | 元        | 北方国际        |
            | 东方雨虹的股价多少          | 东方雨虹当前股价 | BodyTemplate3 | 查股票  | 元        | 东方雨虹        |
            | 中国铁建的股票价格          | 中国铁建当前股价 | BodyTemplate3 | 查股票  | 元        | 中国铁建        |
            | 我想知道科大讯飞的股票价格 | 科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元        | 科大讯飞        |
            | 我想查查科大讯飞的股票价格 | 科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元        | 科大讯飞        |
            | 科大讯飞的股价              | 科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元        | 科大讯飞        |

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票名称查询投资风险
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【科大讯飞有什么投资风险】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content          | stock                         | template_type | title   | text_field | sub_text_field |
            | 科大讯飞有什么投资风险     | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 科大讯飞的股票有什么投资风险  | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 科大讯飞这只股票有什么投资风险 | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 科大讯飞这个股票有什么投资风险 | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 科大讯飞这支股票有什么投资风险 | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 广联达当前风险如何       | 广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票   | 最大        | 广联达[002410]|
            | 广联达的股票当前风险如何    | 广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票   | 最大        | 广联达[002410]|
            | 广联达这只股票当前风险如何   | 广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票   | 最大        | 广联达[002410]|
            | 广联达这个股票当前风险如何   | 广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票   | 最大        | 广联达[002410]|
            | 广联达这支股票当前风险如何   | 广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票   | 最大        | 广联达[002410]|
            | 北方国际后市有什么风险     | 北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 北方国际[000065]|
            | 北方国际的股票后市有什么风险  | 北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 北方国际[000065]|
            | 北方国际这只股票后市有什么风险 | 北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 北方国际[000065]|
            | 北方国际这个股票后市有什么风险 | 北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 北方国际[000065]|
            | 北方国际这支股票后市有什么风险 | 北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 北方国际[000065]|
            | 买科大讯飞有风险吗       | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 买科大讯飞的股票有风险吗    | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 买科大讯飞这只股票有风险吗   | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 买科大讯飞这个股票有风险吗   | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 买科大讯飞这支股票有风险吗   | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 现在买科大讯飞有风险吗     | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 现在买科大讯飞的股票有风险吗  | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 现在买科大讯飞这只股票有风险吗 | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 现在买科大讯飞这个股票有风险吗 | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|
            | 现在买科大讯飞这支股票有风险吗 | 科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票   | 最大        | 科大讯飞[002230]|

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票名称查询投资建议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【科大讯飞有什么投资建议】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 空仓   |
            | 减仓   |
            | 持仓，需要我们提供最近的买入价吗？ |
            | 买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content            | stock                | answered|
            | 中兴通讯有什么投资建议     | 中兴通讯的建议操作为 | 是       |
            | 你建议买中兴通讯的股票吗   | 中兴通讯的建议操作为 | 是       |
            | 中兴通讯的股票现在值得买吗 | 中兴通讯的建议操作为 | 好的     |
            | 现在应该买中兴通讯的股票吗 | 中兴通讯的建议操作为 | 好       |
            | 现在买中兴通讯的股票合适吗 | 中兴通讯的建议操作为 | 需要     |
            | 中兴通讯有什么操作建议     | 中兴通讯的建议操作为 | 不用了   |
            | 建议买入中兴通讯吗？       | 中兴通讯的建议操作为 | 不用     |
            | 建议买入中兴通讯的股票吗？ | 中兴通讯的建议操作为 | 不需要   |
            | 中兴通讯值得买吗？        | 中兴通讯的建议操作为  | 算了     |
            | 中兴通讯可以买吗？        | 中兴通讯的建议操作为  | 好的     |
            | 中兴通讯建议买吗？        | 中兴通讯的建议操作为  | 好       |
            | 中兴通讯能买吗？          | 中兴通讯的建议操作为  | 需要     |
            | 中兴通讯的股票值得买吗？  | 中兴通讯的建议操作为  | 需要     |
            | 中兴通讯的股票可以买吗？  | 中兴通讯的建议操作为  | 不了     |
            | 中兴通讯的股票建议买吗？  | 中兴通讯的建议操作为  | 是       |
            | 中兴通讯的股票能买吗？    | 中兴通讯的建议操作为  | 是       |

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票代码查询股票概况
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【002230的股票怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 当前操作建议为空仓   |
            | 当前操作建议为减仓   |
            | 当前操作建议为持仓，需要我们提供最近的买入价吗？ |
            | 当前操作建议为买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content     | stock                   | answered | template_type | title  | text_field | sub_text_field |
            | 000063的股票怎么样   | 000063中兴通讯当前股价 | 是      | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 帮我查一下000063的股票 | 000063中兴通讯当前股价 | 好的     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 股票查询000063     | 000063中兴通讯当前股价 | 好      | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 查询股票000063     | 000063中兴通讯当前股价 | 需要     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 查询000063的股票    | 000063中兴通讯当前股价 | 不用了    | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 查询000063这只股票   | 000063中兴通讯当前股价 | 不用     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 查询000063这个股票   | 000063中兴通讯当前股价 | 不需要    | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 我想查询000063这只股票 | 000063中兴通讯当前股价 | 需要     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 我想查询000063这个股票 | 000063中兴通讯当前股价 | 算了     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 帮我查询000063这只股票 | 000063中兴通讯当前股价 | 好的     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 帮我查询000063这个股票 | 000063中兴通讯当前股价 | 不了     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 000063的股票      | 000063中兴通讯当前股价 | 不了     | BodyTemplate3 | 查股票  | 元         | 000063          |
            | 000063的股票      | 000063中兴通讯当前股价 | 好的     | BodyTemplate3 | 查股票  | 元         | 000063          |

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票代码查询实时股价
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【查询002230的股价】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一
            | tts_content |
            | 今日涨幅        |
            | 今日跌幅        |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content    | stock                   | template_type | title  | text_field | sub_text_field |
            | 查询002230的股价     | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |
            | 股价查询000806      | 000806银河生物当前股价 | BodyTemplate3 | 查股票  | 元          | 000806              |
            | 000065现在多少钱一股   | 000065北方国际当前股价 | BodyTemplate3 | 查股票  | 元          | 000065              |
            | 002230的股价多少     | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |
            | 002230的股票价格     | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |
            | 我想知道002230的股票价格 | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |
            | 我想查查002230的股票价格 | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |
            | 002230的价格是多少    | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |
            | 002230的股价       | 002230科大讯飞当前股价 | BodyTemplate3 | 查股票  | 元          | 002230              |

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票代码查询投资风险
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【002230有什么投资风险】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content              | stock                                | template_type | title   | text_field | sub_text_field |
            | 002230有什么投资风险     | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 002230的股票有什么投资风险  | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 002230这只股票有什么投资风险 | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 002230这个股票有什么投资风险 | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 002230这支股票有什么投资风险 | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 002410当前风险如何      | 002410广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票  | 最大         | 002410         |
            | 002410的股票当前风险如何   | 002410广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票  | 最大         | 002410         |
            | 002410这只股票当前风险如何  | 002410广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票  | 最大         | 002410         |
            | 002410这个股票当前风险如何  | 002410广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票  | 最大         | 002410         |
            | 002410这支股票当前风险如何  | 002410广联达今日最大跌幅不会超过  | BodyTemplate3 | 查股票  | 最大         | 002410         |
            | 000065后市有什么风险     | 000065北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 000065         |
            | 000065的股票后市有什么风险  | 000065北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 000065         |
            | 000065这只股票后市有什么风险 | 000065北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 000065         |
            | 000065这个股票后市有什么风险 | 000065北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 000065         |
            | 000065这支股票后市有什么风险 | 000065北方国际今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 000065         |
            | 买002271有风险吗       | 002271东方雨虹今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002271         |
            | 买002271的股票有风险吗    | 002271东方雨虹今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002271         |
            | 买002271这个股票有风险吗   | 002271东方雨虹今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002271         |
            | 买002271这支股票有风险吗   | 002271东方雨虹今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002271         |
            | 现在买002230有风险吗     | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 现在买002230的股票有风险吗  | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 现在买002230这只股票有风险吗 | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 现在买002230这个股票有风险吗 | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |
            | 现在买002230这支股票有风险吗 | 002230科大讯飞今日最大跌幅不会超过 | BodyTemplate3 | 查股票  | 最大         | 002230         |

    @ExtraCase  @Stock
    场景大纲: 股票查询-根据股票代码查询投资建议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【股票查询】技能已打开

        # 模拟用户说出【300058有什么投资建议】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<stock>】和以下内容之一且判断是否追问，追问值【<answered>】
            | asked |
            | 空仓   |
            | 减仓   |
            | 持仓，需要我们提供最近的买入价吗？ |
            | 买入，需要我们提供建议买入价吗？  |

        例子:     语料
            | voice_content           | stock                      | answered|
            | 000063有什么投资建议     | 000063中兴通讯的建议操作为 | 是      |
            | 你建议买002230的股票吗   | 002230科大讯飞的建议操作为 | 是      |
            | 002230的股票现在值得买吗 | 002230科大讯飞的建议操作为 | 好的    |
            | 现在应该买002230的股票吗 | 002230科大讯飞的建议操作为 | 好      |
            | 现在买002230的股票合适吗 | 002230科大讯飞的建议操作为 | 需要    |
            | 002230有什么操作建议     | 002230科大讯飞的建议操作为 | 不用了  |
            | 建议买入002230吗？       | 002230科大讯飞的建议操作为 | 不用    |
            | 建议买入002230的股票吗？ | 002230科大讯飞的建议操作为 | 不需要  |
            | 002230值得买吗？         | 002230科大讯飞的建议操作为 | 算了    |
            | 002230可以买吗？         | 002230科大讯飞的建议操作为 | 不了    |
            | 002230建议买吗？         | 002230科大讯飞的建议操作为 | 是      |
            | 002230能买吗？           | 002230科大讯飞的建议操作为 | 是      |
            | 002230的股票值得买吗？   | 002230科大讯飞的建议操作为 | 是      |
            | 002230的股票可以买吗？   | 002230科大讯飞的建议操作为 | 不了    |
            | 002230的股票建议买吗？   | 002230科大讯飞的建议操作为 | 是      |
            | 002230的股票能买吗？     | 002230科大讯飞的建议操作为 | 是      |

    @ExtraCase  @Translation
    场景大纲: 翻译-中文翻译成英文
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content          | translation                             | template_type | title   | text_field | sub_text_field |
            | 帮我翻译所见即所得     | What you see is what you get          | BodyTemplate3 | 中英翻译| What you see is what you get | 所见即所得  |
            | 所见即所得英文怎么说   | What you see is what you get          | BodyTemplate3 | 中英翻译| What you see is what you get | 所见即所得  |
            | 把所见即所得翻译成英文 | What you see is what you get          | BodyTemplate3 | 中英翻译| What you see is what you get | 所见即所得  |
            | 用英文翻译所见即所得   | What you see is what you get          | BodyTemplate3 | 中英翻译| What you see is what you get | 所见即所得  |
            | 我要翻译所见即所得     | What you see is what you get          | BodyTemplate3 | 中英翻译| What you see is what you get | 所见即所得  |
            | 我想翻译有志者事竟成   | Where there is a will there is a way | BodyTemplate3 | 中英翻译| Where there is a will there is a way | 有志者事竟成  |
            | 帮我翻译一下所见即所得 | What you see is what you get          | BodyTemplate3 | 中英翻译| What you see is what you get | 所见即所得  |

    @ExtraCase  @Chatting
    场景大纲: 闲聊技能
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【闲聊】技能已打开

        # 模拟用户说出【对你彻底无语了】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content      |
            | 对你彻底无语了       |
            | 我心情很不好         |
            | 我给你介绍一个对象吧 |
            | 休息会儿吧           |
            | 你都有什么才华呢     |
            | 你好漂亮哦           |

    @ExtraCase  @Poetry
    场景大纲: 古诗词-查询某一首诗歌
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【静夜思】
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
            | voice_content     | answer                       | template_type  | main_title  | sub_title | text_field |
            | 静夜思             | 床前明月光，疑是地上霜。      | BodyTemplate1  | 静夜思       | 李白       | 床前明月光，疑是地上霜。举头望明月，低头思故乡。 |
            | 来一首李白的静夜思 | 床前明月光，疑是地上霜。      | BodyTemplate1  | 静夜思       | 李白       | 床前明月光，疑是地上霜。举头望明月，低头思故乡。 |
            | 背一首李白的将进酒 | 黄河之水天上来，奔流到海不复回| BodyTemplate1  | 将进酒       | 李白       | 黄河之水天上来，奔流到海不复回 |

    @ExtraCase  @Poetry
    场景大纲: 古诗词-查询某位诗人有哪些作品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【李白有什么代表作】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为【<sub_title>】，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content   | template_type  | main_title  | sub_title |
            | 李白有什么代表作 | BodyTemplate1  | 李白         | 唐代         |
            | 李白的诗都有哪些 | BodyTemplate1  | 李白         | 唐代         |
            | 李白有哪些诗     | BodyTemplate1  | 李白         | 唐代         |

    @ExtraCase  @Poetry
    场景大纲: 古诗词-查询古诗词的作者
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【庄生晓梦迷蝴蝶是谁写的】
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
            | voice_content        | answer | template_type | title   | text_field | sub_text_field |
            | 庄生晓梦迷蝴蝶是谁写的 | 李商隐 | BodyTemplate3 | 古诗词   | 李商隐      | 庄生晓梦迷蝴蝶   |
            | 静夜思的作者           | 李白   | BodyTemplate3 | 古诗词   | 李白        | 静夜思           |
            | 静夜思是谁的诗         | 李白   | BodyTemplate3 | 古诗词   | 李白        | 静夜思           |

    @ExtraCase  @Poetry
    场景大纲: 古诗词-查询上/下一句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【床前明月光的下一句是什么】
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
            | voice_content            | answer        | template_type | title | text_field    | sub_text_field |
            | 床前明月光的下一句是什么   | 疑是地上霜    | BodyTemplate3 | 古诗词 | 疑是地上霜     | 床前明月光       |
            | 山有木兮木有枝             | 心悦君兮君不知| BodyTemplate3 | 古诗词 | 心悦君兮君不知 | 山有木兮木有枝 |
            | 白日依山尽的下一句是什么   | 黄河入海流    | BodyTemplate3 | 古诗词 | 黄河入海流     | 白日依山尽 |

    @ExtraCase  @Poetry
    场景大纲: 古诗词-查询第一句/最后一句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【长恨歌的最后一句】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content    | answer        | template_type | title | text_field    |
            | 长恨歌的最后一句  | 此恨绵绵无绝期 | BodyTemplate3 | 古诗词 | 此恨绵绵无绝期 |
            | 静夜思的第一句    | 床前明月光     | BodyTemplate3 | 古诗词 | 床前明月光     |

    @ExtraCase  @Poetry
    场景大纲: 古诗词-诗歌的朝代
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【古诗词】技能已打开

        # 模拟用户说出【长恨歌】
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
            | voice_content             | answer |  template_type  | main_title | sub_title | text_field |
            | 查一查陇西行出自什么朝代的 | 唐代    |  BodyTemplate1  | 陇西行       | 陈陶       | 誓扫匈奴不顾身，五千貂锦丧胡尘。可怜无定河边骨，犹是春闺梦里人 |
            | 静夜思是哪个朝代的         | 唐代    |  BodyTemplate1  | 静夜思       | 李白       | 床前明月光，疑是地上霜。举头望明月，低头思故乡 |

    @ExtraCase  @Food
    场景大纲: 食物热量-营养成分
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【食材百科】技能已打开

        # 模拟用户说出【200克苹果的热量】
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
            | voice_content                 | answer                 | template_type  | main_title  | sub_title  | text_field |
            | 薯片的营养成分包括多少        | 100克的薯片中包含热量 | BodyTemplate1  | 薯片         | 营养成分    | 100克的薯片  |
            | 150克的面包的营养成分有多少  | 150克的面包中包含热量  | BodyTemplate1  | 面包         | 营养成分 | 150克的面包 |

    @ExtraCase  @Food
    场景大纲: 食物热量-食物的热量、蛋白质、脂肪、碳水化合物
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                       | answer                 | template_type | title    | text_field | sub_text_field |
            | 200克苹果的热量                     | 106千卡的热量          | BodyTemplate3 | 食物热量  | 热量        | 200克苹果              |
            | 300克薯片的脂肪含量有多少           | 112.8克的脂肪         | BodyTemplate3 | 食物热量  | 脂肪       | 300克薯片              |
            | 薯片有多少卡路里                     | 480千卡的热量         | BodyTemplate3 | 食物热量  | 热量        | 100克薯片              |
            | 150克的面包的蛋白质有多少           | 12.45克的蛋白质       | BodyTemplate3 | 食物热量  | 蛋白质      | 150克面包              |
            | 200克的面包的碳水化合物含量有多少  | 117.2克的碳水化合物   | BodyTemplate3 | 食物热量  | 碳水化合物  | 200克面包              |

    @ExtraCase  @HomoionymAntonym
    场景大纲: 近反义词-搜索近反义词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content           | template_type  | main_title  | sub_title | text_field |
            | 开心的近义词             | BodyTemplate1  | 开心         | 近义词    | 、         |
            | 安静的近义词是什么      | BodyTemplate1  | 安静         | 近义词     | 、         |
            | 哪个词是安静的近义词    | BodyTemplate1  | 安静         | 近义词     | 、         |
            | 有哪些词和安静的意思相反| BodyTemplate1  | 安静         | 反义词     | 、         |
            | 开心的反义词是什么      | BodyTemplate1  | 开心         | 反义词     | 、         |
            | 帮我查开心的反义词      | BodyTemplate1  | 开心         | 反义词     | 、         |

    @ExtraCase  @meishichina
    场景大纲: 美食天下菜谱-打开美食天下菜谱
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【美食天下菜谱】技能已打开

        # 模拟用户说出【打开美食天下】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
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
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开美食天下        |
            | 开启美食天下        |
            | 进入美食天下        |
            | 开始美食天下        |
            | 美食天下          |

    @ExtraCase  @meishichina
    场景大纲: 美食天下菜谱-具体菜式的菜谱
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【可乐鸡翅怎么做】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 可乐鸡翅怎么做       | 可乐鸡翅        |
            | 番茄炒蛋怎么做       | 番茄炒蛋        |

    @ExtraCase  @meishichina
    场景大纲: 美食天下菜谱-模糊菜式的菜谱
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【教我做川菜】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 教我做川菜         | 鱼香肉丝        |
            | 教我做山药         | 蓝莓山药        |

    @ExtraCase  @meishichina
    场景: 美食天下菜谱-菜谱步骤
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【美食天下菜谱】技能已打开

        # 模拟用户说出【打开美食天下菜谱】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开美食天下】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【欢迎使用美食天下】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【可乐鸡翅怎么做】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【可乐鸡翅怎么做】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【可乐鸡翅】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【下一步】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一步】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【鸡翅洗净，加入适量料酒】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【下一步】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一步】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【葱姜切片】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【再说一遍】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【再说一遍】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【葱姜切片】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【上一步】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【上一步】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【鸡翅洗净，加入适量料酒】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 期待下次继续使用美食天下菜谱技能 |
            | 再见                             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @IdiomGame
    场景大纲: 成语接龙-打开成语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开

        # 模拟用户说出【打开成语接龙】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

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
            | tts_content |
            | 请先给我一个成语吧，比如：|
            | 那请先跟我说一个成语哦，比如：|
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 成语接龙       |
            | 打开成语接龙   |
            | 我要玩成语接龙 |

    @ExtraCase  @IdiomGame
    场景大纲: 成语接龙-游戏中
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开
        假如      iFlyOS客户端已经打开成语接龙

        # 模拟用户说出【一丝不苟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【该我啦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 一丝不苟          |

    @ExtraCase  @IdiomGame
    场景大纲: 成语接龙-重新开始一局
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开
        假如      iFlyOS客户端已经打开成语接龙

        # 模拟用户说出【重新来】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【欢迎你再次来玩成语接龙，你可以先说一个成语，我来接】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 重新来           |
            | 再来一次          |
            | 重来一局          |

    @ExtraCase  @IdiomGame
    场景大纲: 成语接龙-关闭成语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开
        假如      iFlyOS客户端已经打开成语接龙

        # 模拟用户说出【不玩了】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【期待您下次再来玩成语接龙】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 不玩了          |
            | 退出            |
            | 关闭成语接龙    |

    @ExtraCase  @WordGame  @disable
    场景大纲: 词语接龙-打开词语接龙
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【词语接龙】技能已打开

        # 模拟用户说出【打开词语接龙】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【词语接龙】
        #那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
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

    @ExtraCase  @VoiceNote  @disable
    场景大纲: 语记-完整完成语记
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【语记】技能已打开

        # 模拟用户说出【打开语记】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<enter_voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已打开语记，你可以对我说“开始记录”和“停止记录”】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【打开语记开始录音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<start_voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】【ExpectSpeech】

        # 模拟用户说出需要记录的内容的识别过程，包含【停止录音】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | enter_voice_content | start_voice_content | voice_content                                                                                                                                                                    |
            | 打开语记                | 打开语记开始录音            | 4月10日，博鳌亚洲论坛2018年年会在山青海碧、日暖风轻的海南开幕，习近平主席出席开幕式并发表主旨演讲。他强调顺应时代潮流，坚持开放共赢，宣布中国扩大开放新的重大举措。央视网特提炼出演讲重点，各方就主旨演讲的解读，以飨读者。停止录音                                                            |
            | 启动语记                | 用语记帮我做记录            | 科大讯飞股份有限公司成立于1999年，是一家专业从事智能语音及语言技术、人工智能技术研究，软件及芯片产品开发，语音信息服务及电子政务系统集成的国家级骨干软件企业。2008年，科大讯飞在深圳证券交易所挂牌上市，股票代码：002230。停止记录                                                         |
            | 打开语音笔记              | 打开语记开始录音            | 人工智能主要分为计算智能、感知智能、认知智能。计算智能，即机器“能存会算”的能力；感知智能，即机器具有“能听会说、能看会认”的能力，主要涉及语音合成、语音识别、图像识别、多语种语音处理等技术；认知智能，即机器具有“能理解会思考”的能力，主要涉及教育评测、知识服务、智能客服、机器翻译等技术。关闭语记                            |
            | 打开语音记录              | 用语记帮我做记录            | 科大讯飞作为中国智能语音与人工智能产业领导者，在语音合成、语音识别、口语评测、自然语言处理等多项技术上拥有国际领先的成果。科大讯飞是我国唯一以语音技术为产业化方向的“国家863计划成果产业化基地”、“国家规划布局内重点软件企业”、“国家高技术产业化示范工程”，并被原信息产业部确定为中文语音交互技术标准工作组组长单位，牵头制定中文语音技术标准。关闭语记 |
            | 打开语音转文字             | 打开语记开始录音            | 博鳌亚洲论坛上“一带一路” 成为人们聚焦的一大主题。在4月9号以物流为主题的分论坛上，来自全球的物流业代表就“一带一路”给国际贸易市场带来的变化和机遇展开了讨论。关闭语记                                                                                            |

    @ExtraCase  @Dictionary  @disable
    场景大纲: 汉语词典-查询词语
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【汉语词典】技能已打开

        # 模拟用户说出【打开汉语词典】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开汉语词典】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【汉语词典】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【一马当先是什么意思】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【退出】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 一马当先是什么意思     |

    @ExtraCase  @WordsMeaning
    场景大纲: 词语解释-解释词语
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【词语解释】技能已打开

        # 模拟用户说出【一马当先是什么意思】
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
            | voice_content | answer      | template_type | main_title  | sub_title | text_field |
            | 一马当先是什么意思     | 原指作战时策马冲锋在前 | BodyTemplate1 | 一马当先     | yī mǎ dāng xiān   | 原指作战时策马冲锋在前     |
            | 魑魅魍魉是啥意思      | 指各种各样的坏人    | BodyTemplate1 | 魑魅魍魉     | chī mèi wǎng liǎng   | 指各种各样的坏人     |
            | 怎么解释词语风马牛不相及  | 比喻事物彼此毫不相干  | BodyTemplate1 | 风马牛不相及     | fēng mǎ niú bù xiāng jí   | 比喻事物彼此毫不相干     |

    @ExtraCase  @DairyEnglish  @disable
    场景大纲: 每日英语-查询词语
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【每日英语】技能已打开

        # 模拟用户说出【打开每日英语】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开每日英语】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【英文】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【打开每日英语】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【每日英语已结束】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 打开每日英语        |

    @ExtraCase  @Encyclopedia
    场景大纲: 百科问答-查询问题
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【百科问答】技能已打开

        # 模拟用户说出【恐龙为什么会灭绝】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | template_type  | main_title  |
            | 恐龙为什么会灭绝| BodyTemplate1  | 恐龙为什么会灭绝|
            | 天为什么是蓝色的| BodyTemplate1  | 天为什么是蓝色的|
            | 为什么焰火是绚丽多彩的| BodyTemplate1  | 为什么焰火是绚丽多彩的|
            | 2022年冬奥会在哪举办  | BodyTemplate1  | 2022年冬奥会在哪举办 |

    @ExtraCase  @BodyExercise  @disable
    场景: 广播操
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广播操】技能已打开

        # 模拟用户说出【广播体操】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开广播操】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【慢的】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【慢的】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【慢的】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【退出】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Bible  @disable
    场景大纲: 圣经
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【圣经】技能已打开

        # 模拟用户说出【打开每日英语】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开圣经】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【圣经】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【播放圣经】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【播放圣经】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【创世纪】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【第一章】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<chapter>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【感谢使用】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content | chapter |
            | 创世纪           | 第一章     |

    @ExtraCase  @FiveMinuteExercise  @disable
    场景: 五分钟锻炼
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【五分钟锻炼】技能已打开

        # 模拟用户说出【五分钟锻炼】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开五分钟锻炼】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【平板支撑】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【平板支撑】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【轻量级】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【轻量级】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功


        # 模拟用户说出【退出】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @CoinTossing  @disable
    场景: 抛硬币
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【抛硬币】技能已打开

        # 模拟用户说出【我要抛硬币】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要抛硬币】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【一枚亮晶晶的硬币准备好了】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【抛硬币】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【抛】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【面】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【再抛一次】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【再抛一次】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【面】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【退出】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【记得再来】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Alerts
    场景大纲: 设置闹钟/提醒-设置闹钟成功-没有content什么都不显示
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午八点提醒我】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】为None
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好<tts_content>的闹钟         |
            | 好的，交给我吧，我会在<tts_content>提醒你     |
            | 已帮你定好<tts_content>的闹钟，我会准时提醒你 |
            | 没问题，已帮你把闹钟设置到<tts_content>       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【<scheduled_time>】

        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content                    | tts_content            | scheduled_time | template_type | title | text_field |  sub_text_field |
            | 明天上午八点提醒我               | 明天上午八点            | 00:00:00        | BodyTemplate3 | 闹钟  | 08:00      | None            |
            | 明天上午6点叫我                   | 明天上午6点            | 22:00:00        | BodyTemplate3 | 闹钟  | 6:00am     | None            |
            | 设置每月25号晚上8点的闹钟        | 每月25日晚上8点        | 12:00:00        | BodyTemplate3 | 闹钟  | 20:00      | None            |
            | 设置每年4月1号22点整的提醒       | 每年4月01日晚上10点    | 14:00:00        | BodyTemplate3 | 闹钟  | 22:00      | None            |
            | 帮我设置一个每天上午九点十分的闹钟| 每天上午9点10分       | 01:10:00        | BodyTemplate3 | 闹钟  | 09:10      | None            |
            | 帮我设置一个工作日上午10:15的提醒 | 每个工作日上午10点15分 | 02:15:00       | BodyTemplate3 | 闹钟  | 10:15      | None            |
            | 定个法定工作日上午10点15分的闹钟  | 每个工作日上午10点15分 | 02:15:00       | BodyTemplate3 | 闹钟  | 10:15      | None            |
            | 订个节假日上午11点一刻的闹钟     | 法定节假日中午11点15分  | 03:15:00       | BodyTemplate3 | 闹钟  | 11:15      | None            |
            | 定一个法定节假日上午11点一刻的闹钟 | 法定节假日中午11点15分| 03:15:00       | BodyTemplate3 | 闹钟  | 11:15      | None            |
            | 订一个周末下午1点半的提醒        | 周末下午1点半            | 05:30:00       | BodyTemplate3 | 闹钟  | 13:30      | None            |
            | 设个每周五下午2:45的闹钟         | 每周五下午2点45分        | 06:45:00       | BodyTemplate3 | 闹钟  | 14:40      | None            |
            | 设一个周一至周五下午3:50的提醒  | 每周一到周五下午3点50分   | 07:50:00       | BodyTemplate3 | 闹钟  | 15:50      | None            |
            | 帮我设置12月1日上午8点的闹钟    | 12月1日上午8点           | 00:00:00        | BodyTemplate3 | 闹钟   | 08:00     | None            |
            | 帮我设置今天晚上11点的提醒      | 今天晚上11点             | 15:00:00        | BodyTemplate3 | 闹钟   | 23:00     | None            |

    @ExtraCase  @Alerts
    场景大纲: 设置闹钟/提醒-设置闹钟成功-显示content
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午八点叫我起床】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好<tts_content><content>的闹钟         |
            | 好的，交给我吧，我会在<tts_content>提醒你<content>     |
            | 好的，我会在<tts_content>提醒你<content>                |
            | 已帮你定好<tts_content>的闹钟，我会准时提醒你<content> |
            | 没问题，已帮你把<content>闹钟设置到<tts_content>       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【<scheduled_time>】

        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content                                    | tts_content            | content | scheduled_time| template_type | title | text_field |  sub_text_field |
            | 明天上午八点提醒我去看电影                       | 明天上午八点            | 去看电影 |  00:00:00        | BodyTemplate3 | 闹钟  | 08:00      | 去看电影       |
            | 明天提醒我上午八点去看电影                       | 明天上午8点            | 去看电影 |  00:00:00        | BodyTemplate3 | 闹钟  | 08:00      | 去看电影       |
            | 明天上午6点叫我起床                               | 明天上午6点            | 起床   |   22:00:00        | BodyTemplate3 | 闹钟  | 6:00am     | 起床            |
            | 每月25号晚上8点我要去玩                           | 每月25日晚上8点        | 去玩   | 12:00:00        | BodyTemplate3 | 闹钟  | 20:00      | 去玩            |
            | 设置每年4月1号22点整睡觉的提醒                   | 每年4月01日晚上10点    | 睡觉   | 14:00:00        | BodyTemplate3 | 闹钟  | 22:00      | 睡觉            |
            | 设置每天上午九点十分睡觉的闹钟                   | 每天上午9点10分         | 睡觉   | 01:10:00        | BodyTemplate3 | 闹钟  | 09:10      | 睡觉            |
            | 帮我设置一个工作日上午10:15起床的提醒            | 每个工作日上午10点15分 | 起床   | 02:15:00       | BodyTemplate3 | 闹钟  | 10:15      | 起床            |
            | 帮我设置一个法定工作日上午10点15分吃早饭的闹钟  | 每个工作日上午10点15分 | 吃早饭 | 02:15:00       | BodyTemplate3 | 闹钟  | 10:15      | 吃早饭            |
            | 提醒我节假日上午11点一刻看电影                   | 法定节假日中午11点15分  | 看电影 | 03:15:00       | BodyTemplate3 | 闹钟  | 11:15      | 看电影            |
            | 定一个法定节假日上午11点一刻去公园的闹钟        | 法定节假日中午11点15分  | 去公园 | 03:15:00       | BodyTemplate3 | 闹钟  | 11:15      | 去公园            |
            | 订一个周末下午1点半看电影的提醒                  | 周末下午1点半            | 看电影 | 05:30:00       | BodyTemplate3 | 闹钟  | 13:30      | 看电影            |
            | 设个每周五下午2:45看电影的闹钟                   | 每周五下午2点45分        | 看电影 | 06:45:00       | BodyTemplate3 | 闹钟  | 14:40      | 看电影            |
            | 设一个周一至周五下午3:50看电影的提醒             | 每周一到周五下午3点50分 | 看电影 | 07:50:00       | BodyTemplate3 | 闹钟  | 15:50      | 看电影            |
            | 帮我设置12月1日上午8点看电影的闹钟               | 12月1日上午8点           | 看电影 | 00:00:00        | BodyTemplate3 | 闹钟   | 08:00     | 看电影            |
            | 帮我设置今天晚上11点看电影的提醒                 | 今天晚上11点             | 看电影 | 15:00:00        | BodyTemplate3 | 闹钟   | 23:00     | 看电影            |
            | 明天中午提醒我吃饭                                | 明天中午12点           | 吃饭   | 04:00:00        | BodyTemplate3 | 闹钟   | 12:00     | 吃饭              |

    @ExtraCase  @Alerts
    场景大纲: 设置闹钟/提醒-用户表述不清楚，追问时间，设置闹钟成功
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【提醒我吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【中午十二点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<time>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好<tts_content><content>的闹钟         |
            | 好的，交给我吧，我会在<tts_content>提醒你<content>     |
            | 已帮你定好<tts_content>的闹钟，我会准时提醒你<content> |
            | 没问题，已帮你把<content>闹钟设置到<tts_content>       |
            | 好的，我会在<tts_content>提醒你<content>                |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【<scheduled_time>】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content            | asked                       | time                 | scheduled_time | tts_content       | content |
            | 提醒我吃饭                | 好的，你希望在几点收到提醒  | 明天中午十二点      | 04:00:00        | 明天中午12点      | 吃饭    |
            | 叫我开会                   | 好的，你希望在几点收到提醒 | 明天早上8点         | 00:00:00        | 明天早上8点       | 开会    |
            | 我要回公司                 | 好的，你希望在几点收到提醒 | 晚上六点            |  10:00:00       | 晚上6点            | 开会    |
            | 晚上我要开会              | 好的，你希望把闹钟定在几点  | 今晚六点            |  10:00:00       | 今天晚上6点        |  开会  |
            | 设置闹钟                   | 好的，你希望把闹钟定在几点  | 每天晚上六点       |  10:00:00       | 每天晚上6点        |        |
            | 设置提醒                   | 好的，你希望在几点收到提醒  | 每月10号早上九点  |  01:00:00        | 每月10日上午9点    |        |
            | 帮我设置一个闹钟          | 好的，你希望把闹钟定在几点  | 每年2月20日晚上六点|  10:00:00       | 每年2月20日晚上6点 |        |
            | 帮我设置一个提醒          | 好的，你希望在几点收到提醒  | 每周一早上九点     |  01:00:00        | 每周一上午9点      |        |
            | 帮我设置一个晚上的闹钟    | 好的，你希望把闹钟定在几点  | 明晚六点           |  10:00:00        | 明天晚上6点        |        |
            | 帮我设置一个早上的提醒    | 好的，你希望在几点收到提醒  | 每天凌晨2点        |  18:00:00        | 每天凌晨2点        |        |
            | 帮我设置一个去看电影的闹钟| 好的，你希望把闹钟定在几点  | 节假日上午8点      | 00:00:00         | 法定节假日上午8点 | 看电影 |
            | 帮我设置一个去看电影的提醒| 好的，你希望在几点收到提醒  | 工作日上午8点      | 00:00:00         | 每个工作日上午8点 | 看电影 |
            | 设置晚上的闹钟             | 好的，你希望把闹钟定在几点  | 周一到周三晚上9点 |  13:00:00        | 周一到周三晚上9点 |        |
            | 设置明天早上的提醒         | 好的，你希望在几点收到提醒  | 周末凌晨3点       |  19:00:00        | 周末凌晨3点        |        |
            | 明天早上我要回公司        | 好的，你希望把闹钟定在几点   | 7点                |  23:00:00        | 明天早上7点        |        |
            | 提醒我明天晚上起床        | 好的，你希望在几点收到提醒   | 9点                |  01:00:00        | 明天上午9点        | 起床   |

    @ExtraCase  @Alerts
    场景: 设置闹钟/提醒-闹钟时间到响铃
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午十点提醒我回家吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【明天上午十点提醒我回家吃饭】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好明天上午十点回家吃饭的闹钟         |
            | 好的，交给我吧，我会在明天上午十点提醒你回家吃饭     |
            | 已帮你定好明天上午十点的闹钟，我会准时提醒你回家吃饭 |
            | 没问题，已帮你把回家吃饭闹钟设置到明天上午十点       |
            | 好的，我会在明天上午十点提醒你回家吃饭                |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【02:00】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端下行通道回复的directive为【TemplateRuntime】，【RenderTemplate】
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Alerts
    场景大纲: 设置闹钟/提醒-闹钟响铃时停止闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【明天上午十点提醒我回家吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【明天上午十点提醒我回家吃饭】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts |
            | 好的，已为你设置好明天上午十点回家吃饭的闹钟         |
            | 好的，交给我吧，我会在明天上午十点提醒你回家吃饭     |
            | 已帮你定好明天上午十点的闹钟，我会准时提醒你回家吃饭 |
            | 没问题，已帮你把回家吃饭闹钟设置到明天上午十点       |
            | 好的，我会在明天上午十点提醒你回家吃饭                |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【SetAlert】，参数【scheduledTime】为【02:00】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredBackground】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

#        那么      iFlyOS服务端下行通道回复的directive为【TemplateRuntime】，【RenderTemplate】
        那么      iFlyOS服务端下行通道回复的directive为【Alerts】，【DeleteAlert】
        当        iFlyOS客户端发送event【Alerts】，【DeleteAlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 停止闹钟       |
            | 闹钟停止       |
            | 关闭闹钟       |
            | 闹钟关闭       |
            | 暂停闹钟       |
            | 闹钟暂停       |
            | 退出闹钟       |
            | 闹钟退出       |
            | 闭嘴闹钟       |
            | 闹钟闭嘴       |
            | 别响了闹钟     |
            | 闹钟别响了     |
            | 停止提醒       |
            | 提醒停止       |
            | 关闭提醒       |
            | 提醒关闭       |
            | 暂停提醒       |
            | 提醒暂停       |
            | 退出提醒       |
            | 提醒退出       |
            | 闭嘴提醒       |
            | 提醒闭嘴       |
            | 别响了提醒     |
            | 提醒别响了     |
            | 停止提醒       |
            | 提醒停止       |
            | 暂停           |
            | 停一下         |
            | 暂停播放       |
            | 停止播放       |
            | 退出播放       |
            | 退出           |
            | 关闭           |
            | 取消           |
            | 停止           |

    @ExtraCase  @Alerts
    场景大纲: 设置闹钟/提醒-查询闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【我有几个闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【ListTemplate1】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content|
            | 你有1个闹钟，是今天晚上9点 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我有几个闹钟   |
            | 我有几个提醒   |
            | 我有闹钟吗     |
            | 我有提醒吗     |
            | 我有多少闹钟   |
            | 我有多少提醒   |
            | 我设了几个闹钟 |
            | 我设了几个提醒 |
            | 我设了哪些闹钟 |
            | 我设了哪些提醒 |

    @ExtraCase  @Alerts @disable
    场景大纲: 设置闹钟/提醒-删除单次闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【删除晚上九点钟的闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content     |
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
            | 删除晚上九点钟的提醒    |
            | 取消晚上九点钟的闹钟    |
            | 取消晚上九点钟的提醒    |
            | 帮我删除晚上九点钟的闹钟  |
            | 帮我删除晚上九点钟的提醒  |
            | 帮我取消晚上九点钟的闹钟  |
            | 帮我取消晚上九点钟的提醒  |
            | 晚上九点钟的闹钟不用提醒我|
            | 晚上九点的闹钟不用叫我   |
            | 晚上九点钟的闹钟不要叫我 |
            | 晚上九点钟不用提醒我     |
            | 晚上九点不用叫我         |
            | 晚上九点钟不要叫我       |
            | 晚上九点钟的闹钟取消了   |
            | 晚上九点钟的提醒取消了   |
            | 删除开会的闹钟    |
            | 删除开会的提醒    |
            | 取消开会的闹钟    |
            | 取消开会的提醒    |
            | 帮我删除开会的闹钟  |
            | 帮我删除开会的提醒  |
            | 帮我取消开会的闹钟  |
            | 帮我取消开会的提醒  |
            | 开会的闹钟不用提醒我|
            | 开会的闹钟不用叫我  |
            | 开会的闹钟不要叫我 |
            | 开会不用提醒我     |
            | 开会不用叫我       |
            | 开会不要叫我       |
            | 开会的闹钟取消了   |
            | 开会的提醒取消了   |

    @ExtraCase  @Alerts @disable
    场景大纲: 设置闹钟/提醒-删除循环闹钟
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开
        假如      iFlyOS客户端已设置【每天晚上九点提醒我吃饭】的闹钟

        # 模拟用户说出【删除晚上九点钟的闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content     |
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
            | 删除每天晚上九点钟的闹钟    |
            | 删除每天晚上九点钟的提醒    |
            | 取消每天晚上九点钟的闹钟    |
            | 取消每天晚上九点钟的提醒    |
            | 帮我删除每天晚上九点钟的闹钟  |
            | 帮我删除每天晚上九点钟的提醒  |
            | 帮我取消每天晚上九点钟的闹钟  |
            | 帮我取消每天晚上九点钟的提醒  |
            | 每天晚上九点钟的闹钟不用提醒我|
            | 每天晚上九点的闹钟不用叫我   |
            | 每天晚上九点钟的闹钟不要叫我 |
            | 每天晚上九点钟不用提醒我     |
            | 每天晚上九点不用叫我         |
            | 每天晚上九点钟不要叫我       |
            | 每天晚上九点钟的闹钟取消了   |
            | 每天晚上九点钟的提醒取消了   |

    @ExtraCase  @Alerts
    场景大纲: 设置闹钟/提醒-清空闹钟列表
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 删除所有提醒        |
            | 删除全部闹钟        |
            | 删除全部提醒        |
            | 清空闹钟列表        |
            | 清空提醒列表        |

    @ExtraCase  @Timers
    场景大纲: 计时器-设置倒计时
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【Alerts】，【AlertStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#
        当        iFlyOS客户端发送event【Alerts】，【AlertEnteredForeground】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【Alerts】，【AlertStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | answer | template_type | title | text_field                |  sub_text_field |
            | 一分钟倒计时        | 1分钟    | BodyTemplate3 | 倒计时 | 好的，我会在1分钟后提醒你 | 设置成功          |
            | 帮我计时三分钟       | 3分钟    | BodyTemplate3 | 倒计时 | 好的，我会在3分钟后提醒你 | 设置成功          |
            | 帮我倒计时五分钟      | 5分钟    | BodyTemplate3 | 倒计时 | 好的，我会在5分钟后提醒你 | 设置成功          |
            | 帮我倒数二十秒钟      | 20秒    | BodyTemplate3 | 倒计时 | 好的，我会在20秒后提醒你 | 设置成功          |

    @ExtraCase  @Timers
    场景大纲: 计时器-计时时间不足15秒
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器】技能已打开

        # 模拟用户说出【计时十秒钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我有几个闹钟】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【你没有设置闹钟】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | answer         |
            | 计时十秒钟         | 暂时不支持15秒以内的倒计时 |

    @ExtraCase  @Timers  @disable
    场景大纲: 计时器-停止计时
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器】技能已打开

         # 模拟用户说出【计时一分钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【计时一分钟】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【1分钟】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【停止计时】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【Alerts】，【Alert】，参数【scheduledTime】为【？】
        当        iFlyOS客户端发送event【Alerts】，【AlertSucceeded】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】Delete
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 停止计时          |
            | 关闭计时          |
            | 退出计时          |
            | 退出计时          |

    @ExtraCase  @Timers  @disable
    场景大纲: 计时器-询问计时时间
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器】技能已打开

         # 模拟用户说出【计时一分钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【计时一分钟】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【一分钟】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【停止计时】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【Alerts】，【Alert】，参数【scheduledTime】为【？】
#        当        iFlyOS客户端发送event【Alerts】，【SetAlertSucceeded】
#        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】Delete
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 计时多久了         |
            | 还剩多久          |
            | 过了多久了         |

    @ExtraCase  @AudioPlayer  @disable
    场景: 音乐点播-播放流式音乐成功，从IDLE状态切换到PLAY状态，从PLAY状态切换到BUFFER_UNDERRUN状态，从BUFFER_UNDERRUN状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器列表不为空
        那么      iFlyOS服务端音乐播放器列表都是【周杰伦】的歌
        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-播放链接音乐成功，从IDLE状态切换到PLAY状态，从PLAY状态切换到BUFFER_UNDERRUN状态，从BUFFER_UNDERRUN状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的稻香】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦，稻香                     |
            | 现在带来的是周杰伦的稻香        |
            | 小飞也很喜欢这首歌，一起唱起来吧  |
            | 来，一起听周杰伦的稻香          |
            | 好的，一起来听周杰伦的稻香      |
            | 一起来听听周杰伦的稻香          |

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

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表都是【周杰伦】的歌
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-播放中被对话打断再恢复，从PLAY状态切换到PAUSED状态，从PAUSED状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【你好】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【你好】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【60000】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-流式播放上一个歌播放直到结束，下一个开始播放，从PLAY状态切换到FINISHED状态，从FINISHED状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放流式音乐

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【ENQUEUE】，带Binary Audio Attachment

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播放上一个歌播放直到结束，下一个开始播放，从PLAY状态切换到FINISHED状态，从FINISHED状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放链接音乐

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

        当       iFlyOS客户端音乐播放器定位到【120000】
        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【ENQUEUE】

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表不为空
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-获取音乐信息
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复音乐信息
        当        iFlyOS客户端发送event【AudioPlayer】，【StreamMetadataExtracted】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-清空播放队列并停止播放，从PLAY状态切换到STOPPED状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【ClearQueue】，参数【clearBehavior】为【CLEAR_ALL】
        # 回复音乐信息
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackQueueCleared】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-清空播放队列但不停止当前音乐播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【ClearQueue】，参数【clearBehavior】为【CLEAR_ENQUEUED】
        # 回复音乐信息
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackQueueCleared】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @StoryTelling
    场景大纲: 评书点播-随机搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 我要听评书         |
            | 播放评书          |
            | 放一个评书         |

    @ExtraCase  @StoryTelling
    场景大纲: 评书点播-根据表演者搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【评书点播】技能已打开

        # 模拟用户说出【我要听单田芳的评书】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听单田芳的评书     | 单田芳    |
            | 播放单田芳的评书      | 单田芳    |

    @ExtraCase  @StoryTelling
    场景大纲: 评书点播-根据评书名称搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【评书点播】技能已打开

        # 模拟用户说出【我要听三国演义】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听三国演义      | 三国演义   |
            | 播放隋唐演义        | 隋唐演义   |

    @ExtraCase  @StoryTelling
    场景大纲: 评书点播-根据演员名称+评书名称搜索评书
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【评书点播】技能已打开

        # 模拟用户说出【我要听三国演义】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】和【<answer2>】
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

        例子: 语料
            | voice_content | answer | answer2 |
            | 我要听单田芳的三国演义   | 三国演义   | 单田芳     |
            | 播放单田芳隋唐演义     | 隋唐演义   | 单田芳     |

    @ExtraCase  @Drama
    场景大纲: 戏曲点播-根据类别搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【我要听白蛇传】
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

        例子: 语料
            | voice_content |
            | 我要听京剧         |
            | 播放黄梅戏         |

    @ExtraCase  @Drama
    场景大纲: 戏曲点播-根据戏曲名称+类别搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【我要听京剧白蛇传】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听京剧白蛇传      | 白蛇传    |
            | 我要听白蛇传的越剧     | 白蛇传    |
            | 播放豫剧霸王别姬      | 霸王别姬   |
            | 播放霸王别姬的黄梅戏    | 霸王别姬   |

    @ExtraCase  @Drama
    场景大纲: 戏曲点播-根据演员名称+类别搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【播放梅兰芳的京剧】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听于魁智的京剧     | 于魁智    |
            | 播放梅兰芳的京剧      | 梅兰芳    |

    @ExtraCase  @Drama
    场景大纲: 戏曲点播-根据戏曲名称+演员名称搜索戏曲
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【戏曲点播】技能已打开

        # 模拟用户说出【我要听于魁智的空城计】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        #服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听于魁智的空城计    | 空城计    |
            | 播放梅兰芳的霸王别姬    | 霸王别姬   |

    @ExtraCase  @Sketch_CrossTalk
    场景大纲: 相声小品-随机播放相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 我要听相声         |
            | 播放小品          |

    @ExtraCase  @Sketch_CrossTalk
    场景大纲: 相声小品-根据演员名称搜索相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【相声小品】技能已打开

        # 模拟用户说出【我要听陈佩斯的小品】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听陈佩斯的小品     | 陈佩斯    |
            | 播放苗阜王声的相声     | 苗阜王声   |

    @ExtraCase  @Sketch_CrossTalk
    场景大纲: 相声小品-根据名称搜索相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【相声小品】技能已打开

        # 模拟用户说出【我要听小品吃面条】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听小品吃面条      | 吃面条    |
            | 我要听吃面条        | 吃面条    |
            | 播放相声满腹经纶      | 满腹经纶   |
            | 播放满腹经纶        | 满腹经纶   |

    @ExtraCase  @Sketch_CrossTalk
    场景大纲: 相声小品-根据演员+名称搜索相声/小品
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【相声小品】技能已打开

        # 模拟用户说出【我要听陈佩斯的主角与配角】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】和【<answer2>】
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

        例子: 语料
            | voice_content | answer | answer2 |
            | 我要听陈佩斯的主角与配角  | 主角与配角  | 陈佩斯     |
            | 播放苗阜王声的满腹经纶   | 满腹经纶   | 苗阜王声    |

    @ExtraCase  @Novel
    场景大纲: 有声小说-随机播放小说
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放小说】
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

        例子: 语料
            | voice_content |
            | 播放小说          |
            | 我要听小说        |
            | 最近有什么小说    |
            | 有什么小说        |
            | 播放有声小说      |
            | 播放有声书        |
            | 我要听有声书      |
            | 最近有什么有声书  |
            | 有什么有声书      |
            | 来个小说          |
            | 来一个小说        |
            | 小说来一个        |

    @ExtraCase  @Novel
    场景大纲: 有声小说-按书名点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放逆战】
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

        例子: 语料
            | voice_content | tts_content |
            | 播放逆战       | 为你播放叶泽坤的逆战第1集 |
            | 播放小说平凡的世界 | 为你播放路遥的平凡的世界|
            | 播放鸡零狗碎的青春小说 | 为你播放南宫浩的鸡零狗碎的青春|
            | 我要听男人三十   | 为你播放王小天的男人三十|
            | 我想听平凡的世界   | 为你播放路遥的平凡的世界|
            | 逆战来一个      | 为你播放叶泽坤的逆战第1集 |

    @ExtraCase  @Novel
    场景大纲: 有声小说-按作者点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放叶泽坤的小说】
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

        例子: 语料
            | voice_content | tts_content |
            | 路遥的小说     | 为你播放路遥的|
            | 播放叶泽坤的小说 | 为你播放叶泽坤的|
            | 我想听路遥的小说 | 为你播放路遥的|
            | 我要听老舍的小说 | 为你播放老舍的 |
            | 叶泽坤的小说来一个|为你播放叶泽坤的|

    @ExtraCase  @Novel
    场景大纲: 有声小说-按播音员点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放弋凡播的小说】
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

        例子: 语料
            | voice_content | tts_content|
            | 播放弋凡播的小说 |为你播放弋凡的中国是部金融史（二）第1集|
            | 我要听姐姐的小说 | 为你播放姐姐的瘦金笔下乱繁华第1集|
            | 姐姐的小说来一个 | 为你播放姐姐的瘦金笔下乱繁华第1集|

    @ExtraCase  @Novel
    场景大纲: 有声小说-按类型/标签点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放武侠小说】
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

        例子: 语料
            | voice_content |
            | 播放武侠小说   |
            | 我要听悬疑小说 |
            | 我想听言情小说 |
            | 历史小说来一个 |
            | 来一个文学小说 |

    @ExtraCase  @Novel
    场景大纲: 有声小说-按书名+集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放逆战第二集】
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

        例子: 语料
            | voice_content | tts_content|
            | 逆战第三集     | 为你播放叶泽坤的逆战第3集|
            | 播放逆战第二集 | 为你播放叶泽坤的逆战第2集|
            | 播放逆战的第二集 | 为你播放叶泽坤的逆战第2集|
            | 我想听平凡的世界第2集 | 为你播放路遥的平凡的世界|
            | 我要听诡墓的第3集 |为你播放小小青蛇的诡墓第3集|
            | 我要听如果青春只有青没有春的第20集 |为你播放古保祥的如果青春只有青没有春第20集|

    @ExtraCase  @Novel
    场景大纲: 有声小说-按书名+上下部点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放平凡的世界上】
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

        例子: 语料
            | voice_content   | tts_content|
            | 播放平凡的世界上 | 为你播放路遥的平凡的世界（上）第1集|
            | 我要听平凡的世界中 | 为你播放路遥的平凡的世界（中）第1集|
            | 我想听平凡的世界下 | 为你播放路遥的平凡的世界（下）第1集|

    @ExtraCase  @Novel
    场景大纲: 有声小说-按作者+书名点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放叶泽坤的逆战】
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

        例子: 语料
            | voice_content | tts_content|
            | 叶泽坤的小说逆战 | 为你播放叶泽坤的逆战第1集|
            | 播放叶泽坤的逆战 | 为你播放叶泽坤的逆战第1集|
            | 陈小平的回水滩 | 为你播放陈小平的回水滩第1集|
            | 我想听漫漫步归的女配修仙记 | 为你播放漫漫步归的女配修仙记第1集|
            | 我想看夏栀的与星同眠 | 为你播放夏栀的与星同眠第1集|

    @ExtraCase  @Novel
    场景大纲: 有声小说-按播音员+书名点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放姐姐的瘦金笔下乱繁华】
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

        例子: 语料
            | voice_content | tts_content |
            | 播放姐姐的瘦金笔下乱繁华 | 为你播放姐姐的瘦金笔下乱繁华第1集|
            | 播放弋凡播的小说中国是部金融史|为你播放弋凡的中国是部金融史（二）第1集|

    @ExtraCase  @Novel
    场景大纲: 有声小说-按作者+书名+集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放叶泽坤的逆战第五集】
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

        例子: 语料
            | voice_content | tts_content |
            | 播放叶泽坤的逆战第五集 | 为你播放叶泽坤的逆战第5集 |
            | 林敏的暗示心理学第10集 | 为你播放林敏的暗示心理学第10集|
            | 我想听北极苍狼的墓中王国第十集| 为你播放北极苍狼的墓中王国第10集 |

    @ExtraCase  @Novel
    场景大纲: 有声小说-按书名+上下部+集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放平凡的世界上第2集】
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

        例子: 语料
            | voice_content         | tts_content|
            | 播放平凡的世界上第2集 | 为你播放路遥的平凡的世界（上）第2集|
            | 我要听平凡的世界中第3集 | 为你播放路遥的平凡的世界（中）第3集|
            | 我想听平凡的世界下第4集 | 为你播放路遥的平凡的世界（下）第4集|

    @ExtraCase  @Novel
    场景大纲: 有声小说-按作者+书名+上下部+集数点播
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放路遥的平凡的世界上第2集】
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

        例子: 语料
            | voice_content         | tts_content|
            | 播放路遥的平凡的世界上第2集 | 为你播放路遥的平凡的世界（上）第2集|
            | 我想听路遥的平凡的世界中第3集 | 为你播放路遥的平凡的世界（中）第3集|
            | 我要听路遥的平凡的世界下第4集 | 为你播放路遥的平凡的世界（下）第4集|

    @ExtraCase  @Novel
    场景大纲: 有声小说-书名搜索不到，提示“我还没有找到这本小说，试试换一本吧”
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放小说豪门冷婚】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content   | tts_content|
            | 播放小说豪门冷婚 | 我还没有找到这本小说，试试换一本吧|

    @ExtraCase  @Novel
    场景大纲: 有声小说-集数搜索不到，提示“我还没有找到这本小说，试试换一本吧”
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【有声小说】技能已打开

        # 模拟用户说出【播放逆战第50集】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content  | tts_content|
            | 播放逆战第50集 | 没有找到这一集，换一集试试吧|

    @ExtraCase  @Radio
    场景大纲: 广播电台-随机搜索广播电台
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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


        例子: 语料
            | voice_content |
            | 我要听电台         |
            | 我要听广播         |
            | 我要听广播电台       |
            | 我要听收音机        |
            | 听会电台          |
            | 播放广播          |
            | 播放电台          |

    @ExtraCase  @Radio
    场景大纲: 广播电台-根据类别搜索广播电台
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广播电台】技能已打开

        # 模拟用户说出【我要听电台】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听经济电台       | 经济     |
            | 我要听体育电台       | 体育     |
            | 我要听综合电台       | 综合     |
            | 我要听交通电台       | 交通     |
            | 我要听音乐电台       | 音乐     |
            | 我要听科技电台       | 科技     |
            | 我要听农业电台       | 农       |
            | 我要听曲艺电台       | 曲艺     |

    @ExtraCase  @Radio
    场景大纲: 广播电台-根据关键词搜索广播电台
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广播电台】技能已打开

        # 模拟用户说出【我要听电台】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<answer>】
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

        例子: 语料
            | voice_content | answer |
            | 我要听中央广播电台     | 中央     |

    @ExtraCase  @WhiteNoise
    场景大纲: 白噪音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【白噪音】技能已打开

        # 模拟用户说出【打开白噪音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
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

        例子: 语料
            | voice_content |
            | 白噪音         |
            | 打开白噪音     |

    @ExtraCase  @EyeExercise
    场景大纲: 眼保健操
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【眼保健操】技能已打开

        # 模拟用户说出【打开眼保健操】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
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

        例子: 语料
            | voice_content |
            | 眼保健操         |
            | 打开眼保健操     |

    @ExtraCase  @MeditationMoments
    场景大纲: 冥想时刻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        例子: 语料
            | voice_content |
            | 冥想时刻        |
            | 打开冥想时刻   |

    @ExtraCase  @SleepMusic
    场景大纲: 好好睡觉
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【好好睡觉】技能已打开

        # 模拟用户说出【打开好好睡觉】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
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

        例子: 语料
            | voice_content |
            | 好好睡觉        |
            | 打开好好睡觉   |

    @ExtraCase  @PrenatalEducationMusic
    场景大纲: 越听越聪明
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【越听越聪明】技能已打开

        # 模拟用户说出【越听越聪明】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
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

        例子: 语料
            | voice_content |
            | 越听越聪明        |
            | 打开越听越聪明   |

    @ExtraCase  @OralComputingChallenge
    场景大纲: 口算挑战
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【口算挑战】技能已打开

        # 模拟用户说出【口算挑战】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【请回答】
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
            | tts_content         |
            | 回答正确             |
            | 正确答案是           |

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
            | 口算挑战       | 10        |
            | 打开口算挑战   | 20        |

    @ExtraCase  @PoetryChallenge
    场景大纲: 诗词挑战
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content                 |
            | 回答正确                     |
            | 回答错误，上一题的正确答案是|

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 你一题也没有答对 |
            | 全都答对了       |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | asked | answered   |
            | 诗词挑战       | 回答诗句  | 但愿人长久 |
            | 打开诗词挑战   | 回答诗人  | 杜甫       |

    @ExtraCase  @MultiplicationTable
    场景大纲: 九九乘法表
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content    |
            | 答对了          |
            | 这道题正确答案是|

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
            | voice_content  |
            | 练习九九乘法表   |
            | 打开九九乘法表   |
            | 打开练习九九乘法表 |

    @ExtraCase  @TalkingLittleParrot
    场景大纲: 会说话的小鹦鹉
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | tts_content    |
            | 我变了一个超有型的声音 |
            | 小鹦鹉变身成功         |
            | 小鹦鹉变身             |
            | 小鹦鹉变声成功         |
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
            | tts_content    |
            | 小鹦鹉已经调整了语速 |
            | 小鹦鹉变声成功       |
            | 小鹦鹉变速成功       |
            | 我的语速要变了哦     |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我不想玩了】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 今天玩的很开心，谢谢你啦，碰到有意思的东西，记得再教教我哟 |
            | 今天小鹦鹉真是收获满满，很开心跟你一起玩耍，再见啦       |
            | 小鹦鹉也要回窝休息啦，待会再玩吧                |
            | 时光一去不复回，期待下次再与你相会。              |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content      |
            | 会说话的小鹦鹉       |
            | 打开会说话的小鹦鹉   |

    @ExtraCase  @ChallengeWords
    场景大纲: 挑战单词
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【挑战单词】技能已打开

        # 模拟用户说出【打开挑战单词】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 欢迎来到挑战单词。游戏有四关，难度递增。我给你一个单词，你来猜这个单词的类型。准备好了对我说“开始游戏” |
            | 欢迎回到挑战单词。你可以了解玩法或开始挑战      |

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
            | 正确答案是      |
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
            | voice_content  |
            | 挑战单词        |
            | 打开挑战单词    |

    @ExtraCase  @MeditationMusic @disable
    场景大纲: 打开如意冥想音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<asked>】
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
            | voice_content    | asked |
            | 打开如意冥想音乐  | 下雨声 |
            | 进入如意冥想音乐  | 鸟叫声 |
            | 如意冥想音乐      | 海浪声 |
            | 打开如意冥想音乐  | 流水声 |

    @ExtraCase  @DairyEnglish
    场景大纲: 英语每日一句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

#        # 模拟用户说出【再来一个】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【再来一个】
#        那么      iFlyOS服务端回复状态为【200】成功
#
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】包含【<main_title>】，参数【subTile】包含【<sub_title>】，参数【textField】不为空
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | template_type  | main_title  | sub_title  |
            | 我要学英语      | BodyTemplate1  | 年          | 英语每日一句   |
            | 来个英语句子    | BodyTemplate1  | 年          | 英语每日一句   |
            | 学英语          | BodyTemplate1  | 年          | 英语每日一句   |
            | 来一句英语      | BodyTemplate1  | 年          | 英语每日一句   |
            | 每天都想学英语  | BodyTemplate1  | 年          | 英语每日一句   |
            | 我爱学英语      | BodyTemplate1  | 年          | 英语每日一句   |

    @ExtraCase  @MakeSentence
    场景大纲: 造句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【造句】技能已打开

        # 模拟用户说出【用鸦雀无声造句】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【title】为【<title>】，参数【textField】包含【<text_field>】，参数【subtextField】包含【<sub_text_field>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<text_field>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | template_type | title | text_field | sub_text_field |
            | 用鸦雀无声造句    | BodyTemplate3 | 造句  | 鸦雀无声     | 鸦雀无声      |
            | 用如果二字造句    | BodyTemplate3 | 造句  | 如果         | 如果          |
            | 用因为所以造个句子| BodyTemplate3 | 造句  | 因为         | 因为所以      |

    @ExtraCase  @CapitalInquiry
    场景大纲: 首都查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content             | tts_content | tts_content2|
            | 中国的首都在哪              | 中国的首都   | 北京          |
            | 美国的首都是不是洛杉矶      | 美国的首都   | 华盛顿        |
            | 北京是哪个国家的首都        | 中国的首都   | 北京          |
            | 华盛顿是不是首都城市        | 美国的首都   | 华盛顿        |
            | 华盛顿和纽约哪个是美国的首都| 美国的首都   | 华盛顿        |
            | 美国和中国的首都分别在哪    |美国首都是华盛顿|中国首都是北京|

    @ExtraCase  @AnimalSound  @disable
    场景大纲: 动物叫声
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【动物叫声】技能已打开

        # 模拟用户说出【学一下猪叫】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【猪是这样叫的】
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
            | voice_content  |
            | 学一下猪叫      |

    @ExtraCase  @ChildModel  @disable
    场景大纲: 儿童模式
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【儿童模式】技能已打开

        # 模拟用户说出【打开儿童模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已进入儿童模式，小朋友我们来聊天吧】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【关闭儿童模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【关闭儿童模式】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【已退出儿童模式】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 打开儿童模式    |

    @ExtraCase  @KinderMusic  @disable
    场景: 幼儿音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【幼儿音乐】技能已打开

        # 模拟用户说出【幼儿音乐】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【幼儿音乐】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Guangchangwu  @disable
    场景: 广场舞时刻
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【广场舞时刻】技能已打开

        # 模拟用户说出【广场舞时刻】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【广场舞时刻】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值设置正常范围11-89，不播放TTS只给值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 音量设为11     | 11   |
            | 音量设置为12   | 12   |
            | 音量调到89     | 89   |
            | 音量调节到88   | 88   |
            | 音量调节为89   | 89   |
            | 调节音量为87   | 87   |
            | 设置音量为86   | 86   |
            | 把音量设为11%  | 11   |
            | 把音量设置为12% | 12  |
            | 把音量调到89%   | 89  |
            | 把音量调节到88% | 88  |
            | 把音量设置为十二| 12   |
            | 将音量设置为20  | 20   |
            | 音量设到25      | 25   |
            | 把音量设到30    | 30   |
            | 将音量设到35    | 35   |
            | 请把音量设置为40| 40   |
            | 把音量设置为45吧| 45   |
            | 请帮我把音量设到50| 50   |
            | 请将音量设到55    | 55   |
            | 我想把音量调成60  | 60   |
            | 把音量调成65吧	 | 65   |
            | 请把音量调成70	 | 70   |
            | 可以将音量调成75吗| 75   |
            | 能不能把音量调成80| 80   |
            | 能否将音量调成85	 | 85   |
            | 可以把音量设置为12吗	 | 12   |
            | 可不可以把音量设置为12| 12   |
            | 能否把音量设到12		| 12   |
            | 能不能将音量设到12	| 12   |
            | 帮我把音量调到12		| 12   |
            | 我要把音量调到12		| 12   |
            | 请把音量调到12		| 12   |
            | 能否把音量调到12		| 12   |
            | 将音量调到12可以吗	| 12   |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值小于等于10%，播放TTS提示“好的，当前音量过小，建议在10%以上；”
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为10%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，当前音量过小，建议在10%以上】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点小，建议在10%以上】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | volume|
            | 声音设为10       | 10  |
            | 声音设置为10%    | 10  |
            | 声音调到9        | 9   |
            | 声音调节到9%     | 9   |
            | 声音调节为8      | 8   |
            | 调节声音为7      | 7   |
            | 设置声音为6      | 6   |
            | 把声音设为5      | 5   |
            | 把声音设置为9    | 9   |
            | 把声音调到9      | 9   |
            | 把声音调节到9    | 9   |
            | 把声音设置为9    | 9   |
            | 将声音设置为9    | 9   |
            | 声音设到9        | 9   |
            | 把声音设到9      | 9   |
            | 将声音设到9      | 9   |
            | 请把声音设置为9  | 9   |
            | 把声音设置为9    | 9   |
            | 请帮我把声音设到9| 9   |
            | 请将声音设到9    | 9   |
            | 我想把声音调成9  | 9   |
            | 把声音调成9吧	    | 9   |
            | 请把声音调成9    | 9   |
            | 可以将声音调成9吗| 9   |
            | 能不能把声音调成10| 10 |
            | 能否将声音调成9	 | 9   |
            | 可以把声音设置为9吗	| 9   |
            | 可不可以把声音设置为9| 9   |
            | 能否把声音设到9		| 9   |
            | 能不能将声音设到9    | 9   |
            | 帮我把声音调到9      | 9   |
            | 我要把声音调到9      | 9   |
            | 请把声音调到9        | 9   |
            | 能否把声音调到9      | 9   |
            | 将声音调到9可以吗	| 9   |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值大于等于90%，播放TTS提示“好的，当前音量过大，我可能会听不清你说话哦“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为90%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【当前音量过大，我可能会听不清你说话哦】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | volume |
            | 声音调节为90%  | 90   |
            | 调节声音为90   | 90   |
            | 设置声音为99%  | 99   |
            | 声音调节为99   | 99   |
            | 替我把音量调成91吧    | 91  |
            | 替我把声音调成99吧    | 99  |
            | 请帮我把音量调成九十  | 90  |
            | 可以帮我将音量调成90吗| 90  |
            | 将声音变为92%         | 92  |
            | 把音量调到百分之九十  | 90  |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值等于100%，播放TTS提示“音量已调到最大，我可能会听不清你说话哦“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为100%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【100】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【音量已调到最大，我可能会听不清你说话哦】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之100，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   |
            | 把音量设为100%  |
            | 把音量设置为100 |
            | 把音量调到100   |
            | 把音量调节到100 |
            | 把音量调到最大   |
            | 调节音量到最大   |
            | 设为最大音量     |
            | 音量调到最大     |
            | 帮我把音量调到最大 |
            | 把音量设置为最大   |
            | 快把音量设置为最大 |
            | 把声音开到最大声   |
            | 声音调到最大的     |
            | 调到最大声         |
            | 调成最大音量       |
            | 调到最大音量       |
            | 把声音开到最高     |
            | 把声音提到最大     |
            | 把声音调到最高     |
            | 把音量开到最大     |
            | 把音量升到最大     |
            | 把音量提到最高     |
            | 把音量调到最大     |
            | 给我把声音开到最大 |
            | 声音开到最大       |
            | 声音升到最大       |
            | 声音提到最大       |
            | 声音调到最高       |
            | 声音调最大         |
            | 声音最高           |
            | 我要最大声         |
            | 音量放到最大       |
            | 音量开到最大       |
            | 音量调到最大       |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置音量，中等音量，音量值等于45
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为4%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【45】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之45】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content|
            | 把声音开到中等	 |
            | 把声音调到中等	 |
            | 把声音调到中等大小	 |
            | 给我调到中等大小音量	 |
            | 给我调到中等音量	 |
            | 声音调到中等大小	 |
            | 调成中等大小音量	 |
            | 调成中等声音	 |
            | 调到中等大小声	 |
            | 调到中等大小音量	 |
            | 调到中等音量	 |
            | 我要调到中等音量	 |
            | 我要中等的声音	 |
            | 我要中等的音量	 |
            | 我要中等音量	 |
            | 音量中等大小	 |
            | 中等大小音量	 |
            | 中等音量	 |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值小于5%，将音量设置到5%，即用户设置音量最小值是5%
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为4%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【5】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的，当前音量过小，建议在10%以上】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之5，声音有点小，建议在10%以上】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content|
            | 把音量设置为4%|
            | 把音量设置为5%|
            | 把音量设置为0% |
            | 把声音调到最小 |
            | 调节音量到最小 |
            | 设为最小音量   |
            | 音量调到最小   |
            | 帮我把声音调到最小 |
            | 把音量调到最小|
            | 帮我把音量调到最小|
            | 把声音调到最小|
            | 把声音开到最小声|
            | 给我调到最小音量|
            | 调到最小音量  |
            | 我要调到最小音量|
            | 我要最小的声音 |
            | 调成最小声音   |
            | 调最小音量    |
            | 把声音关到最小  |
            | 把声音减到最低  |
            | 把声音降到最低  |
            | 把声音降到最小  |
            | 把声音开到最低  |
            | 把声音调到最低   |
            | 把音量减到最低   |
            | 把音量降到最低   |
            | 把音量开到最低   |
            | 把音量开到最小   |
            | 把音量调到最低   |
            | 声音降到最小    |
            | 声音开到最小    |
            | 声音调到最低    |
            | 声音调最小     |
            | 声音最低      |
            | 我要最小声     |
            | 我要最小音量    |
            | 音量关到最小    |
            | 音量降到最小    |
            | 音量调到最低    |
            | 音量调到最小    |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置音量，音量值大于100%，将音量设置到100%，即用户设置音量最大值是100%
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【把音量设为200%】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【音量已调到最大，我可能会听不清你说话哦】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  | volume |
            | 把音量设为101%  | 100    |
            | 把音量设置为200%| 100    |
            | 把音量调到2000  | 100    |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-查询音量，音量值设置正常范围11-89，播放TTS提示”现在音量为百分之X“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        假如      iFlyOS客户端音量为【11%】
        # 模拟用户说出【现在音量是多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之11】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 音量多少 	 |
            | 音量多大	 |
            | 音量百分之几	 |
            | 音量是多少	 |
            | 音量是多大	 |
            | 音量是百分之几	 |
            | 音量有多少	 |
            | 音量有多大	 |
            | 音量有百分之几	 |
            | 声音多少	 |
            | 声音多大	 |
            | 声音百分之几	 |
            | 声音是多少	 |
            | 声音是多大	 |
            | 声音是百分之几	 |
            | 声音有多少	 |
            | 声音有多大	 |
            | 声音有百分之几	 |
            | 现在音量多少	 |
            | 现在音量多大	 |
            | 现在音量百分之几	 |
            | 现在音量是多少	 |
            | 现在音量是多大	 |
            | 现在音量是百分之几	 |
            | 现在音量有多少	 |
            | 现在音量有多大	 |
            | 现在音量有百分之几	 |
            | 现在声音多少	 |
            | 现在声音多大	 |
            | 现在声音百分之几	 |
            | 现在声音是多少	 |
            | 现在声音是多大	 |
            | 现在声音是百分之几	 |
            | 现在声音有多少	 |
            | 现在声音有多大	 |
            | 现在声音有百分之几	 |
            | 当前音量多少	 |
            | 当前音量多大	 |
            | 当前音量百分之几	 |
            | 当前音量是多少	 |
            | 当前音量是多大	 |
            | 当前音量是百分之几	 |
            | 当前音量有多少	 |
            | 当前音量有多大	 |
            | 当前音量有百分之几	 |
            | 当前声音多少	 |
            | 当前声音多大	 |
            | 当前声音百分之几	 |
            | 当前声音是多少	 |
            | 当前声音是多大	 |
            | 当前声音是百分之几	 |
            | 当前声音有多少	 |
            | 当前声音有多大	 |
            | 当前声音有百分之几	 |
            | 目前音量多少	 |
            | 目前音量多大	 |
            | 目前音量百分之几	 |
            | 目前音量是多少	 |
            | 目前音量是多大	 |
            | 目前音量是百分之几	 |
            | 目前音量有多少	 |
            | 目前音量有多大	 |
            | 目前音量有百分之几	 |
            | 目前声音多少	 |
            | 目前声音多大	 |
            | 目前声音百分之几	 |
            | 目前声音是多少	 |
            | 目前声音是多大	 |
            | 目前声音是百分之几	 |
            | 目前声音有多少	 |
            | 目前声音有多大	 |
            | 目前声音有百分之几	 |
            | 此时音量多少	 |
            | 此时音量多大	 |
            | 此时音量百分之几	 |
            | 此时音量是多少	 |
            | 此时音量是多大	 |
            | 此时音量是百分之几	 |
            | 此时音量有多少	 |
            | 此时音量有多大	 |
            | 此时音量有百分之几	 |
            | 此时声音多少	 |
            | 此时声音多大	 |
            | 此时声音百分之几	 |
            | 此时声音是多少	 |
            | 此时声音是多大	 |
            | 此时声音是百分之几	 |
            | 此时声音有多少	 |
            | 此时声音有多大	 |
            | 此时声音有百分之几	 |
            | 此刻音量多少	 |
            | 此刻音量多大	 |
            | 此刻音量百分之几	 |
            | 此刻音量是多少	 |
            | 此刻音量是多大	 |
            | 此刻音量是百分之几	 |
            | 此刻音量有多少	 |
            | 此刻音量有多大	 |
            | 此刻音量有百分之几	 |
            | 此刻声音多少	 |
            | 此刻声音多大	 |
            | 此刻声音百分之几	 |
            | 此刻声音是多少	 |
            | 此刻声音是多大	 |
            | 此刻声音是百分之几	 |
            | 此刻声音有多少	 |
            | 此刻声音有多大	 |
            | 此刻声音有百分之几	 |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-查询音量，音量值小于等于10%，播放TTS提示”现在音量为百分之X，声音有点小，建议在10%以上“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        假如      iFlyOS客户端音量为【10%】
        # 模拟用户说出【现在音量是多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之10，声音有点小，建议在10%以上】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 音量现在多少		 |
            | 音量现在多大		 |
            | 音量现在百分之几		 |
            | 音量现在是多少		 |
            | 音量现在是多大		 |
            | 音量现在是百分之几		 |
            | 音量现在有多少		 |
            | 音量现在有多大		 |
            | 音量现在有百分之几		 |
            | 音量当前多少		 |
            | 音量当前多大		 |
            | 音量当前百分之几		 |
            | 音量当前是多少		 |
            | 音量当前是多大		 |
            | 音量当前是百分之几		 |
            | 音量当前有多少		 |
            | 音量当前有多大		 |
            | 音量当前有百分之几		 |
            | 音量目前多少		 |
            | 音量目前多大		 |
            | 音量目前百分之几		 |
            | 音量目前是多少		 |
            | 音量目前是多大		 |
            | 音量目前是百分之几		 |
            | 音量目前有多少		 |
            | 音量目前有多大		 |
            | 音量目前有百分之几		 |
            | 音量此时多少		 |
            | 音量此时多大		 |
            | 音量此时百分之几		 |
            | 音量此时是多少		 |
            | 音量此时是多大		 |
            | 音量此时是百分之几		 |
            | 音量此时有多少		 |
            | 音量此时有多大		 |
            | 音量此时有百分之几		 |
            | 音量此刻多少		 |
            | 音量此刻多大		 |
            | 音量此刻百分之几		 |
            | 音量此刻是多少		 |
            | 音量此刻是多大		 |
            | 音量此刻是百分之几		 |
            | 音量此刻有多少		 |
            | 音量此刻有多大		 |
            | 音量此刻有百分之几		 |
            | 声音现在多少		 |
            | 声音现在多大		 |
            | 声音现在百分之几		 |
            | 声音现在是多少		 |
            | 声音现在是多大		 |
            | 声音现在是百分之几		 |
            | 声音现在有多少		 |
            | 声音现在有多大		 |
            | 声音现在有百分之几		 |
            | 声音当前多少		 |
            | 声音当前多大		 |
            | 声音当前百分之几		 |
            | 声音当前是多少		 |
            | 声音当前是多大		 |
            | 声音当前是百分之几		 |
            | 声音当前有多少		 |
            | 声音当前有多大		 |
            | 声音当前有百分之几		 |
            | 声音目前多少		 |
            | 声音目前多大		 |
            | 声音目前百分之几		 |
            | 声音目前是多少		 |
            | 声音目前是多大		 |
            | 声音目前是百分之几		 |
            | 声音目前有多少		 |
            | 声音目前有多大		 |
            | 声音目前有百分之几		 |
            | 声音此时多少		 |
            | 声音此时多大		 |
            | 声音此时百分之几		 |
            | 声音此时是多少		 |
            | 声音此时是多大		 |
            | 声音此时是百分之几		 |
            | 声音此时有多少		 |
            | 声音此时有多大		 |
            | 声音此时有百分之几		 |
            | 声音此刻多少		 |
            | 声音此刻多大		 |
            | 声音此刻百分之几		 |
            | 声音此刻是多少		 |
            | 声音此刻是多大		 |
            | 声音此刻是百分之几		 |
            | 声音此刻有多少		 |
            | 声音此刻有多大		 |
            | 声音此刻有百分之几		 |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-查询音量，音量值大于等于90%，播放TTS提示”现在音量为百分之X，声音有点大，我可能会听不清你说话哦“
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        假如      iFlyOS客户端音量为【<volume>%】
        # 模拟用户说出【现在音量是多少】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量是多少】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之<volume>，声音有点大，我可能会听不清你说话哦】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | volume |
            | 90    |
            | 100   |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-音量相对设置，调节后音量值范围在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【把声音调高30】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  | current_volume | new_volume | tts_content |
            | 声音调高20      | 50              | 70          | 现在音量为百分之70|
            | 声音增加20      | 50              | 70          | 现在音量为百分之70|
            | 把声音调高10    | 50              | 60          | 现在音量为百分之60|
            | 把声音增加10    | 50              | 60          | 现在音量为百分之60|
            | 帮我把声音调高20| 50              | 70          | 现在音量为百分之70|
            | 帮我把声音增加20| 50              | 70          | 现在音量为百分之70|
            | 音量调高20      | 50              | 70          | 现在音量为百分之70|
            | 音量增加20      | 50              | 70          | 现在音量为百分之70|
            | 把音量调高10    | 50              | 60          | 现在音量为百分之60|
            | 把音量增加10    | 50              | 60          | 现在音量为百分之60|
            | 帮我把音量调高20| 50              | 70          | 现在音量为百分之70|
            | 帮我把音量增加20| 50              | 70          | 现在音量为百分之70|
            | 声音减少20      | 50              | 30          | 现在音量为百分之30|
            | 声音调低20      | 50              | 30          | 现在音量为百分之30|
            | 声音降低20      | 50              | 30          | 现在音量为百分之30|
            | 把音量调低30    | 60              | 30          | 现在音量为百分之30|
            | 请帮我把声音调低30好吗| 60       | 30          | 现在音量为百分之30|
            | 给我把声音增大10%     | 60       | 70          | 现在音量为百分之70|

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-音量相对设置，调节后音量值范围不在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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

        # 模拟用户说出【把声音调高30】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【<new_volume>】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content1>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | current_volume | new_volume | tts_content                      | tts_content1 |
            | 把声音调高35    | 60             | 95          | 好的，当前音量过大                | 现在音量为百分之95，声音有点大，我可能会听不清你说话哦|
            | 声音调低30      | 40             | 10          | 好的，当前音量过小，建议在10%以上| 现在音量为百分之10，声音有点小，建议在10%以上|
            | 声音调高50      | 50             | 100         | 音量已调到最大，我可能会听不清你说话哦| 现在音量为百分之100，声音有点大，我可能会听不清你说话哦|

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-调大音量，调节后音量值范围在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐
        假如      iFlyOS客户端音量为【50%】

       # 查询音量
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量多少】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之50】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【声音大一点】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【60】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之60】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 大一点         |
            | 大一点声       |
            | 大声一点       |
            | 听不清          |
            | 把声音调大一点   |
            | 帮我把声音调大一点|
            | 增大音量          |
            | 调大音量          |
            | 音量增大          |
            | 音量调大          |
            | 帮我增大音量      |
            | 把音量增大        |
            | 把音量调大        |
            | 声音大一点         |
            | 声音大一点，我听不到|
            | 我听不到，声音大一点|
            | 声音太小了           |
            | 声音听不清           |
            | 声音再大一点         |
            | 帮我把声音再调大一些 |
            | 提高音量	 |
            | 请帮我提高音量	 |
            | 麻烦帮我提高音量	 |
            | 可以帮我提高音量吗	 |
            | 我想提高音量	 |
            | 我想调大音量	 |
            | 请帮我调大音量	 |
            | 帮我调大音量可以吗	 |
            | 声音再大一点	 |
            | 声音太小啦	 |
            | 麻烦把声音调大一点	 |
            | 请把声音调高一点哦	 |
            | 麻烦把声音再调大一点	 |
            | 现在的声音完全听不见哦	 |
            | 调大声音	 |
            | 声音继续调高一点	 |
            | 这个声音有点小哦	 |
            | 调高音量谢谢	 |
            | 声音加大	 |
            | 声音大一点	 |
            | 音量大一点	 |
            | 把音量调大一点	 |
            | 把声音调大一点	 |
            | 声音开大一点	 |
            | 给我把音量调高	 |
            | 把音量调大点	 |
            | 音量放大点	 |
            | 声音放大点	 |
            | 听不清	 |
            | 声音太小了	 |
            | 把声音调大点	 |
            | 请把音量调大点	 |
            | 把声音放大一点	 |
            | 请声音放大	 |
            | 请把声音调大点	 |
            | 可以把音量调大点吗	 |
            | 可以音量放大点吗	 |
            | 可以声音放大点儿吗	 |
            | 可以把声音调大点吗	 |
            | 能否把音量调大点	 |
            | 能不能音量大一点	 |
            | 能否把声音放大	 |
            | 声音能不能大一点	 |
            | 声音好小	 |
            | 音量太低了	 |
            | 把声音调大一些	 |
            | 我想把声音调大点	 |
            | 声音可以再大点嘛	 |
            | 声音太小了听不清	 |
            | 声音大点	 |
            | 把声音再调大一点	 |
            | 声音听不清	 |
            | 声音可不可以调大一点	 |
            | 声音能不能调大一点	 |
            | 把声音开大	 |
            | 把声音开大点	 |
            | 把声音提高	 |
            | 把声音提高点	 |
            | 把声音调高点	 |
            | 把音量开大	 |
            | 把音量提大	 |
            | 把音量提高	 |
            | 把音量调高点	 |
            | 帮我提高音量	 |
            | 帮我调大音量	 |
            | 加大音量	 |
            | 开大声音	 |
            | 能不能把声音调大一点	 |
            | 声音提大点	 |
            | 声音提高点	 |
            | 声音调大	 |
            | 声音调大些	 |
            | 声音调大一点	 |
            | 声音调高一点	 |
            | 声音再大点	 |
            | 提高声音	 |
            | 调大点音量	 |
            | 调大音量	 |
            | 音量大点	 |
            | 音量提高点	 |
            | 音量调大点	 |
            | 音量调大些	 |
            | 音量调高一点	 |
            | 音量再大点	 |
            | 音量大一些	 |
            | 再稍微把音量加大一些	 |
            | 大声一点	 |
            | 听不清了	 |
            | 将音量略微放大一点儿	 |
            | 播放的声音大点|

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-调小音量，调节后音量值范围在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐
        假如      iFlyOS客户端音量为【50%】

       # 查询音量
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【现在音量多少】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之50】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【声音大一点】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetVolume】，参数【volume】为【40】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在音量为百分之40】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 小一点                |
            | 小一点声              |
            | 小声一点              |
            | 太吵了                |
            | 声音小一点            |
            | 调小一点声音          |
            | 帮我调小一点声音      |
            | 声音太大了            |
            | 减小声音              |
            | 帮我减小声音          |
            | 降低声音              |
            | 帮我降低声音          |
            | 把声音减小            |
            | 把声音降低            |
            | 把声音调小            |
            | 声音调小一点          |
            | 声音调小              |
            | 声音小一点           |
            | 声音小一点，太吵了   |
            | 太吵了，声音小一点   |
            | 声音再小一点         |
            | 帮我把声音再调小一些|
            | 再小一点             |
            | 调低音量	 |
            | 请调低音量	 |
            | 可以调低音量吗	 |
            | 我想调低音量	 |
            | 帮我调低音量	 |
            | 调低音量好吗	 |
            | 现在这个声音太大啦	 |
            | 安静一点吧	 |
            | 调低音量谢谢	 |
            | 调低声音	 |
            | 声音太大了	 |
            | 太吵了	 |
            | 声音再调低一点	 |
            | 这个声音有点大	 |
            | 帮我把声音调低一点好吗	 |
            | 有点吵哦	 |
            | 请帮我调低声音	 |
            | 声音调小一点吧	 |
            | 我想调低声音	 |
            | 声音减小	 |
            | 声音小一点	 |
            | 音量小一点	 |
            | 把音量调小一点	 |
            | 把声音调小一点	 |
            | 声音开小一点	 |
            | 给我把音量调低	 |
            | 把音量调小点	 |
            | 音量放低点	 |
            | 声音放小点	 |
            | 把声音调低点	 |
            | 请把音量调小点	 |
            | 请音量放小点	 |
            | 请声音放小	 |
            | 请把声音调低点	 |
            | 可以把音量调小点吗	 |
            | 可以音量放低点吗	 |
            | 可以声音放小吗	 |
            | 可以把声音调低点吗	 |
            | 能否把音量调低点	 |
            | 能否音量放小点	 |
            | 能否声音放小	 |
            | 能否把声音调小点	 |
            | 声音好吵	 |
            | 音量太高了	 |
            | 声音太大调小点	 |
            | 给我把声音调小	 |
            | 声音小点吧	 |
            | 把声音调低	 |
            | 音量调低	 |
            | 有点吵小点声	 |
            | 把声音减低	 |
            | 把声音调小点	 |
            | 把音量关小点	 |
            | 把音量减小	 |
            | 把音量降低点	 |
            | 把音量开小	 |
            | 把音量调低点	 |
            | 把音量调小	 |
            | 帮我把音量调小一点	 |
            | 减小声音	 |
            | 降低声音	 |
            | 降低音量	 |
            | 可不可以把声音调小一点	 |
            | 声音低点	 |
            | 声音减小点	 |
            | 声音降低点	 |
            | 声音开小点	 |
            | 声音调小点	 |
            | 声音再小点	 |
            | 声音再小一点	 |
            | 调小声音	 |
            | 调小音量	 |
            | 我想把声音调小点	 |
            | 音量放小点	 |
            | 音量关小点	 |
            | 音量减低点	 |
            | 音量减小点	 |
            | 音量降低点	 |
            | 音量调小点	 |
            | 音量调小一点	 |
            | 音量再小一点	 |
            | 声音小点	 |
            | 把声音适当弄安静一点	 |
            | 把音量再适当调低一格	 |
            | 再小一点	 |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-调整音量，调节后音量值范围不在11-89
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
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
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content1>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | current_volume | new_volume | tts_content | tts_content1 |
            | 声音大一点     | 89              | 99          | 好的，当前音量过大，我可能会听不清你说话哦| 现在音量为百分之99，声音有点大，我可能会听不清你说话哦|
            | 声音小一点     | 20              | 10          | 好的，当前音量过小，建议在10%以上   | 现在音量为百分之10，声音有点小，建议在10%以上|

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-设置静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【设置为静音】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetMute】，参数【mute】为【true】
        # 回复音量变更状态
        当        iFlyOS客户端发送event【Speaker】，【MuteChanged】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端静音状态为【<mute>】

        例子:     语料
            | voice_content |
            | 静音            |
            | 设置静音        |
            | 设置为静音      |
            | 把声音关掉      |
            | 帮我设置静音    |
            | 帮我设置为静音  |
            | 帮我把声音关掉  |
            | 打开静音	       |
            | 声音关闭	       |
            | 请设置为静音	   |
            | 帮我把声音关闭  |
            | 能否打开静音	   |
            | 能不能把声音关闭|
            | 设置为静音	  |
            | 请打开静音	  |
            | 请关闭声音	  |
            | 请把静音打开	  |
            | 把静音打开	  |
            | 怎么打开静音	  |
            | 把声音关闭	  |
            | 请把声音关闭	  |
            | 能否把声音关闭 |
            | 可以打开静音吗 |
            | 可以关闭声音吗 |
            | 如何设置静音	  |
            | 声音关掉	      |
            | 可以把声音关闭吗|
            | 帮我关掉声音	   |
            | 帮我把声音关掉  |
            | 关掉声音	       |
            | 可以关掉声音吗  |
            | 打开静音模式	   |
            | 静音模式打开	   |
            | 把声音关掉	   |

    @ExtraCase  @VolumeControl
    场景大纲: 音量控制-取消静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音量控制】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【取消静音】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Speaker】，【SetMute】，参数【mute】为【false】
        # 回复音量变更状态
        当        iFlyOS客户端发送event【Speaker】，【MuteChanged】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端静音状态为【<mute>】

        例子:     语料
            | voice_content |
            | 取消静音       |
            | 帮我取消静音   |
            | 把声音打开     |
            | 帮我把声音打开 |
            | 声音打开	     |
            | 请取消静音	 |
            | 将声音打开吧	 |
            | 能否取消静音	 |
            | 可以把声音打开吗|
            | 没有声音了	 |
            | 怎么没有声音了|
            | 请打开声音	 |
            | 请把静音取消	 |
            | 把静音取消掉	 |
            | 声音打开了吗	 |
            | 把声音打开	 |
            | 请把声音打开	 |
            | 能否把声音打开	 |
            | 可以取消静音吗	 |
            | 可以打开声音吗	 |
            | 可以把静音取消掉吗|
            | 声音呢	         |
            | 帮我取消静音	     |
            | 可以把静音取消吗	 |
            | 我想打开声音	     |
            | 我想把声音打开	 |
            | 帮我打开声音吧	 |
            | 能把静音取消吗	 |
            | 关闭静音模式	     |
            | 打开声音	         |

    @ExtraCase  @PlaybackControl
    场景大纲: 音频播放器-pause//暂停播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 暂停播放          |
            | 停一下           |
            | 暂停一下          |

    @ExtraCase  @Music
    场景大纲: 音乐点播-音频收藏
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐点播】技能已打开
        假如      iFlyOS客户端正在播放音乐

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
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

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【PlaybackStarted】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 喜欢这首歌         |
            | 收藏这首歌         |
            | 帮我收藏          |
            | 把这首歌放入收藏夹     |

    @ExtraCase  @Music
    场景大纲: 音乐点播-播放收藏的音乐
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐点播】技能已打开
        假如      iFlyOS客户端正在播放音乐

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【播放我收藏的歌曲】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【PlaybackStarted】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 播放我收藏的歌曲         |
            | 播放我喜欢的歌曲         |
            | 我收藏的歌曲         |
            | 播放我收藏的音乐         |

    @ExtraCase  @PlaybackControl
    场景大纲: 音频播放器-resume//继续播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端在【60000】暂停播放了音乐

        # 模拟用户说出【继续】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，参数【offsetInMilliseconds】为【60000】
        # 回复继续播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器状态为【PLAY】
#        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【60000】

        例子: 语料
            | voice_content |
            | 继续            |
            | 继续播放          |
            | 接着播           |
            | 接着播放          |
            | 接着听           |

    @ExtraCase  @PlaybackControl
    场景大纲: 音频播放器-next//切换到播放列表中的下一个
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【下一首】
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

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】

        例子: 语料
            | voice_content |
            | 下一首           |
            | 切歌            |
            | 不听这首          |

    @ExtraCase  @PlaybackControl
    场景大纲: 音频播放器-previous//切换到播放列表中的上一个
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【下一首】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【下一首】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

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
        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】

        例子: 语料
            | voice_content |
            | 上一首           |
            | 听刚才那首         |
            | 回到上一首         |
            | 回到刚才那首        |

    @ExtraCase  @PlaybackControl  @disable
    场景大纲: 音频播放器-stop//停止播放
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【停止】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为您暂停播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

#        当        iFlyOS客户端发送查询状态请求
#        那么      iFlyOS服务端音乐播放器状态为【STOP】

        例子: 语料
            | voice_content |
            | 停止            |
            | 关闭播放          |
            | 停止播放          |
            | 不听了           |
            | 关闭音乐          |
            | 音乐关掉          |
            | 音乐关了          |
            | 把音乐关掉         |

    @ExtraCase  @PlaybackControl
    场景大纲: 音频播放器-查询当前节目
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦|
            | 稻香  |
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

        # 模拟用户说出【这是什么歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在播放的是周杰伦的稻香】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 这是什么歌         |
            | 现在在播什么        |
            | 现在在播什么歌       |
            | 现在播的什么        |
            | 现在播的是什么       |
            | 当前播放节目        |
            | 当前播放节目是什么     |
            | 正在播的是什么       |

    @ExtraCase  @PlaybackControl
    场景大纲: 音频播放器-查询当前艺人/作者
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦|
            | 稻香  |
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

        # 模拟用户说出【这是谁的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【现在播放的是周杰伦的稻香】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子: 语料
            | voice_content |
            | 这是谁的歌         |
            | 这是谁唱的歌        |
            | 现在在播谁的        |
            | 现在在播谁的歌       |
            | 现在播谁的节目       |
            | 正在播谁的歌        |

    @ExtraCase  @OilPrice
    场景大纲: 油价查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | 今天的油价      | 汽油         | ListTemplate1  | 油价查询    | 安徽       | 号               | 元/升              |
            | 安徽柴油什么价格| 0号柴油      | ListTemplate1  | 油价查询    | 安徽       | 号               | 元/升              |

    @ExtraCase  @OilPrice
    场景大纲: 油价查询-查询某号石油价格
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【油价查询】技能已打开

        # 模拟用户说出【帮我查下今天的油价】
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
            | voice_content              | tts_content | template_type | title     | text_field | sub_text_field |
            | 帮我查下今天95号汽油的价格  | 95号汽油     | BodyTemplate3 | 油价查询  | 元/升         | 省              |

    @ExtraCase  @WorldCup
    场景大纲: 世界杯-世界杯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content  | tts_content    |
            | 俄罗斯和沙特的赛果      | 世界杯            |
            | A组的出线名单        | A组             |
            | 世界杯的赛程         | 世界杯            |
            | 世界杯会有几支队伍参赛    | 世界杯            |
            | 今年世界杯球队一览      | 本届赛事           |
            | 世界杯小组赛什么时候结束   | 世界杯            |
            | 八强名单           | 八强的队伍          |
            | 2018-7-15有什么比赛 | 法国以比分4比2战胜克罗地亚 |
            | 2018-7-14有什么比赛 | 比利时以比分2比0战胜英格兰 |
            | 2018-7-16有什么比赛 | 2018俄罗斯世界杯     |

    @ExtraCase  @AreaConversion
    场景大纲: 面积换算-面积换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                 | tts_content                        | template_type | title       | text_field      | sub_text_field |
            | 1平方米换成平方厘米大约是多少 | [n2]1平方米等于[n2]10000平方厘米     | BodyTemplate3  | 单位换算   | 10000(平方厘米)   | 1(平方米)     |
            | 多少亩相当于1公顷              | [n2]15亩等于[n2]1公顷                | BodyTemplate3  | 单位换算    | 15(亩)          | 1(公顷)      |
            | 能把15平方公里换成英亩吗      | [n2]15平方公里约等于[n2]3706.581英亩 | BodyTemplate3  | 单位换算   | 3706.581(英亩)    | 15(平方公里)  |
            | 可以把100亩换成平方米吗       | [n2]100亩约等于[n2]66666.667平方米   | BodyTemplate3  | 单位换算   | 66666.667(平方米) | 100(亩)        |
            | 多少平方米等于10公顷呢        | [n2]100000平方米等于[n2]10公顷        | BodyTemplate3  | 单位换算   | 100000(平方米)    |10(公顷)  |

    @ExtraCase  @VolumeConversion
    场景大纲: 体积换算-体积换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                      | tts_content                         | template_type | title     | text_field         | sub_text_field|
            | 1立方米等于多少升                   | [n2]1立方米等于[n2]1000升           | BodyTemplate3 | 单位换算  | 1000(升)            | 1(立方米)       |
            | 查下1升是多少立方分米               | [n2]1升就等于[n2]1立方分米          | BodyTemplate3 | 单位换算  | 1(立方分米)          | 1(升)           |
            | 多少升等于1立方米                   | [n2]1000升等于[n2]1立方米           | BodyTemplate3 | 单位换算  | 1000(升)            | 1(立方米)       |
            | 10升可以换成多少英制加仑            | [n2]10升约等于[n2]2.200英制加仑     | BodyTemplate3 | 单位换算  | 2.200(英制加仑)     | 10(升)          |
            | 你知道1升可以换成多少美制液体盎司吗 | [n2]1升约等于[n2]33.814美制液体盎司 | BodyTemplate3 | 单位换算  | 33.814(美制液体盎司)| 1(升)           |

    @ExtraCase  @BinaryConversion
    场景大纲: 进制转换-进制转换
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                      | tts_content              | template_type | title    | text_field  | sub_text_field |
            | 二进制的1111等于十进制的多少        | 二进制1111等于十进制15    | BodyTemplate3 | 单位换算  | 15(十进制)     | 1111(二进制)      |
            | 你知道二进制11111等于十进制的多少吗 | 二进制11111等于十进制31   | BodyTemplate3 | 单位换算  | 31(十进制)     | 11111(二进制)     |
            | 把十进制1024转成十六进制            | 十进制1024等于十六进制400 | BodyTemplate3 | 单位换算  | 400(十六进制)  | 1024(十进制)     |
            | 111这个二进制数换算成十进制是多少   | 二进制111等于十进制7      | BodyTemplate3 | 单位换算  | 7(十进制)      | 111(二进制)     |
            | 二进制序列1111等于十进制的多少      | 二进制1111等于十进制15   | BodyTemplate3 | 单位换算  | 15(十进制)    | 1111(二进制)   |

    @ExtraCase  @PowerConversion
    场景大纲: 功率换算-功率换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                   | tts_content                                     | template_type | title     | text_field   | sub_text_field |
            | 一千瓦等于多少焦耳每秒           | [n2]1千瓦等于[n2]1000焦耳每秒                    | BodyTemplate3 | 单位换算  | 1000(焦耳每秒)   | 1(千瓦)          |
            | 一千瓦可以换算成多少英制马力     | [n2]1000瓦等于[n2]1.341英制马力                  | BodyTemplate3 | 单位换算  | 1.341(英制马力) | 1000(瓦)         |
            | 多少千瓦可以换算成多少十英制马力 | [n2]7.457千瓦约等于[n2]10英制马力                 | BodyTemplate3 | 单位换算  | 7.457(千瓦)    | 10(英制马力)      |
            | 一千瓦等于一千卡每秒吗            | [n2]1千瓦不等于[n2]1千卡每秒。[n2]1千瓦等于[n2]0.239千卡每秒 | BodyTemplate3 | 单位换算  | 0.239(千卡每秒) | 1(千瓦)           |
            | 一千瓦可以等量代换为多少英制马力 | [n2]1千瓦等于[n2]1.341英制马力                  | BodyTemplate3 | 单位换算 | 1.341(英制马力) | 1(千瓦)           |

    @ExtraCase  @WeightConversion
    场景大纲: 重量换算-重量换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【功率换算】技能已打开

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
            | voice_content             | tts_content                            | template_type | title    | text_field | sub_text_field |
            | 能告诉我1吨等于多少千克吗 | [n2]1吨等于[n2]1000千克                 | BodyTemplate3 | 单位换算  | 1000(千克)  | 1(吨)              |
            | 多少千克可以换算成1吨     | [n2]1000千克等于[n2]1吨                 | BodyTemplate3 | 单位换算  | 1000(千克)  | 1(吨)         |
            | 1千克可以换成几斤         | [n2]1000克等于[n2]2斤                   | BodyTemplate3 | 单位换算  | 2(斤)       | 1000(克)          |
            | 1千克等于1斤吗            | [n2]1000克不等于[n2]1斤。[n2]1000克等于[n2]2斤 | BodyTemplate3 | 单位换算  | 2(斤)       | 1000(克)         |
            | 1磅可以换算成多少千克     | [n2]1磅约等于[n2]0.454千克              | BodyTemplate3 | 单位换算  | 0.454(千克)| 1(磅)              |
            | 1斤6两等于多少克          | [n2]1斤[n2]6两等于[n2]800克            | BodyTemplate3 | 单位换算  | 800(克)    | 1(斤)              |

    @ExtraCase  @UnitConversion
    场景大纲: 单位换算-长度换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                   | tts_content          | template_type | title     | text_field   | sub_text_field |
            | 8米等于多少厘米                 | 8米等于800厘米        | BodyTemplate3 | 单位换算  | 800(厘米)       | 8(米)              |
            | 16米是多少千米                  | 16米等于0.016千米     | BodyTemplate3 | 单位换算  | 0.016(千米)     | 16(米)            |
            | 你知道4米是多少千米吗           | 4米等于0.004千米      | BodyTemplate3 | 单位换算  | 0.004(千米)     | 4(米)             |
            | 能不能告诉我一厘米等于多少毫米 | 1厘米等于10毫米        | BodyTemplate3 | 单位换算  | 10(毫米)        | 1(厘米)           |
            | 一公里大约是几米                | 1公里等于1000米       | BodyTemplate3 | 单位换算  | 1000(米)         | 1(公里)           |
            | 10米等于多少英尺                | 10米等于32.808399英尺 | BodyTemplate3 | 单位换算  | 32.808399(英尺) | 10(米)           |
            | 20英寸等同于几厘米              | 20英寸等于50.8厘米     | BodyTemplate3 | 单位换算  | 50.8(厘米)      | 20(英寸)         |

    @ExtraCase  @TemperatureConversion
    场景大纲: 单位换算-温度换算
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                   | tts_content                         | template_type | title     | text_field         | sub_text_field |
            | 20摄氏度等于多少华氏度          | [n2]20摄氏度等于[n2]68华氏度         | BodyTemplate3 | 单位换算  | 68(华氏度)            | 20(摄氏度)        |
            | 多少摄氏度等于50列氏度          | [n2]50列氏度等于[n2]62.5摄氏度       | BodyTemplate3 | 单位换算  | 62.5(摄氏度)          | 50(列氏度)        |
            | 10开氏度是多少摄氏度            | [n2]10开氏度等于[n2]-263.15摄氏度    | BodyTemplate3 | 单位换算  | -263.15(摄氏度)      | 10(开氏度)        |
            | 10摄氏度帮我换成华氏度          | [n2]10摄氏度等于[n2]50华氏度         | BodyTemplate3 | 单位换算  |  50(华氏度)             | 10(摄氏度)        |
            | 帮我算下多少摄氏度等于90华氏度 | [n2]90华氏度等于[n2]32.2222222摄氏度 | BodyTemplate3 | 单位换算  | 32.2222222(摄氏度)| 90(华氏度)        |
            | 9度等于多少兰氏度啊            | [n2]9度等于[n2]507.87兰氏度           | BodyTemplate3 | 单位换算  | 507.87(兰氏度)          | 9(度)        |
            | 多少摄氏度等于10开氏度         | [n2]10开氏度等于[n2]-263.15摄氏度    | BodyTemplate3 | 单位换算  | -263.15(摄氏度)         | 10(开氏度)        |
            | 你知道20开氏度是多少华氏度吗  | [n2]20开氏度等于[n2]-423.67华氏度    | BodyTemplate3 | 单位换算  | -423.67(华氏度)          | 20(开氏度)       |
            | 20开氏度是多少华氏度           | [n2]20开氏度等于[n2]-423.67华氏度    | BodyTemplate3 | 单位换算  | -423.67(华氏度)          | 20(开氏度)        |

    @ExtraCase  @ProvincialCapital
    场景大纲: 省会查询-省会查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | tts_content           |
            | 安徽的省会是什么      | 是合肥市                  |
            | 合肥是哪个省的省会     | 合肥市是安徽省的省会            |
            | 安徽的省会是合肥吗     | 安徽省的省会是合肥市            |
            | 大同是哪个省的省会     | 大同市不是省会城市             |
            | 安徽的省会是芜湖不     | 安徽省的省会是合肥市，芜湖市不是省会城市  |
            | 安徽和河南的省会分别是   | 安徽省的省会是合肥市，河南省的省会是郑州市 |
            | 商丘和合肥是哪里的省会   | 商丘市不是省会城市哦，合肥市是安徽省的省会 |

    @ExtraCase  @History
    场景大纲: 历史-历史
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【历史】技能已打开

        # 模拟用户说出【我想听乾隆皇帝的历史】
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

        例子:     语料
            | voice_content  | tts_content |
            | 我想听乾隆皇帝的历史     | 乾隆皇帝        |
            | 我想了解一下唐朝的历史    | 唐朝          |
            | 我想了解康熙王朝的历史    | 康熙王朝        |
            | 我想了解抗日战争的历史    | 抗日战争        |
            | 发生在唐朝的历史故事有哪些呢 | 唐朝          |

    @ExtraCase  @Story
    场景大纲: 故事-故事
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【故事】技能已打开

        # 模拟用户说出【给我讲个故事吧】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content          |
            | 一起来听              |
            | 嗯，我们一起来听      |
            | 好啊，我们一起听听    |
            | 要乖乖睡觉了哦。      |
            | 来了，喜欢的话，记得给|
            | 好的，小飞和你一起听 |
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

        例子:     语料
            | voice_content  |
            | 给我讲个故事吧        |
            | 我想听安徒生的故事      |
            | 有没有卖火柴的小女孩的故事 |

    @ExtraCase  @Abandon
    场景大纲: 用户放弃-用户放弃
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【节假日查询】技能已打开

        # 模拟用户说出【不用了】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 好的          |
            | 那我走了        |
            | 有需要的时候再叫我吧  |
            | 好的，待会见      |
            | 嗯嗯          |
            |             |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 不用了           |
            | 没事了           |
            | 知道了           |
            | 可以了           |
            | 你去休息吧         |
            | 没什么           |

    @ExtraCase  @Calendar
    场景大纲: 万年历查询-万年历查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content         | tts_content | tts_content2 | template_type  | main_title       | text_field |
            | 今天不适合做什么       | 农历         | 不适合         | BodyTemplate1 | 今天不适合做什么   | 不宜          |
            | 今天的日子好吗         | 农历         | 适合           | BodyTemplate1 | 今天的日子好吗     | 宜          |
            | 查询今天适合做什么     | 农历         | 适合           | BodyTemplate1 | 查询今天适合做什么 | 宜          |
            | 查询8月1日适合做什么   | 农历         | 适合           | BodyTemplate1 | 查询8月1日适合做什么| 宜          |

    @ExtraCase  @Why
    场景大纲: 十万个为什么-十万个为什么
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【十万个为什么】技能已打开

        # 模拟用户说出【为什么脑子会越用越灵】的识别过程
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
            | voice_content       | tts_content                                               | template_type  | main_title           | text_field |
            | 为什么脑子会越用越灵| 有人会担心，用脑过度会有损健康。事实上，这是没有科学根据的。| BodyTemplate1 | 为什么脑子会越用越灵  | 有人会担心，用脑过度会有损健康。事实上，这是没有科学根据的 |
            | 为什么咸鸭蛋会出油     | 蛋黄出油是咸鸭蛋腌好的标志，当然也有不出油的，这主要是   | BodyTemplate1 | 为什么咸鸭蛋会出油    | 蛋黄出油是咸鸭蛋腌好的标志，当然也有不出油的，这主要是      |
            | 什么是宇宙大爆炸      | 大约在150亿年前，宇宙中什么也没有，所有的东西都集中在一个 | BodyTemplate1 | 什么是宇宙大爆炸      | 大约在150亿年前，宇宙中什么也没有，所有的东西都集中在      |
            | 为什么鼻子能问到气味    | 人的鼻子是人的嗅觉器官、可以帮助人们闻到各种不同的气味，| BodyTemplate1 | 为什么鼻子能问到气味  | 人的鼻子是人的嗅觉器官、可以帮助人们闻到各种不同的气味，|
            | 太阳黑子是黑子的么     | 太阳黑子是太阳光球层上的巨大气流旋涡，是太阳活动的明显标 | BodyTemplate1 | 太阳黑子是黑子的么    | 太阳黑子是太阳光球层上的巨大气流旋涡，是太阳活动的明显标  |
            | 为什么皮肤遇热会变红    | 皮肤遇热时，皮下的微血管会微胀起来，加速血液的流动。因  | BodyTemplate1 | 为什么皮肤遇热会变红  | 皮肤遇热时，皮下的微血管会微胀起来，加速血液的流动。因  |

    @ExtraCase  @HotSpot
    场景大纲: 热点-热点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【热点】技能已打开

        # 模拟用户说出【你知道蓝瘦香菇吗】的识别过程
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
            | voice_content        | tts_content            |  template_type | main_title       | text_field |
            | 你知道蓝瘦香菇吗      | 蓝瘦                    | BodyTemplate1 | 你知道蓝瘦香菇吗  | 蓝瘦                   |
            | 赵日天是谁            | 在下赵日天，狂霸天下之我最牛 | BodyTemplate1 | 赵日天是谁        | 在下赵日天，狂霸天下之我最牛 |
            | 赵日天最牛逼          | 在下赵日天，狂霸天下之我最牛 | BodyTemplate1 | 赵日天最牛逼      | 在下赵日天，狂霸天下之我最牛 |
            | 吓得人家瓜子都掉了   | 原来你也拥有一颗玻璃心 | BodyTemplate1 | 吓得人家瓜子都掉了 | 原来你也拥有一颗玻璃心 |
            | 我蓝瘦我香菇         | 蓝瘦                    | BodyTemplate1 | 我蓝瘦我香菇        | 蓝瘦                    |
            | 吓得我瓜子都掉了     | 原来你也拥有一颗玻璃心 | BodyTemplate1 | 吓得我瓜子都掉了   | 原来你也拥有一颗玻璃心 |

    @ExtraCase  @Zodiac
    场景大纲: 生肖运势-查询某年的生肖
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content          | tts_content       | template_type | title |
            | 今年出生的是什么生肖    | 的生肖为          | BodyTemplate3 | 生肖   |
            | 1986年出生属什么        | 1986年的生肖为虎  | BodyTemplate3 | 生肖   |
            | 去年生肖是什么           | 的生肖为          | BodyTemplate3 | 生肖   |
            | 出生在今年的人是属虎的吗| 的生肖为          | BodyTemplate3 | 生肖   |

    @ExtraCase  @Zodiac
    场景大纲: 生肖运势-查询运势
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【生肖运势】技能已打开

        # 模拟用户说出【属龙的生肖运势怎么样】的识别过程
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
            | voice_content        | tts_content | template_type | main_title | sub_title | text_field |
            | 属龙的生肖运势怎么样 | 生肖龙的运势 | BodyTemplate1 | 龙        | 生肖运势  | 生肖龙的运势|

    @ExtraCase  @Zodiac
    场景大纲: 生肖运势-查询优缺点、事业爱情财富健康
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【生肖运势】技能已打开

        # 模拟用户说出【属龙的生肖运势怎么样】的识别过程
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
            | voice_content                | tts_content                     | template_type | main_title | sub_title | text_field |
            | 属猴的男生可以找属马的女生吗 | 你们是需要相互关照，常历常新的一对 | BodyTemplate1 | 马和猴        | 生肖配对  | 你们是需要相互关照，常历常新的一对|

    @ExtraCase  @University
    场景大纲: 高校查询-高校查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content        | tts_content    | template_type | main_title           | sub_title | text_field |
            | 北京有哪些大学        | 大学            | BodyTemplate1 | 北京有哪些大学        | 高校查询   | 大学       |
            | 有哪些艺术类大学      | 学院            | BodyTemplate1 | 有哪些艺术类大学      | 高校查询   | 学院       |
            | 江苏有哪些211大学     | 大学            | BodyTemplate1 | 江苏有哪些211大学     | 高校查询   | 大学       |
            | 哪些是九八五大学      | 大学             | BodyTemplate1 | 哪些是九八五大学      | 高校查询   | 大学       |
            | 中国有哪些是政法大学  | 大学             | BodyTemplate1 | 中国有哪些是政法大学  | 高校查询   | 大学       |
            | 安徽有么有政法类大学  | 学院             | BodyTemplate1 | 安徽有么有政法类大学  | 高校查询   | 学院       |

    @ExtraCase  @University
    场景大纲: 高校查询-查询高校的地址
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【高校查询】技能已打开

        # 模拟用户说出【安徽大学在安徽哪个市】的识别过程
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
            | voice_content        | tts_content | template_type | title |
            | 安徽大学在安徽哪个市 | 安徽省合肥市 | BodyTemplate3 | 高校查询|

    @ExtraCase  @Constellation
    场景大纲: 星座-星座
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content           | tts_content      | template_type | main_title    | sub_title | text_field |
            | 白羊座今年的运势          | 白羊座的综合运势   | BodyTemplate1 | 白羊座         | 星座运势   | 白羊座的综合运势  |
            | 摩羯座与白羊座的最佳配偶  | 摩羯              | BodyTemplate1 | 白羊座和摩羯座  | 星座配对   | 摩羯  |
            | 处女座今年运势怎样        | 处女座的综合运势  | BodyTemplate1 | 处女座          | 星座运势   | 处女座的综合运势  |
            | 水瓶座下周运势            | 水瓶座的综合运势  | BodyTemplate1 | 水瓶座          | 星座运势   | 水瓶座的综合运势  |
            | 双子座本月运势            | 双子座的综合运势  | BodyTemplate1 | 双子座          | 星座运势   | 双子座的综合运势  |
            | 白羊座的特点              | 白羊座的特点是    | BodyTemplate1 | 白羊座           | 星座特点   | 白羊座的特点  |

    @ExtraCase  @CurrencyExchange
    场景大纲: 汇率查询与货币兑换-汇率查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【汇率查询与货币兑换】技能已打开

        # 模拟用户说出【50美元可以兑换多少人民币】的识别过程
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
            | voice_content             | tts_content        | template_type | title |
            | 美元和人民币的汇率         | 美元和人民币的汇率   | BodyTemplate3 | 查汇率 |
            | 我想查询人民币和港币的汇率 | 人民币和港币的汇率是 | BodyTemplate3 | 查汇率 |
            | 那人民币和美元的汇率呢     | 人民币和美元的汇率是 | BodyTemplate3 | 查汇率 |

    @ExtraCase  @CurrencyExchange
    场景大纲: 汇率查询与货币兑换-货币兑换
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content           | tts_content     | template_type | title  | text_field | sub_text_field|
            | 50美元可以兑换多少人民币 | 50美元可兑换成    | BodyTemplate3 | 查汇率 | 人民币      | 50美元          |
            | 100人民币值多少港币      | 100人民币可兑换成 | BodyTemplate3 | 查汇率 | 港币        | 100人民币      |

    @ExtraCase  @CurrencyExchange
    场景大纲: 汇率查询与货币兑换-汇率查询与货币兑换-追问
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【汇率查询与货币兑换】技能已打开

        # 模拟用户说出【50美元可以兑换多少人民币】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要把人民币兑换成美元】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【请说出您持有的货币数量】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 追问说
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
            | voice_content   | template_type | title  |  text_field | sub_text_field| tts_content     |
            | 100              | BodyTemplate3 | 查汇率  | 美元         | 100            | 100人民币可兑换成 |
            | 100元            | BodyTemplate3 | 查汇率  | 美元         | 100元          | 100人民币可兑换成 |

    @ExtraCase  @FamilyRelationship
    场景大纲: 家族关系神器-家族关系神器
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content              | tts_content                                    | template_type | title     | text_field   | sub_text_field |
            | 爸爸的爸爸是我的什么       | 我推测出，爸爸的爸爸是你的爷爷                 | BodyTemplate3 | 亲属称谓  | 爷爷          | 爸爸的爸爸是    |
            | 我老婆的爸爸的儿子是谁     | 我推测出，老婆的爸爸的儿子是你的小舅子,大舅子 | BodyTemplate3 | 亲属称谓  | 小舅子,大舅子 | 老婆的爸爸的儿子 |
            | 我老公的妹妹的老公我叫什么 | 我推测出，老公的妹妹的老公是你的小姑夫        | BodyTemplate3 | 亲属称谓  | 小姑夫         | 老公的妹妹的老公 |
            | 爸爸的爸爸叫我什么         | 我推测出，爸爸的爸爸喊你孙子或是叫你孙女      | BodyTemplate3 | 亲属称谓  | 孙女           | 爸爸的爸爸        |
            | 爸爸的哥哥喊我什么         | 我推测出，爸爸的哥哥喊你侄子或是叫你侄女      | BodyTemplate3 | 亲属称谓  | 侄女           | 爸爸的哥哥        |

    @ExtraCase  @HundredFamilyName
    场景大纲: 百家姓-百家姓
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content                 | tts_content                            | template_type  | main_title                 | text_field |
            | 百家姓你知道有哪些吗           | 赵钱孙李，周吴郑王。冯陈楮卫，蒋沈韩杨   | BodyTemplate1  | 百家姓你知道有哪些吗        | 赵钱孙李，周吴郑王。冯陈楮卫，蒋沈韩杨 |
            | 王姓的简介                     | 王姓在秦汉时期基本生活在今山西芮城       | BodyTemplate1  | 王姓的简介                  | 王姓在秦汉时期基本生活在今山西芮城 |
            | 王姓的名人有哪些               | 姓氏王的著名人物有王亥、王诩、           | BodyTemplate1  | 王姓的名人有哪些            | 姓氏王的著名人物有王亥、王诩 |
            | 王姓的起源是什么               | 出自姬姓，为周文王之后，以王族爵号为氏   | BodyTemplate1  | 王姓的起源是什么            | 出自姬姓，为周文王之后，以王族爵号为氏 |
            | 有没有姓张的                   | 这是当然了，张姓在百家姓中               | BodyTemplate1  | 有没有姓张的                | 这是当然了，张姓在百家姓中 |
            | 张姓的始祖是谁                 | 姓氏张的祖先信息有张挥。张姓的诞生很古   | BodyTemplate1  | 张姓的始祖是谁              | 姓氏张的祖先信息有张挥。张姓的诞生很古 |
            | 百家姓中人数最多的是哪个      | 百家姓中人口排名第[n2]1的是李姓          | BodyTemplate1  | 百家姓中人数最多的是哪个    | 李姓 |
            | 百家姓中人数排名前三的是哪些 | 百家姓中人口排名前[n2]3的分别是李、王、张 | BodyTemplate1  | 百家姓中人数排名前三的是哪些| 分别是李、王、张|

    @ExtraCase  @City
    场景大纲: 国内城市查询-国内城市查询
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content        | tts_content                                 | template_type  | main_title       | text_field |
            | 安徽省有哪些城市     | 安徽省一共有16座城市，分别是:合肥市、芜湖市   | BodyTemplate1  | 安徽省有哪些城市  | 安徽省一共有16座城市 |
            | 合肥是哪个省的       | 合肥市是安徽省的城市                            | BodyTemplate1  | 合肥是哪个省的    | 合肥市是安徽省的城市 |
            | 合肥是安徽的城市吗   | 合肥市是安徽省的城市                            | BodyTemplate1  | 合肥是安徽的城市吗| 合肥市是安徽省的城市 |
            | 中国的直辖市有哪些   | 中国的直辖市有：北京市、上海市、天津市、重庆市 | BodyTemplate1  | 中国的直辖市有哪些| 中国的直辖市有：北京市、上海市、天津市、重庆市 |
            | 北京是直辖市吗       | 北京市是四大直辖市之一                           | BodyTemplate1  | 北京是直辖市吗    | 北京市是四大直辖市之一 |

    @ExtraCase  @ClassicName
    场景大纲: 经典名句-经典名句
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【经典名句】技能已打开

        # 模拟用户说出【关于励志的经典句子】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【<template_type>】，参数【token】不为空，参数【mainTile】为【<main_title>】，参数【subTile】为空，参数【textField】不为空
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content         | template_type | main_title|
            | 关于励志的经典句子     | BodyTemplate1  | 经典名言   |
            | 丘吉尔的名言           | BodyTemplate1  | 经典名言   |
            | 鲁滨逊漂流记里面的名句 | BodyTemplate1  | 经典名言   |
            | 清代时期有什么名言     | BodyTemplate1  | 经典名言   |
            | 说个美国的名言         | BodyTemplate1  | 经典名言   |
            | 随便说个名言           | BodyTemplate1  | 经典名言   |

    @ExtraCase  @36KryptonNews
    场景大纲: 36氪快讯-打开快讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【36氪快讯】技能已打开

        # 模拟用户说出【打开36氪快讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放36氪快讯，以下是最新科技新闻】
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

        例子:     语料
            | voice_content |
            | 打开36氪快讯       |
            | 开启36氪快讯       |
            | 进入36氪快讯       |
            | 开始36氪快讯       |
            | 36氪快讯         |

    @ExtraCase  @36KryptonNews
    场景大纲: 36氪快讯-暂停/恢复快讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【36氪快讯】技能已打开

        # 模拟用户说出【36氪快讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开36氪快讯】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放36氪快讯，以下是最新科技新闻】
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

        # 模拟用户说出【暂停】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<stop_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【继续播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<play_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 服务端下发意图
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | stop_content | play_content |
            | 暂停           | 继续           |
            | 暂停播放         | 继续播放         |
            | 停止播放         | 接着播          |

    @ExtraCase  @36KryptonNews
    场景大纲: 36氪快讯-上一条/下一条快讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【36氪快讯】技能已打开

        # 模拟用户说出【36氪快讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【打开36氪快讯】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放36氪快讯，以下是最新科技新闻】
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

        # 模拟用户说出【下一条】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<next_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【上一条】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<pre_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】
        # 再回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | pre_content | next_content |
            | 上一个         | 下一个          |
            | 上一首         | 下一首          |
            | 上一条         | 下一条          |

    @ExtraCase  @running
    场景大纲: 智能跑走-智能跑走
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能跑走】技能已打开

        # 模拟用户说出【智能跑走】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【即将播放韵律跑节奏音乐】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

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
            | voice_content |
            | 智能跑走       |
            | 打开智能跑走   |
            | 开启智能跑走   |
            | 进入智能跑走   |
            | 开始智能跑走   |

    @ExtraCase  @Newsletter
    场景大纲: 数闻简讯-数闻简讯
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【数闻简讯】技能已打开

        # 模拟用户说出【数闻简讯】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【听新闻，就在数闻简讯】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【最近的新闻内容】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<ask>】
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

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【退出】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | ask               |
            | 数闻简讯       | 我想听新闻         |
            | 打开数闻简讯   | 有没有时政新闻     |
            | 开启数闻简讯   | 最近的新闻内容     |
            | 进入数闻简讯   | 最近有什么新闻     |
            | 开始数闻简讯   | 最近有什么娱乐新闻 |

    @ExtraCase  @Event
    场景: Event，header中参数【name】为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        当        iFlyOS客户端发送event【SpeechRecognizer】，【WrongName】
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法header】

    @ExtraCase  @Event
    场景: Event，header中参数【namespace】为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        当        iFlyOS客户端发送event【WrongNameSpace】，【Recognize】
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法header】

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【profile】为【CLOSE_TALK】
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【profile】为【CLOSE_TALK】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【profile】为【NEAR_FIELD】
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【profile】为【NEAR_FIELD】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【profile】为【FAR_FIELD】
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【profile】为【FAR_FIELD】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【profile】为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【profile】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法profile】

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【format】为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【format】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法format】

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【initiator】【type】为【PRESS_AND_HOLD】
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【initiator】【type】为【PRESS_AND_HOLD】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【initiator】【type】为【TAP】
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【initiator】【type】为【TAP】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【initiator】【type】为【WAKEWORD】
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【initiator】【type】为【WAKEWORD】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【initiator】【type】为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【initiator】【type】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法type】

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【initiator】【payload】【wakeWordIndices】【startIndexInSamples】为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【initiator】【type】为【WAKEWORD】，参数【initiator】【payload】【wakeWordIndices】【startIndexInSamples】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法startIndexInSamples】

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【initiator】【payload】【wakeWordIndices】【endIndexInSamples】为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，参数【initiator】【type】为【WAKEWORD】，参数【initiator】【payload】【wakeWordIndices】【endIndexInSamples】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法endIndexInSamples】

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【initiator】【payload】【token】为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开

        # 模拟用户说出【打开成语接龙】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【嗨，我们来玩成语接龙吧，你先说一个成语。】
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【瓜田李下】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【瓜田李下】，参数【initiator】【payload】【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法endIndexInSamples】

    @ExtraCase  @Recognize
    场景: 语音识别，payload中参数【profile】，【format】，【initiator】【type】，【initiator】【payload】【wakeWordIndices】【startIndexInSamples】，【initiator】【payload】【wakeWordIndices】【endIndexInSamples】，【initiator】【payload】【token】为空值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【成语接龙】技能已打开

        # 模拟用户说出【打开成语接龙】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【嗨，我们来玩成语接龙吧，你先说一个成语。】
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【瓜田李下】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【瓜田李下】，参数【profile】，【format】，【initiator】【type】，【initiator】【payload】【wakeWordIndices】【startIndexInSamples】，【initiator】【payload】【wakeWordIndices】【endIndexInSamples】，【initiator】【payload】【token】为空值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法wakeWordIndices】

    @ExtraCase  @Recognize
    场景: 语音识别，payload为空
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，payload为空
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @Recognize
    场景: 语音识别，multipart里只有metadata，没有audio
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，multipart里只有metadata，没有audio
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @Recognize
    场景: 语音识别，multipart里只有audio，没有metadata
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，multipart里只有audio，没有metadata，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @Recognize
    场景: 语音识别，header没有Boundary
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，header没有Boundary，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @Recognize
    场景: 语音识别，header里的Boundary与各part的Boundary不一致
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，header里的Boundary与各part的Boundary不一致，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @Recognize
    场景: 语音识别，最后一part没有结束Boundary，使用了间隔Boundary
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，最后一part没有结束Boundary，使用了间隔Boundary，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-初次启动时，从IDLE状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】，使用以下PlaybackState上下文
            | token | offsetInMilliseconds | playerActivity |
            | NULL  | 0                    | IDLE           |
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-正在缓冲被清空播放队列，从BUFFER_UNDERRUN状态切换到STOPPED状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端音乐正在缓冲

        # 模拟用户说出【清空播放队列】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【清空播放队列】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【ClearQueue】，参数【clearBehavior】为【CLEAR_ALL】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器状态为【STOP】

    @ExtraCase  @AudioPlayer # pause 500
    场景: 音乐点播-播放中被对话打断然后停止，从PLAY状态切换到PAUSED状态，从PAUSED状态切换到STOPPED状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【停止播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器状态为【STOP】

    @ExtraCase  @AudioPlayer # pause 500
    场景: 音乐点播-播放中被停止后再开始播放，从PLAY状态切换到STOPPED状态，从STOPPED状态切换到PLAY状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【停止播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

        # 模拟用户说出【继续播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【继续播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器状态为【Play】

    @ExtraCase  @AudioPlayer # PlaybackFailed 500
    场景: 音乐点播-音乐播放失败，从PLAY状态切换到STOPPED状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFailed】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器状态为【STOP】

    @ExtraCase  @AudioPlayer # PlaybackFailed 500
    场景: 音乐点播-下一首歌播放失败
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放链接音乐

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器列表不为空
        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【ENQUEUE】

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复下一首歌播放失败
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFailed】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器列表不为空
        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【1】
        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】

    @ExtraCase  @AudioPlayer # PlaybackNearlyFinished 200
    场景: 音乐点播-链接播一首歌播放直到结束，从PLAY状态切换到FINISHED状态
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【204】成功

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送查询状态请求
        那么      iFlyOS服务端音乐播放器列表不为空
        那么      iFlyOS服务端音乐播放器列表的列表偏移量为【0】
        那么      iFlyOS服务端音乐播放器列表的歌曲偏移量为【0】
        那么      iFlyOS服务端音乐播放器状态为【FINISHED】

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-链接播放，带progressReportDelayInMilliseconds
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

#        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，【progressReportDelayInMilliseconds】为【2000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复播放进度
        当       用户等待2秒
        当        iFlyOS客户端发送event【AudioPlayer】，【ProgressReportDelayElapsed】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【停止播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-链接播放，带progressReportDelayInMilliseconds，但没有回复ProgressReportDelayElapsed事件
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，【progressReportDelayInMilliseconds】为【2000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复播放进度
        当       用户等待5秒

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【停止播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【停止播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播放，带progressReportIntervalInMilliseconds，但没有回复ProgressReportIntervalElapsed事件
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的稻香】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的稻香】
        那么      iFlyOS服务端回复状态为【200】成功

#        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content |
            | 周杰伦       |
            | 稻香        |
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，参数【progressReportIntervalInMilliseconds】为【30000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 不回复播放进度，超过progressReportIntervalInMilliseconds的值，再加上10秒
        当       用户等待40秒

        # 模拟用户说出【继续播放】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【继续播放】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，参数【progressReportIntervalInMilliseconds】为【30000】

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-播放流式音乐，PlaybackStarted事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-播放流式音乐，PlaybackStarted事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-播放流式音乐，PlaybackStarted事件payload中的token和offsetInMilliseconds为空值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，参数【token】，【offsetInMilliseconds】为空值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer  @wip
    场景: 音乐点播-播放流式音乐，PlaybackStarted事件payload为空值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的歌】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，带Binary Audio Attachment

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】，payload为空值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackNearlyFinished事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackNearlyFinished事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播放，带progressReportDelayInMilliseconds，ProgressReportDelayInMilliseconds事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，【progressReportDelayInMilliseconds】为【2000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复播放进度
        当       用户等待2秒
        当        iFlyOS客户端发送event【AudioPlayer】，【ProgressReportDelayElapsed】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播放，带progressReportDelayInMilliseconds，ProgressReportDelayInMilliseconds事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，【progressReportDelayInMilliseconds】为【2000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复播放进度
        当       用户等待2秒
        当        iFlyOS客户端发送event【AudioPlayer】，【ProgressReportDelayElapsed】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播放，带progressReportIntervalInMilliseconds，ProgressReportIntervalElapsed事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，【progressReportIntervalInMilliseconds】为【1000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复播放进度
        当       用户等待1秒
        当        iFlyOS客户端发送event【AudioPlayer】，【ProgressReportIntervalElapsed】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播放，带progressReportIntervalInMilliseconds，ProgressReportIntervalElapsed事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】，【progressReportIntervalInMilliseconds】为【1000】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复播放进度
        当       用户等待1秒
        当        iFlyOS客户端发送event【AudioPlayer】，【ProgressReportIntervalElapsed】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackStutterStarted事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackStutterStarted事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackStutterFinished事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackStutterFinished事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackStutterFinished事件payload中的stutterDurationInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】，参数【stutterDurationInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackStutterFinished事件payload中缺少stutterDurationInMilliseconds
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】，缺少参数【stutterDurationInMilliseconds】
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackFinished事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【204】成功

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-链接播一首歌播放直到结束，PlaybackFinished事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 模拟用户说出【我要听周杰伦的简单爱】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听周杰伦的简单爱】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        # 回复开始播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】

        # 回复即将播放结束
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackNearlyFinished】
        那么      iFlyOS服务端回复状态为【204】成功

        # 回复结束播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackFinished】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音频播放器-pause//暂停播放，PlaybackStopped事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【暂停】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音频播放器-pause//暂停播放，PlaybackStopped事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音频播放器】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 模拟用户说出【暂停】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Stop】
        # 回复停止播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStopped】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-播放中被对话打断再恢复，PlaybackPaused事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-播放中被对话打断再恢复，PlaybackPaused事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-播放中被对话打断再恢复，PlaybackResumed事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【你好】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【你好】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】，参数【offsetInMilliseconds】为【60000】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-播放中被对话打断再恢复，PlaybackResumed事件payload中的offsetInMilliseconds为负数
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开
        假如      iFlyOS客户端正在播放音乐

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackPaused】，参数【offsetInMilliseconds】为【60000】
        那么      iFlyOS服务端回复状态为【200】成功
        # 模拟用户说出【你好】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【你好】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 回复暂停播放状态
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackResumed】，参数【offsetInMilliseconds】为【60000】，参数【offsetInMilliseconds】为负数
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-若音频无法访问/音频资源无效，则自动过滤掉这个音频，请求下一个音频资源
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 谢春花的第四首Summer Bossa，资源有问题
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听谢春花的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放谢春花的新屋】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

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

    @ExtraCase  @AudioPlayer
    场景: 音乐点播-若无访问音频的权限，则自动过滤掉这个音频，请求下一个音频资源
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【音乐】技能已打开

        # 我要听刘若英的歌，第一首是无版权歌曲【后来】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听刘若英的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 很爱很爱你，无版权歌曲。所以此时会播放刘若英的很爱很爱你 (Live)
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听刘若英的很爱很爱你】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放刘若英的很爱很爱你 (Live)】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【我要听王菲的歌】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderPlayerInfo】
        那么      iFlyOS服务端回复的directive为【AudioPlayer】，【Play】，参数【playBehavior】为【REPLACE_ALL】

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【为你播放】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStarted】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【AudioPlayer】，【PlaybackStutterFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 王菲的第二首【匆匆那年】，无版权信息
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

    @ExtraCase  @Chatting
    场景: 闲聊技能，SpeechStarted事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【闲聊】技能已打开

        # 模拟用户说出【你好】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【你好】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @Chatting
    场景: 闲聊技能，SpeechFinished事件payload中的token为错误值
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【闲聊】技能已打开

        # 模拟用户说出【你好】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【你好】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含随机内容
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】，参数【token】为错误值
        那么      iFlyOS服务端回复状态为【400】错误，而且参数【error】为【非法payload】

    @ExtraCase  @Alerts
    场景: 设置闹钟/提醒-设置闹钟失败
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器&闹钟】技能已打开

        # 模拟用户说出【提醒我中午十二点吃饭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【提醒我中午十二点吃饭】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务下发意图
        那么      iFlyOS服务端回复的directive为【Alerts】，【SetAlert】
        当        iFlyOS客户端发送event【Alerts】，【SetAlertFailed】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【?】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Alerts
    场景大纲: 设置闹钟/提醒-设置闹钟成功
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【设置闹钟/提醒】技能已打开

        # 模拟用户说出【提醒我中午十二点吃饭】的识别过程
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
            | 昨天中午十一点叫我开会   | 不能设置过去时间的闹钟 |

    @ExtraCase  @Alerts
    场景: 设置闹钟/提醒-删除闹钟失败
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【计时器&闹钟】技能已打开

        # 模拟用户说出【删除十二点钟的闹钟】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【删除十二点钟的闹钟】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【Alerts】，【DeleteAlert】
        当        iFlyOS客户端发送event【Alerts】，【DeleteAlertFailed】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【?】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

    @ExtraCase  @Weather
    场景大纲: 查询的天气的日期不在未来一周内
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【天气】技能已打开

        # 模拟用户说出【昨天天气怎么样】
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【WeatherTemplate】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content             |
            | 七天以后的天气我还不知道            |
            | 我只有七天的预言能力，试试问我七天以内的天气吧 |
            | 试试问我七天以内的天气吧            |
            | 我只有一周的预言能力，试试问我一周以内的天气吧 |
            | 我还不能查询以前的天气             |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 昨天天气怎么样        |
            | 2018年2月1日气温怎么样 |
            | 昨天温度怎么样        |
            | 查询昨天天气         |
            | 查询昨天气温         |
            | 查询昨天温度         |
            | 昨天什么天气         |
            | 昨天天气           |
            | 昨天气温           |
            | 昨天温度           |
            | 昨天热吗           |
            | 昨天热不热          |
            | 昨天冷吗           |
            | 昨天冷不冷          |
            | 1月1号下雨吗        |
            | 下周日可以洗车吗       |
            | 前天需要带伞吗        |
            | 昨天能穿白鞋吗        |


