---
slug: "/reference/python/signalwire/core/security/session-manager/session-manager/validate-token"
title: "validate_token"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.security.session_manager.SessionManager.validate_token"
  parent: "signalwire.core.security.session_manager.SessionManager"
  module: "signalwire.core.security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py"
---
# `validate_token`

Validate a function call token

## Signature

```python
validate_token(call_id: str, function_name: str, token: str) -> bool
```

## Parameters

| Name            | Type  | Required | Default | Description                       |
| --------------- | ----- | -------- | ------- | --------------------------------- |
| `call_id`       | `str` | yes      | —       | Call session ID                   |
| `function_name` | `str` | yes      | —       | Name of the function being called |
| `token`         | `str` | yes      | —       | Token to validate                 |

## Returns

`bool` — True if valid, False otherwise

## Source

[`/src/signalwire/signalwire/core/security/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py)

Line 105.
