# Created by enrico at 2018/7/26
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 事件服务模块测试
    ============================================

# 典型用例

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-十九大报告题目
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
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
            | voice_content | tts_content|
            | 十九大报告题目|决胜全面建成小康社会，夺取新时代中国特色社会主义伟大胜利|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-十九大的主题
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【十九大的主题】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 十九大的主题|不忘初心，牢记使命，高举中国特色社会主义伟大旗帜，决胜全面建成小康社会，夺取新时代中国特色社会主义伟大胜利，为实现中华民族伟大复兴的中国梦不懈奋斗。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-中国共产党初心和使命
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【中国共产党初心和使命】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 中国共产党初心和使命|为中国人民谋幸福，为中华民族谋复兴|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-四个伟大
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四个伟大】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四个伟大|实现伟大梦想，进行伟大斗争，建设伟大工程，推进伟大事业。起决定性作用的是党的建设新的伟大工程。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-我国社会主要矛盾
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【我国社会主要矛盾】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 我国社会主要矛盾|人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-五位一体
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【五位一体】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 五位一体|经济建设、政治建设、文化建设、社会建设、生态文明建设|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-四个全面
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四个全面】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四个全面|全面建成小康社会、全面深化改革、全面依法治国、全面从严治党。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-四个自信
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四个自信】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四个自信|道路自信、理论自信、制度自信、文化自信。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-四个意识
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四个意识】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四个意识|政治意识、大局意识、核心意识、看齐意识|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-六大纪律
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【六大纪律】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 六大纪律|政治纪律、组织纪律、廉洁纪律、群众纪律、工作纪律、生活纪律|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-五大发展理念
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【五大发展理念】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 五大发展理念|创新、协调、绿色、开放、共享|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-五大思维
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【五大思维】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 五大思维|战略思维、创新思维、辩证思维、法治思维、底线思维|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-新时期好干部
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【新时期好干部】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 新时期好干部|信念坚定、为民服务、勤政务实、敢于担当、清正廉洁。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-党的三大历史任务
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【党的三大历史任务】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 党的三大历史任务|推进现代化建设、完成祖国统一、维护世界和平与促进共同发展|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-两大任务
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【两大任务】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 两大任务|决胜全面建成小康社会、开启全面建设社会主义现代化国家新征程。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-四大考验
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四大考验】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四大考验|执政考验、改革开放考验、市场经济考验、外部环境考验|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-四大危险
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四大危险】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四大危险|精神懈怠危险、能力不足危险、脱离群众危险、消极腐败危险|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-中国梦
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【中国梦】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 中国梦|实现中华民族伟大复兴，是近代以来中国人民最伟大梦想，我们称之为“中国梦”。中国梦的基本内涵是实现国家富强、民族振兴、人民幸福|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-社会主义核心价值观
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【社会主义核心价值观】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 社会主义核心价值观|富强、民主、文明、和谐、自由、平等、公正、法治、爱国、敬业、诚信、友善。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-新时代的时代定位
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【新时代的时代定位】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 新时代的时代定位|中国特色社会主义进入了新时代，这是我国发展新的历史方位。这个新时代，是承前启后、继往开来、在新的历史条件下继续夺取中国特色社会主义伟大胜利的时代，是决胜全面建成小康社会、进而全面建设社会主义现代化强国的时代，是全国各族人民团结奋斗、不断创造美好生活、逐步实现全体人民共同富裕的时代，是全体中华儿女勠力同心、奋力实现中华民族伟大复兴中国梦的时代，是我国日益走近世界舞台中央、不断为人类作出更大贡献的时代|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-二十字好干部标准、好干部标准
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【二十字好干部标准、好干部标准】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 二十字好干部标准、好干部标准|信念坚定、为民服务、勤政务实、敢于担当、清正廉洁|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-一岗双责
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【一岗双责】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 一岗双责|“一岗”就是一个领导干部的职务所对应的岗位；“双责”就是一个领导干部既要对所在岗位应当承担的具体业务工作负责，又要对所在岗位应当承担的党风廉政建设责任制负责；也就是一个单位的领导干部应当对这个单位的业务工作和党风廉政建设负双重责任|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-两学一做
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【两学一做】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 两学一做|学党章党规、学系列讲话，做合格党员|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-四讲四有
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四讲四有】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四讲四有|讲政治、有信念，讲规矩、有纪律，讲道德、有品行，讲奉献、有作为|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-十九大精神-七大战略
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【七大战略】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 七大战略|实施科教兴国战略、人才强国战略、创新驱动发展战略、乡村振兴战略、区域协调战略、可持续发展战略、军民融合战略|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-党的纪律处分
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【党的纪律处分】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 党的纪律处分|警告、严重警告、撤销党内职务、留党察看、开除党籍。留党察看最长不超过两年，党员在留党察看期间没有表决权、选举权和被选举权|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-四个服从
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【四个服从】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 四个服从|党员个人服从党的组织，少数服从多数，下级组织服从上级组织，全党各个组织和全体党员服从党的全国代表大会和中央委员会|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-两个务必
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【两个务必】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 两个务必|务必使同志们继续保持谦虚、谨慎、不骄、不躁的作风，务必使同志们继续保持艰苦奋斗的作风|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-党的三大作风
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【党的三大作风】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 党的三大作风|理论联系实际，密切联系群众，批评与自我批评|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-党的三大法宝
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【党的三大法宝】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 党的三大法宝|统一战线、武装斗争、党的建设|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-八项规定
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【八项规定】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 八项规定|改进调查研究；精简会议活动；精简文件简报；规范出访活动；改进警卫工作；改进新闻报道；严格文稿发表；厉行勤俭节约|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-党的基层组织
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【党的基层组织】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 党的基层组织|分为基层委员会、党总支委员会、支部委员会|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-中国共产党的性质
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【中国共产党的性质】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 中国共产党的性质|中国共产党是中国工人阶级的先锋队，同时是中国人民和中华民族的先锋队，是中国特色社会主义事业的领导核心，代表中国先进生产力的发展要求，代表中国先进文化的前进方向，代表中国最广大人民的根本利益|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-党的最高理想和最终目标
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【党的最高理想和最终目标】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 党的最高理想和最终目标|实现共产主义|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-党的行动指南
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【党的行动指南】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 党的行动指南|马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”重要思想、科学发展观、习近平新时代中国特色社会主义思想|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-习近平新时代中国特色社会主义思想
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【习近平新时代中国特色社会主义思想】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 习近平新时代中国特色社会主义思想|十八大以来，以习近平同志为主要代表的中国共产党人，顺应时代发展，从理论和实践结合上系统回答了新时代坚持和发展什么样的中国特色社会主义、怎样坚持和发展中国特色社会主义这个重大时代课题，创立了习近平新时代中国特色社会主义思想。习近平新时代中国特色社会主义思想是对马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”重要思想、科学发展观的继承和发展，是马克思主义中国化最新成果，是党和人民实践经验和集体智慧的结晶，是中国特色社会主义理论体系的重要组成部分，是全党全国人民为实现中华民族伟大复兴而奋斗的行动指南，必须长期坚持并不断发展。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-三重一大
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【三重一大】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 三重一大|“重大问题决策、重要干部任免、重大项目投资决策、大额资金使用”，必须经集体讨论做出决定的制度。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-三会一课
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【三会一课】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 三会一课|三会一课是指支部党员大会、支部委员会、党小组会，按时上好党课。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-民主生活会
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【民主生活会】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 民主生活会|民主生活会是指党员领导干部召开的旨在开展批评与自我批评的组织活动制度。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-组织生活会
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【组织生活会】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 组织生活会|组织生活会是指党支部（党小组）以交流思想、总结经验教训、开展批评与自我批评为中心内容的组织生活制度。党支部（党小组）组织生活会一般每季度或半年召开一次。|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-党章党规-民主评议
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【民主评议】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 民主评议|是在党内民主生活会上，或各类思想教育活动中，党团组织或行政组织中的成员，共同对某一个人在思想、学习、组织纪律、工作、廉洁等方面的评价。把大家的评价综合起来，形成文字材料|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-联通党建-中国联通的愿景
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【中国联通的愿景】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 中国联通的愿景|客户信赖的智慧生活创造者|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-联通党建-中国联通的使命
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【中国联通的使命】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 中国联通的使命|联通世界，创享美好智慧生活|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-联通党建-中国联通的核心价值观
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【中国联通的核心价值观】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 中国联通的核心价值观|客户为本、团队共进、开放创新、追求卓越|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-联通党建-中国联通的经营管理理念
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【中国联通的经营管理理念】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 中国联通的经营管理理念|一切为了客户，一切为了一线，一切为了市场|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-联通党建-混改十六字方针
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【混改十六字方针】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 混改十六字方针|完善治理、强化激励、突出主业、提高效率|

    @TypicalCase @PartyBuilding
        场景大纲: 党建私有回答技能-联通党建-五新联通
        假如      用户已绑定iFlyOS客户端设备
        假如      用户已有带屏产品
        假如      用户产品【党建私有回答】技能已打开

        # 模拟用户说出【五新联通】的识别过程
        当        iFlyOS客户端发送event【SpeechRecognizer】，【Recognize】，用户音频为【<voice_content>】
        那么      iFlyOS服务端回复状态为【200】成功

        # 服务端下发意图
        那么      iFlyOS服务端回复的directive为【SpeechSynthesizer】，【Speak】,TTS音频包含【<tts_content>】
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechStarted】
        那么      iFlyOS服务端回复状态为【200】成功
        当        iFlyOS客户端发送event【SpeechSynthesizer】，【SpeechFinished】
        那么      iFlyOS服务端回复状态为【200】成功

        例子:     语料
            | voice_content | tts_content|
            | 五新联通|新基因、新治理、新运营、新动能、新生态。培育强健互联网新基因，探索完善公司混改新治理，全力加快互联网化新运营，着力增强创新发展新动能，积极构建外联内通新生态。|