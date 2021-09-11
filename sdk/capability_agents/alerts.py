# -*- coding: utf-8 -*-

"""
Alerts模块
"""

import os
import datetime
import dateutil.parser
from threading import Timer
import uuid
import logging


class Alerts(object):
    '''
    Alerts类
    '''
    STATES = {'IDLE', 'FOREGROUND', 'BACKGROUND'}

    def __init__(self, iflyos, player):
        '''
        类初始化
        :param iflyos:iflyos核心处理模块
        :param player: 播放器
        '''
        self.namespace = 'Alerts'
        self.iflyos = iflyos
        self.player = player

        self.player.add_callback('eos', self.stop)
        self.player.add_callback('error', self.stop)

        alarm = os.path.realpath(os.path.join(os.path.dirname(__file__), '../resources/alarm.wav'))
        self.alarm_uri = 'file://{}'.format(alarm)

        self.all_alerts = {}
        self.active_alerts = {}
        self.context_all_alerts = {}
        self.context_active_alerts = {}
        self._token = None
        self._schedule_time = None

    def set_alert(self, directive):
        '''
        设置闹钟(云端directive　name方法)
        :param directive:云端下发的directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "Alerts",
        #            "name": "SetAlert",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "token": "{{STRING}}",
        #            "type": "{{STRING}}",
        #            "scheduledTime": "{{STRING}}",
        #            "assets": [
        #                {
        #                    "assetId": "{{STRING}}",
        #                    "url": "{{STRING}}"
        #                },
        #                {
        #                    "assetId": "{{STRING}}",
        #                    "url": "{{STRING}}"
        #                },
        #            ],
        #            "assetPlayOrder": [{{LIST}}],
        #            "backgroundAlertAsset": "{{STRING}}",
        #            "loopCount": {{LONG}},
        #            "loopPauseInMilliSeconds": {{LONG}}
        #        }
        #    }
        # }
        payload = directive['payload']
        self._token = payload['token']
        logging.debug("set_alert---token:" + str(self._token))
        self._schedule_time = dateutil.parser.parse(payload['scheduledTime'])

        # Update the alert
        if self._token in self.all_alerts:
            pass

        self.all_alerts[self._token] = payload

        interval = self._schedule_time - datetime.datetime.now(self._schedule_time.tzinfo)

        try:
            Timer(interval.seconds, self._start_alert, (self._token,)).start()
        except Exception as e:
            self.iflyos.unparsed_directive = "SetAlert"
            self.iflyos.error['type'] = 'exception'
            self.iflyos.error['message'] = e

    def set_alert_succeeded(self):
        '''
        闹铃设置成功事件上报
        :return:
        '''
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "SetAlertSucceeded",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_all_alerts = self.all_alerts
        self.context_active_alerts = self.active_alerts

    def set_alert_failed(self):
        '''
        闹铃设置失败事件上报
        :return:
        '''
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "SetAlertFailed",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_all_alerts = self.all_alerts
        self.context_active_alerts = self.active_alerts
        self.iflyos.directive_sequencer.system.exception_encountered()

    def delete_alert(self, directive):
        '''
        删除闹钟(云端directive　name方法)
        :param directive: 云端下发的directive
        :return:
        '''
        # {
        #    "directive": {
        #        "header": {
        #            "namespace": "Alerts",
        #            "name": "DeleteAlert",
        #            "messageId": "{{STRING}}",
        #            "dialogRequestId": "{{STRING}}"
        #        },
        #        "payload": {
        #            "token": "{{STRING}}"
        #        }
        #    }
        # }
        self._token = directive['payload']['token']

        logging.debug("delete_alert---token:" + str(self._token))

        # if self._token in self.active_alerts:
        #     self.alert_stopped()

        if self._token in self.all_alerts:
            pass
        else:
            self.iflyos.unparsed_directive = "DeleteAlert"
            self.iflyos.error['type'] = 'exception'
            self.iflyos.error['message'] = 'can not delete alert'

    def delete_alert_succeeded(self):
        '''
        删除闹铃成功事件上报
        :return:
        '''
        self.all_alerts.__delitem__(self._token)
        if self._token in self.active_alerts:
            self.active_alerts.__delitem__(self._token)

        logging.debug("delete_alert_succeeded---token:" + str(self._token))

        event = {
            "header": {
                "namespace": self.namespace,
                "name": "DeleteAlertSucceeded",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_all_alerts = self.all_alerts
        self.context_active_alerts = self.active_alerts

    def delete_alert_failed(self):
        '''
        删除闹铃失败事件上传
        :return:
        '''
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "DeleteAlertFailed",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_all_alerts = self.all_alerts
        self.context_active_alerts = self.active_alerts
        self.iflyos.directive_sequencer.system.exception_encountered()

    def alert_started(self):
        '''
        响铃开始事件上报
        :return:
        '''
        self.active_alerts[self._token] = self.all_alerts[self._token]

        event = {
            "header": {
                "namespace": self.namespace,
                "name": "AlertStarted",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_all_alerts = self.all_alerts
        self.context_active_alerts = self.active_alerts

    def alert_stopped(self):
        '''
        响铃结束事件上报
        :return:
        '''
        if self._token in self.active_alerts:
            del self.active_alerts[self._token]

        if self._token in self.all_alerts:
            del self.all_alerts[self._token]

        event = {
            "header": {
                "namespace": self.namespace,
                "name": "AlertStopped",
                "messageId": "{STRING}"
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event, context=self.iflyos.directive_sequencer.context)
        self.context_all_alerts = self.all_alerts
        self.context_active_alerts = self.active_alerts

    def _start_alert(self, token):
        '''
        开始响铃
        :param self:
        :param token:
        :return:
        '''
        self._token = token
        if token in self.all_alerts:
            self.alert_started()

            # TODO: repeat play alarm until user stops it or timeout
            self.player.play(self.alarm_uri)

    def alert_entered_foreground(self):
        '''
        响铃进入前台事件上报
        :return:
        '''
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "AlertEnteredForeground",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event)

    def alert_entered_background(self):
        '''
        响铃进入后台事件上报
        :return:
        '''
        event = {
            "header": {
                "namespace": self.namespace,
                "name": "AlertEnteredBackground",
                "messageId": uuid.uuid4().hex
            },
            "payload": {
                "token": self._token
            }
        }

        self.iflyos.send_event(event)

    def stop(self):
        """
        停止所有激活的Alert
        """
        for token in self.active_alerts.keys():
            self._token = token
            self.alert_stopped()

        self.active_alerts = {}

    @property
    def context(self):
        '''
        获取模块上下文(模块状态)
        :return:
        '''
        return {
            "header": {
                "namespace": self.namespace,
                "name": "AlertsState"
            },
            "payload": {
                "allAlerts": list(self.context_all_alerts.values()),
                "activeAlerts": list(self.context_active_alerts.values())
            }
        }
