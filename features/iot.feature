# Created by enrico at 2018/7/26
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 事件服务模块测试
    ============================================

# 典型用例

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{turn_on}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备      |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开空调       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{turn_on}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开卧室空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开卧室空调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{turn_on}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开格力空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开格力空调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{iwant}{turn_on}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我打开空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我打开空调    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{iwant}{turn_on}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我打开客厅空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content    |
            | 帮我打开客厅空调  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{iwant}{turn_on}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我打开格力空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content     |
            | 帮我打开格力空调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{iwant}{device_type}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把空调打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把空调打开     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{iwant}{zone}{device_type}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室空调打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 把卧室空调打开  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-打开设备开关-{iwant}{brand}{device_type}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力空调打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已开启        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                   |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 把格力空调打开  |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-打开设备开关-设备已打开
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开
        假如      从文件【device_type.txt】里所有{device_type}已打开

        # 模拟用户说出【打开空调】的识别过程
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
            | 打开空调       | 空调已经打开 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{turn_off}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【关闭空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 关闭空调        |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{turn_off}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【关闭卧室空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 关闭卧室空调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{turn_off}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【关闭格力空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 关闭格力空调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{turn_off}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我关闭空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我关闭空调    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{turn_off}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我关闭客厅空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我关闭客厅空调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{turn_off}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我关闭格力空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   |
            | 帮我关闭格力空调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{device_type}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把空调关闭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把空调关闭      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{zone}{device_type}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室空调关闭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把卧室空调关闭  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{brand}{device_type}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室空调关闭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 开关控制     | 设备已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把格力空调关闭       |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-关闭设备开关-设备已关闭
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开
        假如      从文件【device_type.txt】里所有{device_type}已关闭

        # 模拟用户说出【关闭空调】的识别过程
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
            | 关闭空调       | 空调已经关闭      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把电灯亮度设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把电灯亮度设置10     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{zone}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室电灯亮度设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把卧室电灯亮度设置10   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{brand}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把美的电灯亮度设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把美的电灯亮度设置10   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室空调关闭】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电灯亮度设置10      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{zone}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室电灯亮度设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室电灯亮度设置10    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{brand}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【美的电灯亮度设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 美的电灯亮度设置10    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{set}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<brightness_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content | brightness_value | tts_content |
            | 设置台灯的亮度 |  50                | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{set}{zone}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置卧室台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<brightness_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content      | brightness_value | tts_content |
            | 设置卧室台灯的亮度  | 50                 | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{set}{brand}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置美的台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<brightness_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content      | brightness_value | tts_content |
            | 设置美的台灯的亮度  | 50                 | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{set}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<brightness_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content      | brightness_value | tts_content |
            | 帮我设置台灯的亮度  | 50                 | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{set}{zone}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置卧室台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<brightness_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content          | brightness_value | tts_content |
            | 帮我设置卧室台灯的亮度 |  50                 | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{set}{brand}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置美的台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<brightness_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content            | brightness_value | tts_content |
            | 帮我设置美的台灯的亮度   | 50                  | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-亮度值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把电灯亮度设置101】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<brightness_value>】，追问回复【<tts_content>】
            | asked |
            | 小飞没法给您的电灯设置这个亮度 |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content     | brightness_value | tts_content |
            | 把电灯亮度设置101  | 50                 | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{iwant}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要把灯设置黄色】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要把灯设置黄色      |
            | 我要把灯颜色设置黄色    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{iwant}{brand}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把美的灯颜色设为红色】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把美的的灯颜色设为红色 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{iwant}{zone}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室的灯颜色调到红色】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把卧室的灯颜色调到红色 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【灯调到红色】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 灯调到红色         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{brand}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【美的灯调到红色】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 美的灯调到红色       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{zone}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室灯调到红色】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室灯调到红色       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要把空调调到20度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content       | number |
            | 我要把空调调到       | 20     |
            | 我要把空调温度调到   | 20     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{zone}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要把卧室空调调到20度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content      | number |
            | 我要把客厅空调调到  | 20     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{brand}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要把格力空调调到20度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】

        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content     | number |
            | 我要把格力空调调到 |  20     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调温度调到20度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | number |
            | 空调温度调到   | 20     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{zone}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室空调温度调到20度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | number |
            | 客厅空调温度调到 | 20     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{brand}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调温度调到20度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | number |
            | 格力空调温度调到 | 20     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{set}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置空调温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content | temperature_value | tts_content |
            | 设置空调温度    | 20                  | 好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{set}{zone}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置客厅空调温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | temperature_value | tts_content |
            | 设置客厅空调温度  | 20                  | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{set}{brand}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置格力空调温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content   | temperature_value | tts_content |
            | 设置格力空调温度  | 20                 | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{set}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置空调温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | temperature_value | tts_content |
            | 帮我设置空调温度  | 20                  |  好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{set}{zone}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置客厅空调温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content          | temperature_value | tts_content |
            | 帮我设置客厅空调温度    | 20                  |  好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{set}{brand}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置格力空调温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content       | temperature_value | tts_content |
            | 帮我设置格力空调温度 |  20                 |  好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调设置温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content | temperature_value | tts_content |
            | 空调设置温度    | 20                  | 好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{zone}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【客厅空调设置温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | temperature_value | tts_content |
            | 客厅空调设置温度  | 20                  |  好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{brand}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调设置温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content     | temperature_value | tts_content |
            | 格力空调设置温度   | 20                  |  好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把空调设置温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content        | temperature_value | tts_content |
            | 帮我把空调设置温度    | 20                  |  好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{zone}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把客厅空调设置温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content       | temperature_value | tts_content |
            | 把客厅空调设置温度   |  20                 |  好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{brand}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力空调设置温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | temperature_value | tts_content |
            | 把格力空调设置温度  | 20                  | 好的        |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-温度设置-温度值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调温度调到101度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content      | temperature_value | tts_content |
            | 空调温度调到101度   | 20度                |  好的         |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-温度设置-温度值超出范围且追问也超过范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调温度调到101度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<temperature_value>】，追问回复【<tts_content>】
            | asked |
            | 小飞没法给您的空调设置这个温度 |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content        | temperature_value | tts_content     |
            | 空调温度调到101度    | 50度                 | 小飞没法给您的空调设置这个温度呢 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{device_type}的温度{add}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往上调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 空调的温度往上调一点    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{zone}{device_type}的温度{add}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【客厅空调的温度往上调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 客厅空调的温度往上调一点  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{brand}{device_type}的温度{add}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调的温度往上调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力空调的温度往上调一点  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往上调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   | number |
            | 空调的温度往上调 |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{zone}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【客厅空调的温度往上调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content         | number |
            | 客厅空调的温度往上调   | 1       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{brand}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调的温度往上调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content         | number |
            | 格力空调的温度往上调   |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{iwant}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把空调的温度往上调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content           | number |
            | 帮我把空调的温度往上调   | 1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{iwant}{zone}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室空调的温度往上调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content              | number |
            | 帮我把客厅空调的温度往上调 | 1       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{iwant}{brand}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室空调的温度往上调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content             | number |
            | 帮我把格力空调的温度往上调 |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{add}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调空调的温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content    |
            | 往上调空调的温度  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{add}{zone}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调卧室空调的温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调卧室空调的温度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-{add}{brand}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调格力空调的温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调格力空调的温度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调高-温度已最高时继续调高
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往上调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |
            | 小飞没法给您的空调设置这个温度呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 空调温度调到30      |
            | 空调的温度往上调一点    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{device_type}的温度{minor}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往下调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 空调的温度往下调一点    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{brand}{device_type}的温度{minor}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调的温度往下调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力空调的温度往下调一点  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{zone}{device_type}的温度{minor}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【客厅空调的温度往下调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 客厅空调的温度往下调一点  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往下调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content    |  number |
            | 空调的温度往下调  |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{zone}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【客厅空调的温度往下调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content          |  number |
            | 客厅空调的温度往下调    |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{brand}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调的温度往下调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content           | number |
            | 格力空调的温度往下调    |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{iwant}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把空调的温度往下调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content          |number |
            | 帮我把空调的温度往下调 | 1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{iwant}{zone}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室空调的温度往下调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content              | number |
            | 帮我把卧室空调的温度往下调 |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{iwant}{brand}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室空调的温度往下调1度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content              |  number |
            | 帮我把格力空调的温度往下调 |  1      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{minor}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调空调的温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调空调的温度      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{minor}{zone}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调卧室空调的温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调卧室空调的温度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-{minor}{brand}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调格力空调的温度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调格力空调的温度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-温度调低-温度已最低时继续调低
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往上调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 温度控制     | 温度设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |
            | 小飞没法给您的空调设置这个温度呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 空调温度调到16      |
            | 空调的温度往下调一点    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{device_type}风[速]{set}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【风扇风设置1】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
#            | 风扇风设置1        |
            | 风扇风速设置1       |
#            | 风扇风设置1档       |
#            | 风扇风速设置1档     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{zone}{device_type}风[速]{set}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室风扇风速设置1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室风扇风速设置1档    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{brand}{device_type}风[速]{set}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力风扇风速设置1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力风扇风速设置1档    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【风扇设置1档风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 风扇设置1档风速  |
            | 风扇设置1档风力  |
            | 风扇设置1档风    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{zone}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室风扇设置1档风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室风扇设置1档风速 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{brand}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力风扇设置1档风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力风扇设置1档风速    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把风扇设置1档风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把风扇设置1档风速   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{brand}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力风扇设置1档风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把格力风扇设置1档风速 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{zone}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室风扇设置1档风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把卧室风扇设置1档风速 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{set}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置空调风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content | wind_value | tts_content |
            | 设置空调风速   |1             | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{set}{zone}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置客厅空调风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content   | wind_value | tts_content |
            | 设置客厅空调风速 | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{set}{brand}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置格力空调风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content   | wind_value | tts_content |
            | 设置格力空调风速 | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{set}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置空调风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | wind_value | tts_content |
            | 帮我设置空调风速  | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{set}{zone}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置客厅空调风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content        | wind_value | tts_content |
            | 帮我设置客厅空调风速 | 2            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{set}{brand}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置格力空调风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content         | wind_value | tts_content |
            | 帮我设置格力空调风速  | 2            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调设置风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content | wind_value | tts_content |
            | 空调设置风速   | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{zone}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【客厅空调设置风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content   | wind_value | tts_content |
            | 客厅空调设置风速 | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{brand}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调设置风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | wind_value | tts_content |
            | 格力空调设置风速  | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把空调设置风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content      | wind_value | tts_content |
            | 帮我把空调设置风速  | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{zone}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把客厅空调设置风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content     | wind_value | tts_content |
            | 把客厅空调设置风速 | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{brand}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力空调设置风速】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content   | wind_value | tts_content |
            | 把格力空调设置风速 | 2           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速设置-风速值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调风速调到20档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<wind_value>】，追问回复【<tts_content>】
            | asked |
            | 小飞没法给您的空调设置这个风速 |
            | 没有找到这个设备   |


        例子:     语料
            | voice_content   | wind_value | tts_content |
            | 空调风速调到20档 | 2档          | 好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【风扇风往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 风扇风往上调        |
            | 风扇风速往上调      |
            | 风扇速度往上调      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{zone}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室风扇风速往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室风扇风速往上调     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{brand}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力风扇风速往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力风扇风速往上调     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把风扇风速往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把空调风速往上调    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{zone}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室的风扇风速往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把卧室的风扇风速往上调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{brand}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力风扇风速往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把格力风扇风速往上调  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【风扇风速往上调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 风扇风速往上调1  |
            | 风扇风速往上调1档  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{zone}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室风扇风速往上调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室风扇风速往上调1档   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{brand}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力风扇风速往上调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力风扇风速往上调1档   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把风扇风速往上调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把风扇风速往上调1档  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{zone}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室风扇风速往上调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我把卧室风扇风速往上调1档 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{brand}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力风扇风速往上调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我把格力风扇风速往上调1档 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【风扇风往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 风扇风往下调        |
            | 风扇风速往下调       |
            | 风扇速度往下调       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{zone}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室风扇风速往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室风扇风速往下调     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{brand}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力风扇风速往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力风扇风速往下调     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把风扇风速往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把风扇风速往下调    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{zone}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室的风扇风速往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把卧室的风扇风速往下调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{brand}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力风扇风速往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把格力风扇风速往下调  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【风扇风速往下调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 风扇风速往下调1档     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{zone}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室风扇风速往下调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室风扇风速往下调1档   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{brand}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力风扇风速往下调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力风扇风速往下调1档   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把风扇风速往下调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把风扇风速往下调1档  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{zone}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室风扇风速往下调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我把卧室风扇风速往下调1档 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{brand}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力风扇风速往下调1档】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 风速控制     | 风速设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我把格力风扇风速往下调1档 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机音量设置10     |
            | 电视机声音设置20     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{zone}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室电视机音量设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室电视机音量设置10   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{brand}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【海信电视机音量设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 海信电视机音量设置10  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把电视机音量设置10  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{zone}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把电视机音量设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我把卧室电视机音量设置10 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{brand}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把海信电视机音量设置10】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   |
            | 帮我把海信电视机音量设置10 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{set}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置电视音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content |volume_value | tts_content |
            | 设置电视音量    | 20           | 好的          |
            | 设置电视声音    | 30           | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{set}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置客厅电视音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content   | volume_value | tts_content |
            | 设置客厅电视音量 | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{set}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置格力电视音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | volume_value | tts_content |
            | 设置格力电视音量  | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{set}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置电视音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | volume_value | tts_content |
            | 帮我设置电视音量  | 20             | 好的         |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{set}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置客厅电视音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content          | volume_value | tts_content |
            | 帮我设置客厅电视音量    | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{set}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我设置格力电视音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content        | volume_value | tts_content |
            | 帮我设置格力电视音量 | 20             | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视设置音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content | volume_value | tts_content |
            | 电视设置音量   | 20             | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{zone}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【客厅电视设置音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content      | volume_value | tts_content |
            | 客厅电视设置音量    | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{brand}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力电视设置音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content    | volume_value | tts_content |
            | 格力电视设置音量  | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把电视设置音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content     | volume_value | tts_content |
            | 帮我把电视设置音量 | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{zone}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把客厅电视设置音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content      | volume_value | tts_content |
            | 把客厅电视设置音量  | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{brand}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力电视设置音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 请问您想调到多少   |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content     | volume_value | tts_content |
            | 把格力电视设置音量 | 20            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量设置-音量值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量调到101】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一且判断是否追问，追问值【<volume_value>】，追问回复【<tts_content>】
            | asked |
            | 小飞没法给您的电视设置这个音量 |
            | 没有找到这个设备   |

        例子:     语料
            | voice_content   | volume_value | tts_content |
            | 电视音量调到101  | 50            | 好的          |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机音量往上调      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{zone}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室的电视机音量往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室的电视机音量往上调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{brand}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力电视机音量往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力电视机音量往上调  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{iwant}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把电视机音量往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把电视机音量往上调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{iwant}{zone}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室的电视机音量往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我把卧室的电视机音量往上调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{iwant}{brand}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力电视机音量往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   |
            | 帮我把格力电视机音量往上调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{add}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调电视机音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调电视机音量      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{add}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调卧室的电视机音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调卧室的电视机音量   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调大-{add}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调格力电视机音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调格力电视机音量  |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-音量调大-音量值最大时继续调节音量
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量设大点】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【电视音量调到100】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

         # 模拟用户说出【电视机音量设大点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 没有找到这个设备       |
            | 小飞没法给您的电视设置这个音量呢 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视音量设大点       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机音量往下调      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{zone}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室的电视机音量往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室的电视机音量往下调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{brand}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力电视机音量往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力电视机音量往下调  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{iwant}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把电视机音量往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把电视机音量往下调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{iwant}{zone}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室的电视机音量往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content  |
            | 帮我把卧室的电视机音量往下调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{iwant}{brand}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力电视机音量往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content   |
            | 帮我把格力电视机音量往下调 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{minor}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调电视机音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调电视机音量      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{minor}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调卧室的电视机音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调卧室的电视机音量   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-音量调小-{minor}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调格力电视机的音量】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 音量设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调格力电视机的音量  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{device_type}{set}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机设置静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机设置静音       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{brand}{device_type}{set}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【长虹电视机设置静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 长虹电视机设置静音    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{zone}{device_type}{set}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室电视机设置静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室电视机设置静音     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{device_type}关闭声音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机关闭声音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机关闭声音       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{zone}{device_type}关闭声音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室的电视机关闭声音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室的电视机关闭声音    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{brand}{device_type}关闭声音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力电视机关闭声音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力电视机关闭声音   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{device_type}(静音|设为无声)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机静音         |
            | 电视机设置无声     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{zone}{device_type}(静音|设为无声)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室的电视机静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室的电视机静音      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-设置静音-{brand}{device_type}(静音|设为无声)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力电视机静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已静音            |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力电视机静音     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-取消静音-{device_type}{turn_off}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机关上静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已取消静音        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机关上静音    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-取消静音-{brand}{device_type}{turn_off}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【TCL电视机关上静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已取消静音        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | TCL电视机关上静音    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-取消静音-{zone}{device_type}{turn_off}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【主卧电视机关上静音】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已取消静音        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 主卧电视机关上静音     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-取消静音-{device_type}声音{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机声音打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已取消静音        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 电视机声音打开       |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-取消静音-{brand}{device_type}声音{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【海信电视机声音打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已取消静音        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 海信电视机声音打开    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-取消静音-{zone}{device_type}声音{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室电视机声音打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 音量控制     | 已取消静音        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室电视机声音打开     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{device_type}{set}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调设置制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 空调设置制冷模式  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{zone}{device_type}{set}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【主卧的空调设置制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 主卧的空调设置制冷模式   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{brand}{device_type}{set}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调设置制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力空调设置制冷模式    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{set}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置空调制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 设置空调制冷模式      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{set}{zone}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置主卧空调制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 设置主卧空调制冷模式    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{set}{brand}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【设置格力空调制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 设置格力空调制冷模式    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{turn_on}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开空调的制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开空调的制冷模式     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{turn_on}{zone}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开主卧空调的制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开主卧空调的制冷模式   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{turn_on}{brand}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开格力空调的制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 打开格力空调的制冷模式   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{brand}{device_type}{turn_on}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调打开制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力空调打开制冷模式    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{device_type}{mode}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调制冷模式打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 空调制冷模式打开      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{zone}{device_type}{mode}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【主卧空调的制冷模式打开】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 主卧空调的制冷模式打开   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-模式设置-{brand}{device_type}{mode}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开格力空调的制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content           |
            | 好的                    |
            | 没有找到这个设备       |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力空调的制冷模式打开   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{turn_off}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【关上空调的制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 关上空调的制冷模式     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{turn_off}{zone}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【关上卧室空调的制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 关上卧室空调的制冷模式   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{turn_off}{brand}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【关上格力空调的制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 关上格力空调的制冷模式   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{brand}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调关上制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力空调关上制冷模式    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{device_type}{mode}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的制冷模式关上】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 空调的制冷模式关上     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{zone}{device_type}{mode}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室空调的制冷模式关上】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室空调的制冷模式关上   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{brand}{device_type}{mode}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力空调的制冷模式关上】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力空调的制冷模式关上   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{iwant}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把空调关上制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把空调关上制冷模式   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{iwant}{zone}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把卧室空调关上制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把卧室空调关上制冷模式 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-关闭模式-{iwant}{brand}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把格力空调关上制冷模式】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 模式控制     | 模式已关闭        |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的              |
            | 没有找到这个设备 |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把格力空调关上制冷模式 |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        #
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 台灯调亮一点        |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{zone}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室台灯调亮一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{brand}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力台灯调亮一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把台灯调亮一点     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{zone}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室台灯调亮一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{brand}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力台灯调亮一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调亮台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 调亮台灯的光        |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调亮卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 调亮卧室台灯的光      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调亮格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 调亮格力台灯的光      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}调亮{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调亮台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要调亮台灯的光      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}调亮{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调亮卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要调亮卧室台灯的光    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调亮格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要调亮格力台灯的光    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 台灯光往上调        |
            | 台灯亮度往上调       |
            | 台灯的亮度往上调      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{zone}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯的亮度往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室台灯的亮度往上调      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{brand}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【美的台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 美的台灯光往上调      |
            | 美的台灯亮度往上调     |
            | 美的台灯的光往上调     |
            | 美的台灯的亮度往上调    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把台灯亮度往上调      |
            | 把台灯的亮度往上调     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{zone}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把卧室台灯光往上调     |
            | 把卧室台灯亮度往上调    |
            | 把卧室台灯的光往上调    |
            | 把卧室台灯的亮度往上调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{brand}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把格力台灯光往上调     |
            | 把格力台灯亮度往上调    |
            | 把格力台灯的光往上调    |
            | 把格力台灯的亮度往上调  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{add}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调台灯光        |
            | 往上调台灯亮度       |
            | 往上调台灯的光       |
            | 往上调台灯的亮度     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{add}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调卧室台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调卧室台灯光      |
            | 往上调卧室台灯的光     |
            | 往上调卧室台灯亮度     |
            | 往上调卧室台灯的亮度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{add}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调美的台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往上调美的台灯光      |
            | 往上调美的台灯的光     |
            | 往上调美的台灯亮度     |
            | 往上调美的台灯的亮度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{add}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往上调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要往上调台灯光      |
            | 我要往上调台灯的光     |
            | 我要往上调台灯亮度     |
            | 我要往上调台灯的亮度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{add}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往上调卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要往上调卧室台灯光    |
            | 我要往上调卧室台灯的光   |
            | 我要往上调卧室台灯亮度   |
            | 我要往上调卧室台灯的亮度  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{add}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往上调格力台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要往上调格力台灯的亮度  |
            | 我要往上调格力台灯的光   |
            | 我要往上调格力台灯亮度   |
            | 我要往上调格力台灯的亮度  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 台灯调暗一点        |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{zone}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室台灯调暗一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{brand}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力台灯调暗一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 帮我把台灯调暗一点     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{zone}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室台灯调暗一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{brand}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 格力台灯调暗一点      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调暗台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 调暗台灯的光        |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调暗卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 调暗卧室台灯的光      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调暗格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 调暗格力台灯的光      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}调暗{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调暗台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要调暗台灯的光      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}调暗{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调暗卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要调暗卧室台灯的光    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调暗格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要调暗格力台灯的光    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 台灯光往下调        |
            | 台灯亮度往下调       |
            | 台灯的亮度往下调      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{zone}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 卧室台灯亮度往下调     |
            | 卧室台灯的亮度往下调    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{brand}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【美的台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 美的台灯光往下调      |
            | 美的台灯亮度往下调     |
            | 美的台灯的光往下调     |
            | 美的台灯的亮度往下调    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把台灯亮度往下调      |
            | 把台灯的亮度往下调     |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{zone}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把卧室台灯光往下调     |
            | 把卧室台灯亮度往下调    |
            | 把卧室台灯的光往下调    |
            | 把卧室台灯的亮度往下调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{brand}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 把格力台灯光往下调     |
            | 把格力台灯亮度往下调    |
            | 把格力台灯的光往下调    |
            | 把格力台灯的亮度往下调   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{minor}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调台灯光        |
            | 往下调台灯亮度       |
            | 往下调台灯的光       |
            | 往下调台灯的亮度      |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{minor}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调卧室台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调卧室台灯光      |
            | 往下调卧室台灯的光     |
            | 往下调卧室台灯亮度     |
            | 往下调卧室台灯的亮度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{minor}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调美的台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 往下调美的台灯光      |
            | 往下调美的台灯的光     |
            | 往下调美的台灯亮度     |
            | 往下调美的台灯的亮度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{minor}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往下调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要往下调台灯光      |
            | 我要往下调台灯的光     |
            | 我要往下调台灯亮度     |
            | 我要往下调台灯的亮度    |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{minor}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往下调卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要往下调卧室台灯光    |
            | 我要往下调卧室台灯的光   |
            | 我要往下调卧室台灯亮度   |
            | 我要往下调卧室台灯的亮度  |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{minor}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往下调格力台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】，参数【token】不为空，参数【title】和【textField】包含以下内容之一
            | title        | text_field       |
            | 执行失败原因 | 未找到设备        |
            | 灯光控制     | 灯光设置成功      |

        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含以下内容之一
            | tts_content    |
            | 好的                  |
            | 没有找到这个设备     |

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content |
            | 我要往下调格力台灯的亮度  |
            | 我要往下调格力台灯的光   |
            | 我要往下调格力台灯光    |
            | 我要往下调格力台灯亮度   |

    @TypicalCase @SmartHome
    场景大纲: 智能家居-找不到设备
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【打开主卧空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【BodyTemplate3】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content |
            | 打开主卧空调   | 我没有找到这个设备，请先在APP添加设备并配置网络  |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-多个相同设备类型但不同设备名称，对设备名称追问
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开
        # 假如      用户产品上存在设备名称为空调1和空调2

        # 模拟用户说出【打开空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【你是想操作空调1，还是空调2呢】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 追问并模拟用户说出【空调1】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<device_name>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【ListTemplate1】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | device_name | tts_content |
            | 打开空调        | 空调1        | 好的          |
            | 关闭空调        | 空调2        | 好的          |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-多个相同设备名称但不同位置，对设备位置追问
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开
        # 假如      用户产品上存在不同位置主卧和客厅都有设备名称为空调1的空调

        # 模拟用户说出【打开空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【你是想操作主卧空调1，还是客厅空调1呢】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 追问并模拟用户说出【主卧】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<zone_name>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【ListTemplate1】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | zone_name | tts_content |
            | 打开空调1       | 主卧        | 好的         |
            | 关闭空调1       | 客厅        | 好的         |

    @TypicalCase @SmartHome @disable
    场景大纲: 智能家居-多个相同设备名称但不同品牌，对设备品牌追问
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开
        # 假如      用户产品上存在不同品牌博联和极联都有设备名称为空调1的空调

        # 模拟用户说出【打开空调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【你是想操作BroadLink空调1，还是Geeklink空调1呢】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        # 追问并模拟用户说出【主卧】的识别过程
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brand_name>】
        那么      iFlyOS服务端回复状态为【200】成功

        那么      iFlyOS服务端回复的directive为【TemplateRuntime】，【RenderTemplate】，参数【type】为【ListTemplate1】
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【好的】

        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | brand_name   | tts_content |
            | 打开空调1       | BroadLink   | 好的          |
            | 关闭空调1       | Geeklink    | 好的          |

# 扩展用例
    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{turn_on}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【打开空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【device_type.txt】里所有语料组合用户语音{turn_on}{device_type}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 打开空调       | 好的         |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{turn_on}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【打开卧室空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【zone.txt和device_type.txt】里所有语料组合用户语音{turn_on}{zone}{device_type}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 打开卧室空调   | 好的         |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{turn_on}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【打开格力空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【brand.txt和device_type.txt】里所有语料组合用户语音{turn_on}{brand}{device_type}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 打开格力空调   | 好的         |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{iwant}{turn_on}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我打开空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【action_wanted.txt和device_type.txt】里所有语料组合用户语音{iwant}{turn_on}{device_type}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 帮我打开空调        | 好的       |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{iwant}{turn_on}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我打开客厅空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【action_wanted.txt、zone.txt和device_type.txt】里所有语料组合用户语音{iwant}{turn_on}{zone}{device_type}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 帮我打开客厅空调      | 好的       |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{iwant}{turn_on}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我打开格力空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【action_wanted.txt、brand.txt和device_type.txt】里所有语料组合用户语音{iwant}{turn_on}{brand}{device_type}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 帮我打开格力空调      | 好的       |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{iwant}{device_type}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把空调打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【action_wanted.txt和device_type.txt】里所有语料组合用户语音{iwant}{device_type}{turn_on}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 把空调打开         | 好的       |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{iwant}{zone}{device_type}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把卧室空调打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【action_wanted.txt、zone.txt和device_type.txt】里所有语料组合用户语音{iwant}{zone}{device_type}{turn_on}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 把卧室空调打开       | 好的       |

    @ExtraCase @SmartHome @open
    场景大纲: 智能家居-打开设备开关-{iwant}{brand}{device_type}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把卧室空调打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【action_wanted.txt、brand.txt和device_type.txt】里所有语料组合用户语音{iwant}{brand}{device_type}{turn_on}，而且回复：【<tts_content>】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 把格力空调打开       | 好的       |

    @ExtraCase @SmartHome @open @disable
    场景大纲: 智能家居-打开设备开关-设备已打开
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开
        假如      从文件【device_type.txt】里所有{device_type}已打开

#        # 模拟用户说出【打开空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【device_type.txt】里所有语料组合用户语音{turn_on}{device_type}，而且回复：【{device_type}已经打开】
            | turn_on |
            | 打开      |
            | 开        |
            | 开一下    |
            | 打开下    |
            | 开下      |
            | 开启      |
            | 开上      |
            | 开一开    |
            | 启动      |
            | 开开      |

        例子:     语料
            | voice_content | tts_content |
            | 打开空调          | 空调已经打开      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{turn_off}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【关闭空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【device_type.txt】里所有语料组合用户语音{turn_off}{device_type}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 关闭空调          | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{turn_off}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【关闭卧室空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【zone.txt和device_type.txt】里所有语料组合用户语音{turn_off}{zone}{device_type}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 关闭卧室空调        | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{turn_off}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【关闭格力空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【brand.txt和device_type.txt】里所有语料组合用户语音{turn_off}{brand}{device_type}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 关闭格力空调        | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{turn_off}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我关闭空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt和device_type.txt】里所有语料组合用户语音{iwant}{turn_off}{device_type}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 帮我关闭空调        | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{turn_off}{zone}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我关闭客厅空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt、zone.txt和device_type.txt】里所有语料组合用户语音{iwant}{turn_off}{zone}{device_type}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 帮我关闭客厅空调      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{turn_off}{brand}{device_type}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我关闭格力空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt、brand.txt和device_type.txt】里所有语料组合用户语音{iwant}{turn_off}{brand}{device_type}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 帮我关闭格力空调      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{device_type}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把空调关闭】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt和device_type.txt】里所有语料组合用户语音{iwant}{device_type}{turn_off}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 把空调关闭         | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{zone}{device_type}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把卧室空调关闭】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt、zone.txt和device_type.txt】里所有语料组合用户语音{iwant}{zone}{device_type}{turn_off}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 把卧室空调关闭       | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭设备开关-{iwant}{brand}{device_type}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把卧室空调关闭】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt、brand.txt和device_type.txt】里所有语料组合用户语音{iwant}{brand}{device_type}{turn_off}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 把格力空调关闭       | 好的       |

    @ExtraCase @SmartHome @disable
    场景大纲: 智能家居-关闭设备开关-设备已关闭
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开
        假如      从文件【device_type.txt】里所有{device_type}已关闭

#        # 模拟用户说出【关闭空调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【device_type.txt】里所有语料组合用户语音{turn_off}{device_type}，而且回复：【{device_type}已经关闭】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 关闭空调          | 空调已经关闭      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把电灯亮度设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{light_device_type}亮度{set}，而且回复：【<tts_content>】
            | set   |
            | 设置10  |
            | 设为50  |
            | 调到100 |

        例子:     语料
            | voice_content | tts_content |
            | 把电灯亮度设置10     | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{zone}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把卧室电灯亮度设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{zone}{light_device_type}亮度{set}，而且回复：【<tts_content>】
            | set   |
            | 设置10  |
            | 设为50  |
            | 调到100 |

        例子:     语料
            | voice_content | tts_content |
            | 把卧室电灯亮度设置10   | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{brand}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把美的电灯亮度设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{brand}{light_device_type}亮度{set}，而且回复：【<tts_content>】
            | set   |
            | 设置10  |
            | 设为50  |
            | 调到100 |

        例子:     语料
            | voice_content | tts_content |
            | 把美的电灯亮度设置10   | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把卧室空调关闭】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【light_device_type.txt】里所有语料组合用户语音{light_device_type}亮度{set}，而且回复：【<tts_content>】
            | set   |
            | 设置10  |
            | 设为50  |
            | 调到100 |

        例子:     语料
            | voice_content | tts_content |
            | 电灯亮度设置10      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{zone}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室电灯亮度设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和light_device_type.txt】里所有语料组合用户语音{zone}{light_device_type}亮度{set}，而且回复：【<tts_content>】
            | set   |
            | 设置10  |
            | 设为50  |
            | 调到100 |

        例子:     语料
            | voice_content | tts_content |
            | 卧室电灯亮度设置10    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{brand}{device_type}亮度{set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【美的电灯亮度设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和light_device_type.txt】里所有语料组合用户语音{brand}{light_device_type}亮度{set}，而且回复：【<tts_content>】
            | set   |
            | 设置10  |
            | 设为50  |
            | 调到100 |

        例子:     语料
            | voice_content | tts_content |
            | 美的电灯亮度设置10    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{set}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置台灯的亮度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brightness_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【light_device_type.txt】里所有语料组合用户语音{set}{light_device_type}的亮度，追问<asked>且追问回复<brightness_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked             | brightness_value | tts_content |
            | 设置台灯的亮度 | 请问您想调到多少 | 50                 | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{set}{zone}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置卧室台灯的亮度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brightness_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和light_device_type.txt】里所有语料组合用户语音{set}{zone}{light_device_type}的亮度，追问<asked>且追问回复<brightness_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content     | asked             | brightness_value | tts_content |
            | 设置卧室台灯的亮度 | 请问您想调到多少 | 50                 | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{set}{brand}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置美的台灯的亮度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brightness_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和light_device_type.txt】里所有语料组合用户语音{set}{brand}{light_device_type}的亮度，追问<asked>且追问回复<brightness_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content      | asked             | brightness_value | tts_content |
            | 设置美的台灯的亮度  | 请问您想调到多少 | 50                 | 好的         |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{set}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置台灯的亮度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brightness_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{set}{light_device_type}的亮度，追问<asked>且追问回复<brightness_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | brightness_value | tts_content |
            | 帮我设置台灯的亮度     | 请问您想调到多少 | 50               | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{set}{zone}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置卧室台灯的亮度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brightness_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{set}{zone}{light_device_type}的亮度，追问<asked>且追问回复<brightness_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | brightness_value | tts_content |
            | 帮我设置卧室台灯的亮度   | 请问您想调到多少 | 50               | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光亮度设置-{iwant}{set}{brand}{device_type}的亮度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置美的台灯的亮度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brightness_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{set}{brand}{light_device_type}的亮度，追问<asked>且追问回复<brightness_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | brightness_value | tts_content |
            | 帮我设置美的台灯的亮度   | 请问您想调到多少 | 50               | 好的       |

    @ExtraCase @SmartHome @disable
    场景大纲: 智能家居-灯光亮度设置-亮度值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把电灯亮度设置101】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发追问
        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
        # 模拟用户说出【50】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<brightness_value>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content      | asked                           | brightness_value | tts_content |
            | 把电灯亮度设置101  | 小飞没法给您的电灯设置这个亮度 | 50                 | 好的         |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{iwant}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【我要把灯设置黄色】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{iwant}{light_device_type}{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{iwant}{light_device_type}颜色{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content    | tts_content |
            | 我要把灯设置黄色  | 好的         |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{iwant}{brand}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把美的灯颜色设为红色】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{iwant}{brand}{light_device_type}{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{iwant}{brand}{light_device_type}颜色{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把美的的灯颜色设为红色 | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{iwant}{zone}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室的灯颜色调到红色】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{iwant}{zone}{light_device_type}{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{iwant}{zone}{light_device_type}颜色{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把卧室的灯颜色调到红色 | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【灯调到红色】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【light_device_type.txt和color.txt】里所有语料组合用户语音{light_device_type}{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【light_device_type.txt和color.txt】里所有语料组合用户语音{light_device_type}颜色{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | 灯调到红色         | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{brand}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【美的灯调到红色】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{brand}{light_device_type}{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【brand.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{brand}{light_device_type}颜色{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | 美的灯调到红色       | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-灯光颜色设置-{zone}{device_type}[颜色]{set}{color}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室灯调到红色】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{zone}{light_device_type}{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【zone.txt、light_device_type.txt和color.txt】里所有语料组合用户语音{zone}{light_device_type}颜色{set}{color}，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | 卧室灯调到红色       | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【我要把空调调到20度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{temperature_device_type}调到<number>度，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{temperature_device_type}温度调到<number>度，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content           | number |
            | 我要把空调调到 | 好的，已为您调整温度  | 20     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{zone}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【我要把卧室空调调到20度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt、zone.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{zone}{temperature_device_type}调到<number>度，而且回复：【<tts_content>】

        当        iFlyOS客户端从文件【action_wanted.txt、zone.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{zone}{temperature_device_type}温度调到<number>度，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content | number |
            | 我要把客厅空调调到     | 好的，已为您调整温度  | 20     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{brand}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【我要把格力空调调到20度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt、brand.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{brand}{temperature_device_type}调到<number>度，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt、brand.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{brand}{temperature_device_type}温度调到<number>度，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content | number |
            | 我要把格力空调调到     | 好的，已为您调整温度  | 20     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【空调温度调到20度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【temperature_device_type.txt】里所有语料组合用户语音{temperature_device_type}调到<number>度，而且回复：【<tts_content>】

        当        iFlyOS客户端从文件【temperature_device_type.txt】里所有语料组合用户语音{temperature_device_type}温度调到<number>度，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content | number |
            | 空调温度调到        | 好的，已为您调整温度  | 20     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{zone}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室空调温度调到20度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{zone}{temperature_device_type}调到<number>度，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{zone}{temperature_device_type}温度调到<number>度，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content | number |
            | 客厅空调温度调到      | 好的，已为您调整温度  | 20     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{brand}{device_type}[温度]调到{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力空调温度调到20度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{brand}{temperature_device_type}调到<number>度，而且回复：【<tts_content>】

        当        iFlyOS客户端从文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{brand}{temperature_device_type}温度调到<number>度，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content | number |
            | 格力空调温度调到      | 好的，已为您调整温度  | 20     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{set}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置空调温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【temperature_device_type.txt】里所有语料组合用户语音{set}{temperature_device_type}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 设置空调温度        | 请问您想调到多少 | 22                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{set}{zone}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置客厅空调温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{set}{zone}{temperature_device_type}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 设置客厅空调温度      | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{set}{brand}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置格力空调温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{set}{brand}{temperature_device_type}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 设置格力空调温度      | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{set}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置空调温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{set}{temperature_device_type}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 帮我设置空调温度      | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{set}{zone}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置客厅空调温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{set}{zone}{temperature_device_type}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 帮我设置客厅空调温度    | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{set}{brand}{device_type}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置格力空调温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{set}{brand}{temperature_device_type}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 帮我设置格力空调温度    | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【空调设置温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【temperature_device_type.txt】里所有语料组合用户语音{temperature_device_type}{set}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 空调设置温度        | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{zone}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【客厅空调设置温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{zone}{temperature_device_type}{set}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 客厅空调设置温度      | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{brand}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力空调设置温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{brand}{temperature_device_type}{set}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 格力空调设置温度      | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把空调设置温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{temperature_device_type}{set}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 帮我把空调设置温度     | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{zone}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把客厅空调设置温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{zone}{temperature_device_type}{set}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 把客厅空调设置温度     | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-{iwant}{brand}{device_type}{set}温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把格力空调设置温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{brand}{temperature_device_type}{set}温度，追问<asked>且追问回复<temperature_value>，而且回复：【<tts_content>】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | temperature_value | tts_content |
            | 把格力空调设置温度      | 请问您想调到多少 | 20                | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-温度值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调温度调到101度】的识别过程
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
        # 模拟用户说出【10度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content2>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功


        例子:     语料
            | voice_content | tts_content            | temperature_value | tts_content2 |
            | 空调温度调到101度    | 小飞没法给您的空调设置这个温度 ，请再说一个 | 20度               | 已为您调整温度      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度设置-温度值超出范围且追问也超过范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调温度调到101度】的识别过程
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
        # 模拟用户说出【10度】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<temperature_value>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content2>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功


        例子:     语料
            | voice_content | tts_content            | temperature_value | tts_content2     |
            | 空调温度调到101度    | 小飞没法给您的空调设置这个温度 ，请再说一个 | 50度               | 小飞没法给您的空调设置这个温度呢 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{device_type}的温度{add}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【空调的温度往上调一点】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【temperature_device_type.txt】里所有语料组合用户语音{temperature_device_type}的温度{add}一点，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 往上设 |
            | 大   |
            | 高   |

        例子:     语料
            | voice_content | tts_content |
            | 空调的温度往上调一点    | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{zone}{device_type}的温度{add}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【客厅空调的温度往上调一点】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{zone}{temperature_device_type}的温度{add}一点，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 往上设 |
            | 大   |
            | 高   |

        例子:     语料
            | voice_content | tts_content |
            | 客厅空调的温度往上调一点  | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{brand}{device_type}的温度{add}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力空调的温度往上调一点】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{brand}{temperature_device_type}的温度{add}一点，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 往上设 |
            | 大   |
            | 高   |

        例子:     语料
            | voice_content | tts_content |
            | 格力空调的温度往上调一点  | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【空调的温度往上调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【temperature_device_type.txt】里所有语料组合用户语音{temperature_device_type}的温度{add}<number>度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 高   |

        例子:     语料
            | voice_content | tts_content | number |
            | 空调的温度往上调      | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{zone}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【客厅空调的温度往上调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{zone}{temperature_device_type}的温度{add}<number>度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 高   |

        例子:     语料
            | voice_content | tts_content | number |
            | 客厅空调的温度往上调    | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{brand}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力空调的温度往上调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{brand}{temperature_device_type}的温度{add}<number>度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 高   |

        例子:     语料
            | voice_content | tts_content | number |
            | 格力空调的温度往上调    | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{iwant}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把空调的温度往上调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{temperature_device_type}的温度{add}<number>度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 高   |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把空调的温度往上调   | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{iwant}{zone}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室空调的温度往上调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{zone}{temperature_device_type}的温度{add}<number>度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 高   |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把客厅空调的温度往上调 | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{iwant}{brand}{device_type}的温度{add}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室空调的温度往上调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{brand}{temperature_device_type}的温度{add}<number>度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加   |
            | 增加  |
            | 高   |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把格力空调的温度往上调 | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{add}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往上调空调的温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【temperature_device_type.txt】里所有语料组合用户语音{add}{temperature_device_type}的温度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |

        例子:     语料
            | voice_content | tts_content |
            | 往上调空调的温度      | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{add}{zone}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往上调卧室空调的温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{add}{zone}{temperature_device_type}的温度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |

        例子:     语料
            | voice_content | tts_content |
            | 往上调卧室空调的温度    | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-{add}{brand}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往上调格力空调的温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{add}{brand}{temperature_device_type}的温度，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 往上设 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |

        例子:     语料
            | voice_content | tts_content |
            | 往上调格力空调的温度    | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调高-温度已最高时继续调高
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往上调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content      |
            | 空调温度调到30      | 好的，已为您调整温度       |
            | 空调的温度往上调一点    | 小飞没法给您的空调设置这个温度呢 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{device_type}的温度{minor}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【空调的温度往下调一点】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【temperature_device_type.txt】里所有语料组合用户语音{temperature_device_type}的温度{minor}一点，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content |
            | 空调的温度往下调一点    | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{brand}{device_type}的温度{minor}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力空调的温度往下调一点】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{brand}{temperature_device_type}的温度{minor}一点，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 将低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content |
            | 格力空调的温度往下调一点  | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{zone}{device_type}的温度{minor}一点
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【客厅空调的温度往下调一点】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{zone}{temperature_device_type}的温度{minor}一点，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content |
            | 客厅空调的温度往下调一点  | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【空调的温度往下调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【temperature_device_type.txt】里所有语料组合用户语音{temperature_device_type}的温度{minor}<number>度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 空调的温度往下调      | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{zone}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【客厅空调的温度往下调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{zone}{temperature_device_type}的温度{minor}<number>度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 客厅空调的温度往下调    | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{brand}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力空调的温度往下调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{brand}{temperature_device_type}的温度{minor}<number>度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 格力空调的温度往下调    | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{iwant}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把空调的温度往下调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{temperature_device_type}的温度{minor}<number>度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把空调的温度往下调   | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{iwant}{zone}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室空调的温度往下调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{zone}{temperature_device_type}的温度{minor}<number>度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把卧室空调的温度往下调 | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{iwant}{brand}{device_type}的温度{minor}{number}度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室空调的温度往下调1度】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content><number>度】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt和temperature_device_type.txt】里所有语料组合用户语音{iwant}{brand}{temperature_device_type}的温度{minor}<number>度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把格力空调的温度往下调 | 好的，已为您调整温度  | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{minor}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往下调空调的温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【temperature_device_type.txt】里所有语料组合用户语音{minor}{temperature_device_type}的温度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |

        例子:     语料
            | voice_content | tts_content |
            | 往下调空调的温度      | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{minor}{zone}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往下调卧室空调的温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt和temperature_device_type.txt】里所有语料组合用户语音{minor}{zone}{temperature_device_type}的温度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |

        例子:     语料
            | voice_content | tts_content |
            | 往下调卧室空调的温度    | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-{minor}{brand}{device_type}的温度
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往下调格力空调的温度】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt和temperature_device_type.txt】里所有语料组合用户语音{minor}{brand}{temperature_device_type}的温度，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |

        例子:     语料
            | voice_content | tts_content |
            | 往下调格力空调的温度    | 好的，已为您调整温度  |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-温度调低-温度已最低时继续调低
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调的温度往上调一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content      |
            | 空调温度调到16      | 好的，已为您调整温度       |
            | 空调的温度往下调一点    | 小飞没法给您的空调设置这个温度呢 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{device_type}风[速]{set}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇风设置1】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{set}<number>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |
        当        iFlyOS客户端从以下set语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{set}<number>档，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 风扇风设置1        | 好的          | 1      |
            | 风扇风速设置1       | 好的          | 1      |
            | 风扇风设置1档       | 好的          | 1      |
            | 风扇风速设置1档      | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{zone}{device_type}风[速]{set}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室风扇风速设置1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【fan_gear.txt、zone.txt和wind_device_type.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{set}<number>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【fan_gear.txt、zone.txt和wind_device_type.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{set}<number>档，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 卧室风扇风速设置1档    | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{brand}{device_type}风[速]{set}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇风速设置1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【fan_gear.txt、brand.txt和wind_device_type.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{set}<number>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |
        当        iFlyOS客户端从以下set语料和文件【fan_gear.txt、brand.txt和wind_device_type.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{set}<number>档，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 格力风扇风速设置1档    | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇设置1档风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{set}<number>档{fan_gear}，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 风扇设置1档风速      | 好的          | 1      |
            | 风扇设置1档风力      | 好的          | 1      |
            | 风扇设置1档风       | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{zone}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室风扇设置1档风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【fan_gear.txt、zone.txt和wind_device_type.txt】里所有语料组合用户语音{zone}{wind_device_type}{set}<number>档{fan_gear}，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 卧室风扇设置1档风速    | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{brand}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇设置1档风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【fan_gear.txt、brand.txt和wind_device_type.txt】里所有语料组合用户语音{brand}{wind_device_type}{set}<number>档{fan_gear}，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 格力风扇设置1档风速    | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把风扇设置1档风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{wind_device_type}{set}<number>档{fan_gear}，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把风扇设置1档风速   | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{brand}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力风扇设置1档风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{set}<number>档{fan_gear}，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把格力风扇设置1档风速 | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{zone}{device_type}{set}{number}档(风速|风力|风)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室风扇设置1档风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{set}<number>档{fan_gear}，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把卧室风扇设置1档风速 | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{set}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置空调风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【1】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【wind_device_type.txt】里所有语料组合用户语音{set}{wind_device_type}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 设置空调风速        | 请问您想调到多少 | 1          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{set}{zone}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置客厅空调风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和wind_device_type.txt】里所有语料组合用户语音{set}{zone}{wind_device_type}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 设置客厅空调风速      | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{set}{brand}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置格力空调风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和wind_device_type.txt】里所有语料组合用户语音{set}{brand}{wind_device_type}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 设置格力空调风速      | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{set}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置空调风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和wind_device_type.txt】里所有语料组合用户语音{iwant}{set}{wind_device_type}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 帮我设置空调风速      | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{set}{zone}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置客厅空调风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和wind_device_type.txt】里所有语料组合用户语音{iwant}{set}{zone}{wind_device_type}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 帮我设置客厅空调风速    | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{set}{brand}{device_type}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置格力空调风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和wind_device_type.txt】里所有语料组合用户语音{iwant}{set}{brand}{wind_device_type}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 帮我设置格力空调风速    | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【空调设置风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【wind_device_type.txt】里所有语料组合用户语音{wind_device_type}{set}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 空调设置风速        | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{zone}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【客厅空调设置风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和wind_device_type.txt】里所有语料组合用户语音{zone}{wind_device_type}{set}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 客厅空调设置风速      | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{brand}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力空调设置风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和wind_device_type.txt】里所有语料组合用户语音{brand}{wind_device_type}{set}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 格力空调设置风速      | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把空调设置风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和wind_device_type.txt】里所有语料组合用户语音{iwant}{wind_device_type}{set}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 帮我把空调设置风速     | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{zone}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把客厅空调设置风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和wind_device_type.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{set}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 把客厅空调设置风速     | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-{iwant}{brand}{device_type}{set}风速
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把格力空调设置风速】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和wind_device_type.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{set}风速，追问<asked>且追问回复<wind_value>，而且回复：【好的，已为您调整风速】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | wind_value | tts_content |
            | 把格力空调设置风速      | 请问您想调到多少 | 2          | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速设置-风速值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【空调风速调到20档】的识别过程
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
        # 模拟用户说出【2档】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<wind_value>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功


        例子:     语料
            | voice_content   | tts_content           | wind_value | tts_content |
            | 空调风速调到20档 | 请再说一个{最小值}到{最大值}间的数字吧 | 2档         | 已为您调整风速     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇风往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{add}，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加一点 |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 风扇风往上调        | 好的          |
            | 风扇风速往上调       | 好的          |
            | 风扇速度往上调       | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{zone}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室风扇风速往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{add}，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加一点 |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 卧室风扇风速往上调     | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{brand}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇风速往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{add}，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加一点 |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 格力风扇风速往上调     | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把风扇风速往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{wind_device_type}{fan_gear}{add}，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加一点 |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把空调风速往上调    | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{zone}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室的风扇风速往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{fan_gear}{add}，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加一点 |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把卧室的风扇风速往上调 | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{brand}{device_type}(风|风速|速度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力风扇风速往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{fan_gear}{add}，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 加一点 |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把格力风扇风速往上调  | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇风速往上调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{add}<number>，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{add}<number>档，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content | tts_content | number |
            | 风扇风速往上调1档     | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{zone}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室风扇风速往上调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{add}<number>，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{add}<number>档，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content | tts_content | number |
            | 卧室风扇风速往上调1档   | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{brand}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇风速往上调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{add}<number>，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{add}<number>档，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content | tts_content | number |
            | 格力风扇风速往上调1档   | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把风扇风速往上调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{wind_device_type}{fan_gear}{add}<number>，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{wind_device_type}{fan_gear}{add}<number>档，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把风扇风速往上调1档  | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{zone}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室风扇风速往上调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{fan_gear}{add}<number>，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{fan_gear}{add}<number>档，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content  | tts_content | number |
            | 帮我把卧室风扇风速往上调1档 | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调大-{iwant}{brand}{device_type}(风|风速|速度){add}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力风扇风速往上调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{fan_gear}{add}<number>，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{fan_gear}{add}<number>档，而且回复：【好的，已为您调整风速】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content  | tts_content | number |
            | 帮我把格力风扇风速往上调1档 | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇风往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{minor}，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 风扇风往下调        | 好的          |
            | 风扇风速往下调       | 好的          |
            | 风扇速度往下调       | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{zone}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室风扇风速往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{minor}，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 卧室风扇风速往下调     | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{brand}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇风速往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{minor}，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 格力风扇风速往下调     | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把风扇风速往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{wind_device_type}{fan_gear}{minor}，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把风扇风速往下调    | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{zone}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室的风扇风速往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{fan_gear}{minor}，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把卧室的风扇风速往下调 | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{brand}{device_type}(风|风速|速度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力风扇风速往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{fan_gear}{minor}，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把格力风扇风速往下调  | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇风速往下调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{minor}<number>，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        当        iFlyOS客户端从以下minor语料和文件【wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{wind_device_type}{fan_gear}{minor}<number>档，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 风扇风速往下调1档     | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{zone}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室风扇风速往下调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{minor}<number>，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        当        iFlyOS客户端从以下minor语料和文件【zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{zone}{wind_device_type}{fan_gear}{minor}<number>档，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 卧室风扇风速往下调1档   | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{brand}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇风速往下调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{minor}<number>，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        当        iFlyOS客户端从以下minor语料和文件【brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{brand}{wind_device_type}{fan_gear}{minor}<number>档，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 格力风扇风速往下调1档   | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把风扇风速往下调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{wind_device_type}{fan_gear}{minor}<number>，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{wind_device_type}{fan_gear}{minor}<number>档，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把风扇风速往下调1档  | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{zone}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室风扇风速往下调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{fan_gear}{minor}<number>，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{zone}{wind_device_type}{fan_gear}{minor}<number>档，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content  | tts_content | number |
            | 帮我把卧室风扇风速往下调1档 | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-风速调小-{iwant}{brand}{device_type}(风|风速|速度){minor}{number}[档]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力风扇风速往下调1档】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{fan_gear}{minor}<number>，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt、wind_device_type.txt和fan_gear.txt】里所有语料组合用户语音{iwant}{brand}{wind_device_type}{fan_gear}{minor}<number>档，而且回复：【好的，已为您调整风速】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降     |
            | 低     |
            | 小     |

        例子:     语料
            | voice_content  | tts_content | number |
            | 帮我把格力风扇风速往下调1档 | 好的          | 1      |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机音量设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}音量{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}声音{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 电视机音量设置10     | 好的                    | 50     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{zone}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室电视机音量设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}音量{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}声音{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 卧室电视机音量设置10   | 好的                    | 50     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{brand}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【TCL电视机音量设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}音量{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}声音{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | TCL电视机音量设置10  | 好的                    | 50     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机音量设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}音量{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}声音{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content | number |
            | 帮我把电视机音量设置10  | 好的                    | 50     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{zone}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把电视机音量设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}音量{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}声音{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content  | tts_content | number |
            | 帮我把卧室电视机音量设置10 | 好的                    | 50     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{brand}{device_type}(音量|声音){set}{number}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把TCL电视机音量设置10】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}音量{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}声音{set}<number>，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content   | tts_content | number |
            | 帮我把TCL电视机音量设置10 | 好的                    | 50     |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{set}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置电视音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{set}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{set}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 设置电视音量        | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{set}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置客厅电视音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{set}{zone}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{set}{zone}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 设置客厅电视音量      | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{set}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置格力电视音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{set}{brand}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{set}{brand}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 设置格力电视音量      | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{set}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置电视音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{set}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{set}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 帮我设置电视音量      | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{set}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置客厅电视音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{set}{zone}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{set}{zone}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 帮我设置客厅电视音量    | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{set}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我设置格力电视音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{set}{brand}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{set}{brand}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 帮我设置格力电视音量    | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视设置音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}{set}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}{set}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 电视设置音量        | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{zone}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【客厅电视设置音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}{set}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}{set}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 客厅电视设置音量      | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{brand}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力电视设置音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}{set}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}{set}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 格力电视设置音量      | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把电视设置音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}{set}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}{set}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 帮我把电视设置音量     | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{zone}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把客厅电视设置音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}{set}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}{set}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 把客厅电视设置音量     | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-{iwant}{brand}{device_type}{set}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【把格力电视设置音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<asked>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发追问
#        那么      iFlyOS服务端回复的directive为【SpeechRecognizer】，【ExpectSpeech】
#        # 模拟用户说出【50】的识别过程
#        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}{set}音量，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        当        iFlyOS客户端从以下set语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}{set}声音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | asked      | volume_value | tts_content |
            | 把格力电视设置音量     | 请问您想调到多少 | 20           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量设置-音量值超出范围
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量调到101】的识别过程
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
        # 模拟用户说出【50】的识别过程
        当       iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<volume_value>】
        那么      iFlyOS服务端回复状态为【200】成功
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功


        例子:     语料
            | voice_content | tts_content                      | volume_value | tts_content |
            | 电视音量调到101     | 小飞没法给您的电视设置这个音量 ，请再说一个0到100间的数字吧 | 50           | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机音量往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}音量{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        当       iFlyOS客户端从以下add语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}声音{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 电视机音量往上调      | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{zone}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室的电视机音量往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}音量{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        当       iFlyOS客户端从以下add语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}声音{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 卧室的电视机音量往上调   | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{brand}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力电视机音量往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}音量{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        当       iFlyOS客户端从以下add语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}声音{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 格力电视机音量往上调  | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{iwant}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把电视机音量往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}音量{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}声音{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把电视机音量往上调   | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{iwant}{zone}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室的电视机音量往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}音量{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}声音{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content  | tts_content |
            | 帮我把卧室的电视机音量往上调 | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{iwant}{brand}{device_type}(音量|声音){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力电视机音量往上调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}音量{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}声音{add}，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 大一点 |
            | 高一点 |

        例子:     语料
            | voice_content   | tts_content |
            | 帮我把格力电视机音量往上调 | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{add}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往上调电视机音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【volume_device_type.txt】里所有语料组合用户语音{add}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【volume_device_type.txt】里所有语料组合用户语音{add}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content | tts_content |
            | 往上调电视机音量      | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{add}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往上调卧室的电视机音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{add}{zone}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{add}{zone}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content | tts_content |
            | 往上调卧室的电视机音量   | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-{add}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往上调格力电视机音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{add}{brand}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        当       iFlyOS客户端从以下add语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{add}{brand}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |

        例子:     语料
            | voice_content | tts_content |
            | 往上调格力电视机音量  | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调大-音量值最大时继续调节音量
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【电视机音量设大点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content      |
            | 电视音量调到100     | 好的，已为您调整音量       |
            | 电视音量设大点       | 小飞没法给您的电视设置这个音量呢 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机音量往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}音量{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        当        iFlyOS客户端从以下minor语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}声音{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 电视机音量往下调      | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{zone}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室的电视机音量往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}音量{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        当        iFlyOS客户端从以下minor语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}声音{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 卧室的电视机音量往下调   | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{brand}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力电视机音量往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}音量{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        当        iFlyOS客户端从以下minor语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}声音{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 格力电视机音量往下调  | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{iwant}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把电视机音量往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}音量{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{volume_device_type}声音{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把电视机音量往下调   | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{iwant}{zone}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室的电视机音量往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}音量{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{zone}{volume_device_type}声音{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content  | tts_content |
            | 帮我把卧室的电视机音量往下调 | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{iwant}{brand}{device_type}(音量|声音){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力电视机音量往下调】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}音量{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt和volume_device_type.txt】里所有语料组合用户语音{iwant}{brand}{volume_device_type}声音{minor}，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 降一点   |
            | 低一点   |
            | 小一点   |

        例子:     语料
            | voice_content   | tts_content |
            | 帮我把格力电视机音量往下调 | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{minor}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往下调电视机音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【volume_device_type.txt】里所有语料组合用户语音{minor}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |

        当        iFlyOS客户端从以下minor语料和文件【volume_device_type.txt】里所有语料组合用户语音{minor}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |

        例子:     语料
            | voice_content | tts_content |
            | 往下调电视机音量      | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{minor}{zone}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往下调卧室的电视机音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{minor}{zone}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |

        当        iFlyOS客户端从以下minor语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{minor}{zone}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |

        例子:     语料
            | voice_content | tts_content |
            | 往下调卧室的电视机音量   | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-音量调小-{minor}{brand}{device_type}(音量|声音)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【往下调格力电视机音量】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{minor}{brand}{volume_device_type}音量，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |

        当        iFlyOS客户端从以下minor语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{minor}{brand}{volume_device_type}声音，而且回复：【好的，已为您调整音量】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |

        例子:     语料
            | voice_content | tts_content |
            | 往下调格力电视机音量  | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{device_type}{set}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机设置静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}{set}静音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | 电视机设置静音       | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{brand}{device_type}{set}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【TCL电视机设置静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}{set}静音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | TCL电视机设置静音    | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{zone}{device_type}{set}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室电视机设置静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}{set}静音，而且回复：【好的，已为您调整音量】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content |
            | 卧室电视机设置静音     | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{device_type}关闭声音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机关闭声音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}关闭声音，而且回复：【好的，已为您调整音量】

        例子:     语料
            | voice_content | tts_content |
            | 电视机关闭声音       | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{zone}{device_type}关闭声音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室的电视机关闭声音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}关闭声音，而且回复：【好的，已为您调整音量】

        例子:     语料
            | voice_content | tts_content |
            | 卧室的电视机关闭声音    | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{brand}{device_type}关闭声音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力电视机关闭声音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}关闭声音，而且回复：【好的，已为您调整音量】

        例子:     语料
            | voice_content | tts_content |
            | 格力电视机关闭声音   | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{device_type}(静音|设为无声)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}静音，而且回复：【好的，已为您调整音量】
            | set  |
            | 静音   |
            | 设为无声 |

        当        iFlyOS客户端从以下set语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}设为无声，而且回复：【好的，已为您调整音量】
            | set  |
            | 静音   |
            | 设为无声 |

        例子:     语料
            | voice_content | tts_content |
            | 电视机静音         | 好的                    |
            | 电视机设置无声       | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{zone}{device_type}(静音|设为无声)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室的电视机静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}静音，而且回复：【好的，已为您调整音量】
            | set  |
            | 静音   |
            | 设为无声 |
        当        iFlyOS客户端从以下set语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}设为无声，而且回复：【好的，已为您调整音量】
            | set  |
            | 静音   |
            | 设为无声 |

        例子:     语料
            | voice_content | tts_content |
            | 卧室的电视机静音      | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-设置静音-{brand}{device_type}(静音|设为无声)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力电视机静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}静音，而且回复：【好的，已为您调整音量】
            | set  |
            | 静音   |
            | 设为无声 |

        当        iFlyOS客户端从以下set语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}设为无声，而且回复：【好的，已为您调整音量】
            | set  |
            | 静音   |
            | 设为无声 |

        例子:     语料
            | voice_content | tts_content |
            | 格力电视机静音     | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-取消静音-{device_type}{turn_off}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机关上静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}{turn_off}静音，而且回复：【好的，已为您调整音量】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 电视机关上静音       | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-取消静音-{brand}{device_type}{turn_off}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【TCL电视机关上静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}{turn_off}静音，而且回复：【好的，已为您调整音量】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | TCL电视机关上静音    | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-取消静音-{zone}{device_type}{turn_off}静音
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【主卧电视机关上静音】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}{turn_off}静音，而且回复：【好的，已为您调整音量】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 主卧电视机关上静音     | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-取消静音-{device_type}声音{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【电视机声音打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【volume_device_type.txt】里所有语料组合用户语音{volume_device_type}声音{turn_on}，而且回复：【好的，已为您调整音量】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content |
            | 电视机声音打开       | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-取消静音-{brand}{device_type}声音{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【TCL电视机声音打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【brand.txt和volume_device_type.txt】里所有语料组合用户语音{brand}{volume_device_type}声音{turn_on}，而且回复：【好的，已为您调整音量】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content |
            | TCL电视机声音打开    | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-取消静音-{zone}{device_type}声音{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室电视机声音打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【zone.txt和volume_device_type.txt】里所有语料组合用户语音{zone}{volume_device_type}声音{turn_on}，而且回复：【好的，已为您调整音量】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content |
            | 卧室电视机声音打开     | 好的                    |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{device_type}{set}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇设置睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{mode_device_type}{set}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content     |
            | 风扇设置睡眠模式      | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{zone}{device_type}{set}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【主卧的风扇设置睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{zone}{mode_device_type}{set}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content     |
            | 主卧的风扇设置睡眠模式   | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{brand}{device_type}{set}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇设置睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{brand}{mode_device_type}{set}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content     |
            | 格力风扇设置睡眠模式    | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{set}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置风扇睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{set}{mode_device_type}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content     |
            | 设置风扇睡眠模式      | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{set}{zone}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置主卧风扇睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【zone.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{set}{zone}{mode_device_type}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content     |
            | 设置主卧风扇睡眠模式    | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{set}{brand}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【设置格力风扇睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下set语料和文件【brand.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{set}{brand}{mode_device_type}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | set |
            | 设置  |
            | 设为  |
            | 调到  |

        例子:     语料
            | voice_content | tts_content     |
            | 设置格力风扇睡眠模式    | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{turn_on}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【打开风扇的睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{turn_on}{mode_device_type}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content     |
            | 打开风扇的睡眠模式     | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{turn_on}{zone}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【打开主卧风扇的睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【zone.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{turn_on}{zone}{mode_device_type}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content     |
            | 打开主卧风扇的睡眠模式   | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{turn_on}{brand}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【打开格力风扇的睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【brand.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{turn_on}{brand}{mode_device_type}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content     |
            | 打开格力风扇的睡眠模式   | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{brand}{device_type}{turn_on}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇打开睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【brand.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{brand}{mode_device_type}{turn_on}{mode}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content     |
            | 格力风扇打开睡眠模式    | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{device_type}{mode}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇睡眠模式打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{mode_device_type}{mode}{turn_on}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content     |
            | 风扇睡眠模式打开      | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{zone}{device_type}{mode}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【主卧风扇的睡眠模式打开】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【zone.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{zone}{mode_device_type}{mode}{turn_on}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content     |
            | 主卧风扇的睡眠模式打开   | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-模式设置-{brand}{device_type}{mode}{turn_on}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【打开格力风扇的睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_on语料和文件【brand.txt、mode_device_type.txt和device_mode.txt】里所有语料组合用户语音{brand}{mode_device_type}{mode}{turn_on}，而且回复：【好的，已为您把{mode_device_type}设为{mode}】
            | turn_on |
            | 打开      |
            | 开开      |
            | 开       |
            | 开启      |

        例子:     语料
            | voice_content | tts_content     |
            | 格力风扇的睡眠模式打开   | 好的，已为您把风扇设为睡眠模式 |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{turn_off}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【关上风扇的睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【device_type.txt和device_mode.txt】里所有语料组合用户语音{turn_off}{device_type}{mode}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 关上风扇的睡眠模式     | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{turn_off}{zone}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【关上卧室风扇的睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【zone.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{turn_off}{zone}{device_type}{mode}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 关上卧室风扇的睡眠模式   | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{turn_off}{brand}{device_type}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【关上格力风扇的睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【brand.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{turn_off}{brand}{device_type}{mode}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 关上格力风扇的睡眠模式   | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{brand}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇关上睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【brand.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{brand}{device_type}{turn_off}{mode}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 格力风扇关上睡眠模式    | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{device_type}{mode}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【风扇的睡眠模式关上】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【device_type.txt和device_mode.txt】里所有语料组合用户语音{device_type}{mode}{turn_off}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 风扇的睡眠模式关上     | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{zone}{device_type}{mode}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【卧室风扇的睡眠模式关上】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【zone.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{zone}{device_type}{mode}{turn_off}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 卧室风扇的睡眠模式关上   | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{brand}{device_type}{mode}{turn_off}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【格力风扇的睡眠模式关上】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【brand.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{brand}{device_type}{mode}{turn_off}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 格力风扇的睡眠模式关上   | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{iwant}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把风扇关上睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{iwant}{device_type}{turn_off}{mode}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把风扇关上睡眠模式   | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{iwant}{zone}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把卧室风扇关上睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt、zone.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{iwant}{zone}{device_type}{turn_off}{mode}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把卧室风扇关上睡眠模式 | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-关闭模式-{iwant}{brand}{device_type}{turn_off}{mode}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

#        # 模拟用户说出【帮我把格力风扇关上睡眠模式】的识别过程
#        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
#        那么      iFlyOS服务端回复状态为【200】成功
#        # 服务端下发意图
#        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
#        那么      iFlyOS服务端回复状态为【200】成功
#        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
#        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下turn_off语料和文件【action_wanted.txt、brand.txt、device_type.txt和device_mode.txt】里所有语料组合用户语音{iwant}{brand}{device_type}{turn_off}{mode}，而且回复：【<tts_content>】
            | turn_off |
            | 关上       |
            | 关        |
            | 关掉       |
            | 关闭       |
            | 停止       |
            | 退出       |
            | 结束       |
            | 关闭       |
            | 关了       |

        例子:     语料
            | voice_content | tts_content |
            | 帮我把格力风扇关上睡眠模式 | 好的          |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【light_device_type.txt】里所有语料组合用户语音{light_device_type}调亮，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【light_device_type.txt】里所有语料组合用户语音{light_device_type}调亮一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 台灯调亮一点        | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{zone}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【zone.txt和light_device_type.txt】里所有语料组合用户语音{zone}{light_device_type}调亮，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【zone.txt和light_device_type.txt】里所有语料组合用户语音{zone}{light_device_type}调亮一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 卧室台灯调亮一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{brand}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【brand.txt和light_device_type.txt】里所有语料组合用户语音{brand}{light_device_type}调亮，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【brand.txt和light_device_type.txt】里所有语料组合用户语音{brand}{light_device_type}调亮一点，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 格力台灯调亮一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{light_device_type}调亮，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{light_device_type}调亮一点，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 帮我把台灯调亮一点     | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{zone}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{zone}{light_device_type}调亮，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{zone}{light_device_type}调亮一点，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 卧室台灯调亮一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{brand}{device_type}调亮[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调亮一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt和brand.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{brand}{light_device_type}调亮，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt和brand.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{brand}{light_device_type}调亮一点，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 格力台灯调亮一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调亮台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【light_device_type.txt】里所有语料组合用户语音调亮{light_device_type}，而且回复：【<tts_content>】

        当        iFlyOS客户端从文件【light_device_type.txt和light.txt】里所有语料组合用户语音调亮{device_type}{light}，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 调亮台灯的光        | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调亮卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【zone.txt和light_device_type.txt】里所有语料组合用户语音调亮{zone}{light_device_type}，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{zone}{light_device_type}{light}，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 调亮卧室台灯的光      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调亮格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【brand.txt和light_device_type.txt】里所有语料组合用户语音调亮{brand}{light_device_type}，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{brand}{light_device_type}{light}，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 调亮格力台灯的光      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}调亮{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调亮台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音调亮{iwant}调亮{light_device_type}，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}调亮{light_device_type}{light}，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 我要调亮台灯的光      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}调亮{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调亮卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音调亮{iwant}调亮{zone}{light_device_type}，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt、zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}调亮{zone}{light_device_type}{light}，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 我要调亮卧室台灯的光    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-调亮{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调亮格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt、brand.txt和light_device_type.txt】里所有语料组合用户语音调亮{brand}{light_device_type}，而且回复：【<tts_content>】
        当       iFlyOS客户端从以下adjust语料和文件【action_wanted.txt、brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{brand}{light_device_type}{light}，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 我要调亮格力台灯的光    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【light_device_type.txt和light.txt】里所有语料组合用户语音调亮{light_device_type}{light}{add}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 台灯光往上调        | 好的       |
            | 台灯亮度往上调       | 好的       |
            | 台灯的光往上调       | 好的       |
            | 台灯的亮度往上调      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{zone}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{zone}{light_device_type}{light}{add}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 卧室台灯光往上调      | 好的       |
            | 卧室台灯亮度往上调     | 好的       |
            | 卧室台灯的光往上调     | 好的       |
            | 卧室台灯的亮度往上调    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{brand}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【美的台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{brand}{light_device_type}{light}{add}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 美的台灯光往上调      | 好的       |
            | 美的台灯亮度往上调     | 好的       |
            | 美的台灯的光往上调     | 好的       |
            | 美的台灯的亮度往上调    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}{light_device_type}{light}{add}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 把台灯光往上调       | 好的       |
            | 把台灯亮度往上调      | 好的       |
            | 把台灯的光往上调      | 好的       |
            | 把台灯的亮度往上调     | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{zone}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}{zone}{light_device_type}{light}{add}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 把卧室台灯光往上调     | 好的       |
            | 把卧室台灯亮度往上调    | 好的       |
            | 把卧室台灯的光往上调    | 好的       |
            | 把卧室台灯的亮度往上调   | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{brand}{device_type}(光|亮度|的光|的亮度){add}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力台灯光往上调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}{brand}{light_device_type}{light}{add}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 把格力台灯光往上调     | 好的       |
            | 把格力台灯亮度往上调    | 好的       |
            | 把格力台灯的光往上调    | 好的       |
            | 把格力台灯的亮度往上调   | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{add}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【light_device_type.txt和light.txt】里所有语料组合用户语音调亮{add}{light_device_type}{light}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 往上调台灯光        | 好的       |
            | 往上调台灯亮度       | 好的       |
            | 往上调台灯的光       | 好的       |
            | 往上调台灯的亮度      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{add}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调卧室台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{add}{zone}{light_device_type}{light}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 往上调卧室台灯光      | 好的       |
            | 往上调卧室台灯的光     | 好的       |
            | 往上调卧室台灯亮度     | 好的       |
            | 往上调卧室台灯的亮度    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{add}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往上调美的台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{add}{brand}{light_device_type}{light}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 往上调美的台灯光      | 好的       |
            | 往上调美的台灯的光     | 好的       |
            | 往上调美的台灯亮度     | 好的       |
            | 往上调美的台灯的亮度    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{add}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往上调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}{add}{light_device_type}{light}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 我要往上调台灯光      | 好的       |
            | 我要往上调台灯的光     | 好的       |
            | 我要往上调台灯亮度     | 好的       |
            | 我要往上调台灯的亮度    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{add}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往上调卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}{add}{zone}{light_device_type}{light}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 我要往上调卧室台灯光    | 好的       |
            | 我要往上调卧室台灯的光   | 好的       |
            | 我要往上调卧室台灯亮度   | 好的       |
            | 我要往上调卧室台灯的亮度  | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调高灯光亮度-{iwant}{add}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往上调格力台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当       iFlyOS客户端从以下add语料和文件【action_wanted.txt、brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调亮{iwant}{add}{brand}{light_device_type}{light}，而且回复：【<tts_content>】
            | add |
            | 往上调 |
            | 调高  |
            | 调大  |
            | 设高  |
            | 设大  |
            | 增加  |
            | 往上设 |
            | 设亮  |
            | 设强  |
            | 调亮  |

        例子:     语料
            | voice_content | tts_content |
            | 我要往上调格力台灯的亮度  | 好的       |
            | 我要往上调格力台灯的光   | 好的       |
            | 我要往上调格力台灯亮度   | 好的       |
            | 我要往上调格力台灯的亮度  | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【light_device_type.txt】里所有语料组合用户语音{light_device_type}调暗，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【light_device_type.txt】里所有语料组合用户语音{light_device_type}调暗一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 台灯调暗一点        | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{zone}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【zone.txt和light_device_type.txt】里所有语料组合用户语音{zone}{light_device_type}调暗，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【zone.txt和light_device_type.txt】里所有语料组合用户语音{zone}{light_device_type}调暗一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 卧室台灯调暗一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{brand}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【brand.txt和light_device_type.txt】里所有语料组合用户语音{brand}{light_device_type}调暗，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【brand.txt和light_device_type.txt】里所有语料组合用户语音{brand}{light_device_type}调暗一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 格力台灯调暗一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【帮我把台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{light_device_type}调暗，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{light_device_type}调暗一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 帮我把台灯调暗一点     | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{zone}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{zone}{light_device_type}调暗，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{zone}{light_device_type}调暗一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 卧室台灯调暗一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{brand}{device_type}调暗[一点]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【格力台灯调暗一点】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt和brand.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{brand}{light_device_type}调暗，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt和brand.txt和light_device_type.txt】里所有语料组合用户语音{iwant}{brand}{light_device_type}调暗一点，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 格力台灯调暗一点      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调暗台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【light_device_type.txt】里所有语料组合用户语音调暗{light_device_type}，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【light_device_type.txt和light.txt】里所有语料组合用户语音调暗{light_device_type}{light}，而且回复：【<tts_content>】

        例子:     语料
            | voice_content | tts_content |
            | 调暗台灯的光        | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调暗卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【zone.txt和light_device_type.txt】里所有语料组合用户语音调暗{zone}{light_device_type}，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{zone}{light_device_type}{light}，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 调暗卧室台灯的光      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【调暗格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【brand.txt和light_device_type.txt】里所有语料组合用户语音调暗{brand}{light_device_type}，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{brand}{light_device_type}{light}，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 调暗格力台灯的光      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}调暗{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调暗台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt和light_device_type.txt】里所有语料组合用户语音调暗{iwant}调暗{light_device_type}，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}调暗{light_device_type}{light}，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 我要调暗台灯的光      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}调暗{zone}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调暗卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt、zone.txt和light_device_type.txt】里所有语料组合用户语音调暗{iwant}调暗{zone}{light_device_type}，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt、zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}调暗{zone}{light_device_type}{light}，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 我要调暗卧室台灯的光    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-调暗{brand}{device_type}[的光/的亮度/光]
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要调暗格力台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从文件【action_wanted.txt、brand.txt和light_device_type.txt】里所有语料组合用户语音调暗{brand}{light_device_type}，而且回复：【<tts_content>】
        当        iFlyOS客户端从文件【action_wanted.txt、brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{brand}{light_device_type}{light}，而且回复：【<tts_content>】


        例子:     语料
            | voice_content | tts_content |
            | 我要调暗格力台灯的光    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【light_device_type.txt和light.txt】里所有语料组合用户语音调暗{light_device_type}{light}{minor}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 台灯光往下调        | 好的       |
            | 台灯亮度往下调       | 好的       |
            | 台灯的光往下调       | 好的       |
            | 台灯的亮度往下调      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{zone}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【卧室台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{zone}{light_device_type}{light}{minor}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 卧室台灯光往下调      | 好的       |
            | 卧室台灯亮度往下调     | 好的       |
            | 卧室台灯的光往下调     | 好的       |
            | 卧室台灯的亮度往下调    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{brand}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【美的台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{brand}{light_device_type}{light}{minor}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 美的台灯光往下调      | 好的       |
            | 美的台灯亮度往下调     | 好的       |
            | 美的台灯的光往下调     | 好的       |
            | 美的台灯的亮度往下调    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}{light_device_type}{light}{minor}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 把台灯光往下调       | 好的       |
            | 把台灯亮度往下调      | 好的       |
            | 把台灯的光往下调      | 好的       |
            | 把台灯的亮度往下调     | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{zone}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把卧室台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}{zone}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 把卧室台灯光往下调     | 好的       |
            | 把卧室台灯亮度往下调    | 好的       |
            | 把卧室台灯的光往下调    | 好的       |
            | 把卧室台灯的亮度往下调   | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{brand}{device_type}(光|亮度|的光|的亮度){minor}
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【把格力台灯光往下调】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}{brand}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 把格力台灯光往下调     | 好的       |
            | 把格力台灯亮度往下调    | 好的       |
            | 把格力台灯的光往下调    | 好的       |
            | 把格力台灯的亮度往下调   | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{minor}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【light_device_type.txt和light.txt】里所有语料组合用户语音调暗{minor}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 往下调台灯光        | 好的       |
            | 往下调台灯亮度       | 好的       |
            | 往下调台灯的光       | 好的       |
            | 往下调台灯的亮度      | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{minor}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调卧室台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{minor}{zone}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 往下调卧室台灯光      | 好的       |
            | 往下调卧室台灯的光     | 好的       |
            | 往下调卧室台灯亮度     | 好的       |
            | 往下调卧室台灯的亮度    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{minor}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【往下调美的台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{minor}{brand}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 往下调美的台灯光      | 好的       |
            | 往下调美的台灯的光     | 好的       |
            | 往下调美的台灯亮度     | 好的       |
            | 往下调美的台灯的亮度    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{minor}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往下调台灯光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}{minor}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 我要往下调台灯光      | 好的       |
            | 我要往下调台灯的光     | 好的       |
            | 我要往下调台灯亮度     | 好的       |
            | 我要往下调台灯的亮度    | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{minor}{zone}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往下调卧室台灯的光】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、zone.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}{minor}{zone}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 我要往下调卧室台灯光    | 好的       |
            | 我要往下调卧室台灯的光   | 好的       |
            | 我要往下调卧室台灯亮度   | 好的       |
            | 我要往下调卧室台灯的亮度  | 好的       |

    @ExtraCase @SmartHome
    场景大纲: 智能家居-调低灯光亮度-{iwant}{minor}{brand}{device_type}(光|亮度|的光|的亮度)
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【智能家居】技能已打开

        # 模拟用户说出【我要往下调格力台灯的亮度】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功
        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        当        iFlyOS客户端从以下minor语料和文件【action_wanted.txt、brand.txt、light_device_type.txt和light.txt】里所有语料组合用户语音调暗{iwant}{minor}{brand}{light_device_type}{light}，而且回复：【<tts_content>】
            | minor |
            | 往下调   |
            | 调低    |
            | 降低    |
            | 设低    |
            | 调小    |
            | 设小    |
            | 调暗    |
            | 设暗    |

        例子:     语料
            | voice_content | tts_content |
            | 我要往下调格力台灯的亮度  | 好的       |
            | 我要往下调格力台灯的光   | 好的       |
            | 我要往下调格力台灯光    | 好的       |
            | 我要往下调格力台灯亮度   | 好的       |