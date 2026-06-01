---
slug: "/reference/python/signalwire/core/security/session-manager/session-manager/create-tool-token"
title: "create_tool_token"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.security.session_manager.SessionManager.create_tool_token"
  parent: "signalwire.core.security.session_manager.SessionManager"
  module: "signalwire.core.security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py"
---
# `create_tool_token`

Alias for generate\_token to maintain backward compatibility

## Signature

```python
create_tool_token(function_name: str, call_id: str) -> str
```

## Parameters

| Name            | Type  | Required | Default | Description                                  |
| --------------- | ----- | -------- | ------- | -------------------------------------------- |
| `function_name` | `str` | yes      | —       | Name of the function to generate a token for |
| `call_id`       | `str` | yes      | —       | Call session ID                              |

## Returns

`str` — A secure token

## Source

[`/src/signalwire/signalwire/core/security/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py)

Line 92.
