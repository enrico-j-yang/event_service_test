# -*- coding: utf-8 -*-
'''
系统模块
'''
import datetime
import uuid


class System(object):
    '''
    系统控制类
    '''

    def __init__(self, iflyos):
        '''
        类初始化
        :param iflyos:iflyos核心模块实例
        '''
        self.namespace = 'System'
        self.iflyos = iflyos
        self.endpoint = None
        self.unparsed_directive = self.iflyos.unparsed_directive
        self.error = self.iflyos.error
        self._firmware_version = '1'

    def synchronize_state(self):
        '''
        SynchronizeState状态上报(iflyos_core中会使用)
        :return:
        '''
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "SynchronizeState",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
            }
        }

        self.iflyos.send_event(event)

    def user_inactivity_report(self):
        '''
        UserInactivityReport状态上报
        :return:
        '''
        inactive_time = datetime.datetime.utcnow() - self.iflyos.last_activity

        event = {
            "header": {
                "namespace": self.namespace,
                "name": "UserInactivityReport",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "inactiveTimeInSeconds": inactive_time.seconds
            }

        }

        self.iflyos.send_event(event)

    def reset_user_inactivity(self, directive):
        '''
        重置“用户最近一次交互”的时间点为当前时间(云端directive　name方法)
        :param directive:云端下发directive
        :return:
        '''
        self.iflyos.last_activity = datetime.datetime.utcnow()

    # {
    #     "directive": {
    #         "header": {
    #             "namespace": "System",
    #             "name": "SetEndpoint",
    #             "messageId": "{{STRING}}"
    #         },
    #         "payload": {
    #             "endpoint": "{{STRING}}"
    #         }
    #     }
    # }

    def set_endpoint(self, directive):
        '''
        设置服务端接入地址，重置连接(云端directive　name方法)
        :param directive:云端下发directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "System",
        #            "name": "SetEndpoint",
        #            "messageId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "endpoint": "{{STRING}}"
        #        }
        #    }
        # }
        self.endpoint = directive['payload']['endpoint']

    def software_info(self):
        '''
        SoftwareInfo软件版本上报
        :return:
        '''

        # TODO: get firmware version by firmware api

        event = {
            "header": {
                "namespace": self.namespace,
                "name": "SoftwareInfo",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "firmwareVersion": self._firmware_version
            }

        }

        self.iflyos.send_event(event)

    def report_software_info(self, directive):
        '''
        请求软件版本(云端directive　name方法)
        :param directive:云端下发directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "System",
        #            "name": "ReportSoftwareInfo",
        #            "messageId": "{{STRING}}"
        #        },
        #        "payload": {
        #        }
        #    }
        # }
        pass

    def exception_encountered(self):
        '''
        ExceptionEncountered状态上报
        :return:
        '''
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "ExceptionEncountered",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "unparsedDirective": self.unparsed_directive,
                "error": {
                    "type": self.error['type'],
                    "message": self.error['message']
                }
            }
        }
        self.iflyos.send_event(event)

    def throw_exception(self, directive):
        '''
        当设备端发送的请求格式不正确、登录的认证信息过期等错误情况发生时，服务端会返回ThrowException指令给设备端
        (云端directive　name方法)
        :param directive: 云端下发directive
        :return:
        '''
        # {
        #   "header": {
        #       "namespace": "System",
        #        "name": "Exception",
        #       "messageId": "{{STRING}}"
        #   },
        #
        #   "payload": {
        #       "code": "{{STRING}}",
        #       "description": "{{STRING}}"
        #   }
        # }
        code = directive['payload']['code']
        description = directive['payload']['description']

    def set_firmware_version(self, firmware_version):
        '''
        firmware_version，测试用
        :return:
        '''
        self._firmware_version = firmware_version

    def set_sleep_config(self, directive):
        self.sleep_start_time = directive['payload']
        self.sleep_end_time = directive['payload']
