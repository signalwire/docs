---
slug: "/reference/python/signalwire/core/auth-handler/auth-handler"
title: "AuthHandler"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.auth_handler.AuthHandler"
  parent: "signalwire.core.auth_handler"
  module: "signalwire.core.auth_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/auth_handler.py"
---
# `AuthHandler`

Unified authentication handler supporting multiple auth methods.

This class provides a clean pattern for handling Basic Auth, Bearer tokens,
and API keys across all SignalWire services.

## Signature

```python
class AuthHandler
```

## Properties

| Name              | Type              | Required | Default | Description |
| ----------------- | ----------------- | -------- | ------- | ----------- |
| `basic_auth`      | `basic_auth`      | yes      | —       | —           |
| `bearer_auth`     | `bearer_auth`     | yes      | —       | —           |
| `security_config` | `security_config` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/auth-handler/auth-handler/init) — Initialize auth handler with security configuration.
- [`flask_decorator`](/reference/python/signalwire/core/auth-handler/auth-handler/flask-decorator) — Flask decorator for authentication.
- [`get_auth_info`](/reference/python/signalwire/core/auth-handler/auth-handler/get-auth-info) — Get information about configured auth methods
- [`get_fastapi_dependency`](/reference/python/signalwire/core/auth-handler/auth-handler/get-fastapi-dependency) — Get FastAPI dependency for authentication.
- [`verify_api_key`](/reference/python/signalwire/core/auth-handler/auth-handler/verify-api-key) — Verify API key
- [`verify_basic_auth`](/reference/python/signalwire/core/auth-handler/auth-handler/verify-basic-auth) — Verify basic auth credentials
- [`verify_bearer_token`](/reference/python/signalwire/core/auth-handler/auth-handler/verify-bearer-token) — Verify bearer token

## Source

[`/src/signalwire/signalwire/core/auth_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/auth_handler.py)

Line 30.
