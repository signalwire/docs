---
slug: "/reference/python/signalwire/core/auth-handler/auth-handler/flask-decorator"
title: "flask_decorator"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.auth_handler.AuthHandler.flask_decorator"
  parent: "signalwire.core.auth_handler.AuthHandler"
  module: "signalwire.core.auth_handler"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/auth_handler.py"
---
# `flask_decorator`

Flask decorator for authentication.

This provides compatibility with Flask-based services like MCP Gateway.

## Signature

```python
flask_decorator(f: Callable) -> Callable
```

## Parameters

| Name | Type       | Required | Default | Description |
| ---- | ---------- | -------- | ------- | ----------- |
| `f`  | `Callable` | yes      | —       | —           |

## Returns

`Callable`

## Source

[`/src/signalwire/signalwire/core/auth_handler.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/auth_handler.py)

Line 160.
