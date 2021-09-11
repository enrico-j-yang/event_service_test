# -*- coding: utf-8 -*-

import os

INVALID_PROFILE = "ERROR_PROFILE"

INVALID_FORMAT = "ERROR_AUDIO_FORMAT"

INVALID_AUDIO_TOKEN = "xxxxxxxxxxx"

INVALID_INITIATOR_TYPE = "ERROR_INITIATOR_TYPE"

CLIENT_ID = "329b67ef-1670-4c9d-ae2c-e52c4d2a4d13"

CLIENT_SECRET = "d241a5de-d1c4-413d-9bb6-1ceb54f5ba63"

TOKEN_URL = "https://staging-auth.iflyos.cn"

PHONE_NUMBER = "18148917415"

CAPTCHA = "001606"

DEVICE_ID = os.getenv("DEVICE_ID", "event_service_test_enrico").strip()

API_VERSION = os.getenv("API_VERSION", "v20180810").strip()

EVENT_SERVICE_URL = os.getenv("EVENT_SERVICE_URL", "https://staging-flow.iflyos.cn").strip()

EVENT_SERVICE_PORT = os.getenv("EVENT_SERVICE_PORT", "443").strip()

IVS_URL = os.getenv("IVS_URL", "staging-ivs.iflyos.cn").strip()

IVS_PORT = os.getenv("IVS_PORT", "443").strip()

CAPABILITY_URL = os.getenv("CAPABILITY_URL", "https://staging-api.iflyos.cn").strip()
