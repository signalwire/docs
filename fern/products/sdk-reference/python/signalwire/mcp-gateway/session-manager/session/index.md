---
slug: "/reference/python/signalwire/mcp-gateway/session-manager/session"
title: "Session"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.session_manager.Session"
  parent: "signalwire.mcp_gateway.session_manager"
  module: "signalwire.mcp_gateway.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py"
---
# `Session`

Represents an active MCP session

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class Session
```

## Properties

| Name            | Type             | Required | Default | Description                                         |
| --------------- | ---------------- | -------- | ------- | --------------------------------------------------- |
| `created_at`    | `datetime`       | yes      | —       | —                                                   |
| `is_alive`      | `bool`           | yes      | —       | Check if the underlying MCP client is still running |
| `is_expired`    | `bool`           | yes      | —       | Check if session has expired based on timeout       |
| `last_accessed` | `datetime`       | yes      | —       | —                                                   |
| `metadata`      | `Dict[str, Any]` | yes      | —       | —                                                   |
| `process`       | `Any`            | yes      | —       | —                                                   |
| `service_name`  | `str`            | yes      | —       | —                                                   |
| `session_id`    | `str`            | yes      | —       | —                                                   |
| `timeout`       | `int`            | yes      | —       | —                                                   |

## Methods

- [`__init__`](/reference/python/signalwire/mcp-gateway/session-manager/session/init)
- [`touch`](/reference/python/signalwire/mcp-gateway/session-manager/session/touch) — Update last accessed time

## Source

[`/src/signalwire/signalwire/mcp_gateway/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py)

Line 28.
