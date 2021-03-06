# -*- coding: utf-8 -*-
'''
认证授权信息持久化
'''
import json
import os

# 配置文件保存位置
DEFAULT_CONFIG_FILE = os.path.join(os.path.expanduser('.'), '.iflyos.json')


def load(client_id=None, client_secret=None):
    '''
    认证授权信息加载
    :param client_id:开发者注册信息
    :param client_secret: 开发者注册信息
    :return:
    '''
    if os.path.isfile(DEFAULT_CONFIG_FILE):
        configfile = DEFAULT_CONFIG_FILE
    else:
        return {
            "client_id": client_id,
            "client_secret": client_secret
        }

    with open(configfile, 'r') as f:
        config = json.load(f)

    return config


def save(config, configfile=None):
    '''
    认证授权信息保存
    :param config:
    :param configfile:
    :return:
    '''
    if configfile is None:
        configfile = DEFAULT_CONFIG_FILE

    with open(configfile, 'w') as f:
        json.dump(config, f, indent=4)
