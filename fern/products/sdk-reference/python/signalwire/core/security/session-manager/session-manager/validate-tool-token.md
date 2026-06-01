---
slug: "/reference/python/signalwire/core/security/session-manager/session-manager/validate-tool-token"
title: "validate_tool_token"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.security.session_manager.SessionManager.validate_tool_token"
  parent: "signalwire.core.security.session_manager.SessionManager"
  module: "signalwire.core.security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py"
---
# `validate_tool_token`

Alias for validate\_token to maintain backward compatibility

## Signature

```python
validate_tool_token(function_name: str, token: str, call_id: str) -> bool
```

## Parameters

| Name            | Type  | Required | Default | Description                       |
| --------------- | ----- | -------- | ------- | --------------------------------- |
| `function_name` | `str` | yes      | —       | Name of the function being called |
| `token`         | `str` | yes      | —       | Token to validate                 |
| `call_id`       | `str` | yes      | —       | Call session ID                   |

## Returns

`bool` — True if valid, False otherwise

## Source

[`/src/signalwire/signalwire/core/security/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py)

Line 167.
