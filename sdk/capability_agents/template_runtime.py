# -*- coding: utf-8 -*-

"""
TemplateRuntime模块
"""


class TemplateRuntime(object):
    '''
    TemplateRuntime类
    '''

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iflyos核心处理模块
        '''
        self.namespace = 'TemplateRuntime'
        self.iflyos = iflyos

    def render_template(self, directive):
        '''
        生成可视界面模板(云端directive　name方法)
        :param directive:云端下发的directive
        :return:
        '''
        # Text Only template

        # {
        #    "directive": {
        #       "header": {
        #            "namespace": "TemplateRuntime",
        #            "name": "RenderTemplate",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "token": "{{STRING}}",
        #            "type": "BodyTemplate1",
        #            "title": {
        #                "mainTitle": "{{STRING}}",
        #                "subTitle": "{{STRING}}"
        #            },
        #            "skillIcon": {{IMAGE STRUCTURE}},
        #            "textField": "{{STRING}}"
        #       }
        #   }
        # }

        # Text with one image template

        # {
        #    "directive": {
        #       "header": {
        #            "namespace": "TemplateRuntime",
        #            "name": "RenderTemplate",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "token": "{{STRING}}",
        #            "type": "BodyTemplate2",
        #            "title": {
        #                "mainTitle": "{{STRING}}",
        #                "subTitle": "{{STRING}}"
        #            },
        #           "skillIcon": {{IMAGE_STRUCTURE}},
        #           "textField": "{{STRING}}",
        #           "image": {{IMAGE_STRUCTURE}},
        #       }
        #   }
        # }

        # List  template

        # {
        #   "directive": {
        #       "header": {
        #       "namespace": "TemplateRuntime",
        #       "name": "RenderTemplate",
        #       "messageId": "{{STRING}}",
        #       "dialogRequestId": "{{STRING}}"
        #   },
        #   "payload": {
        #       "token": "{{STRING}}",
        #       "type": "ListTemplate1",
        #       "title": {
        #           "mainTitle": "{{STRING}}",
        #           "subTitle": "{{STRING}}"
        #       },
        #       "skillIcon": {{IMAGE_STRUCTURE}},
        #       "listItems": [
        #           {
        #               "leftTextField": "{{STRING}}",
        #               "rightTextField": "{{STRING}}"
        #           },
        #           {
        #               "leftTextField": "{{STRING}}",
        #               "rightTextField": "{{STRING}}"
        #           },
        #           {
        #               ...
        #           }
        #       ]
        #    }
        # }

        # Weather template

        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "TemplateRuntime",
        #            "name": "RenderTemplate",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "token": "{{STRING}}",
        #            "type": "WeatherTemplate",
        #            "title": {
        #                "mainTitle": "{{STRING}}",
        #                "subTitle": "{{STRING}}"
        #            },
        #            "skillIcon": {{IMAGE_STRUCTURE}},
        #            "currentWeather": "{{STRING}}",
        #            "description": "{{STRING}}",
        #            "currentWeatherIcon": {{IMAGE_STRUCTURE}},
        #            "highTemperature": {
        #                "value": "{{STRING}}",
        #                "arrow": {{IMAGE_STRUCTURE}}
        #            },
        #            "lowTemperature": {
        #                "value": "{{STRING}}",
        #                "arrow": {{IMAGE_STRUCTURE}}
        #            },
        #            "weatherForecast": [
        #                {
        #                    "image": {{IMAGE_STRUCTURE}},
        #                    "day": "{{STRING}}",
        #                    "date": "{{STRING}}",
        #                    "highTemperature": "{{STRING}}",
        #                    "lowTemperature": "{{STRING}}"
        #                },
        #                {
        #                    "image": {{IMAGE_STRUCTURE}},
        #                    "day": "{{STRING}}",
        #                    "date": "{{STRING}}",
        #                    "highTemperature": "{{STRING}}",
        #                    "lowTemperature": "{{STRING}}"
        #                },
        #                {
        #                    ...
        #                }
        #            ]
        #        }
        #    }
        # }
        payload = directive['payload']
        token = payload['token']
        template_type = payload['type']

    def render_player_info(self, directive):
        '''
        生成可视界面模板(云端directive　name方法)
        :param directive:云端下发的directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "TemplateRuntime",
        #            "name": "RenderPlayerInfo",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "audioItemId": "{{STRING}}",
        #            "content": {
        #                "title": "{{STRING}}",
        #                "titleSubtext1": "{{STRING}}",
        #                "titleSubtext2": "{{STRING}}",
        #                "header": "{{STRING}}",
        #                "headerSubtext1": "{{STRING}}",
        #                "mediaLengthInMilliseconds": {{LONG}},
        #                "art": {{IMAGE_STRUCTURE}},
        #                "provider": {
        #                    "name": "{{STRING}}",
        #                    "logo": {{IMAGE_STRUCTURE}}
        #                }
        #            },
        #            "controls": [
        #                {
        #                    "type": "BUTTON",
        #                    "name": "{{STRING}}",
        #                    "enabled": {{BOOLEAN}},
        #                    "selected": {{BOOLEAN}}
        #                },
        #                {
        #                    "type": "BUTTON",
        #                    "name": "{{STRING}}",
        #                    "enabled": {{BOOLEAN}},
        #                    "selected": {{BOOLEAN}}
        #                },
        #                {
        #                    ...
        #                }
        #            ]
        #        }
        #    }
        # }
        pass
