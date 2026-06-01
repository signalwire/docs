---
slug: "/reference/python/signalwire/mcp-gateway/session-manager/session-manager/create-session"
title: "create_session"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.session_manager.SessionManager.create_session"
  parent: "signalwire.mcp_gateway.session_manager.SessionManager"
  module: "signalwire.mcp_gateway.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py"
---
# `create_session`

Create and register a new session

## Signature

```python
create_session(
    session_id: str,
    service_name: str,
    process: Any,
    timeout: Optional[int] = None,
    metadata: Optional[Dict[str, Any]] = None
) -> Session
```

## Parameters

| Name           | Type                       | Required | Default | Description |
| -------------- | -------------------------- | -------- | ------- | ----------- |
| `session_id`   | `str`                      | yes      | —       | —           |
| `service_name` | `str`                      | yes      | —       | —           |
| `process`      | `Any`                      | yes      | —       | —           |
| `timeout`      | `Optional[int]`            | no       | `None`  | —           |
| `metadata`     | `Optional[Dict[str, Any]]` | no       | `None`  | —           |

## Returns

`Session`

## Source

[`/src/signalwire/signalwire/mcp_gateway/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py)

Line 73.
