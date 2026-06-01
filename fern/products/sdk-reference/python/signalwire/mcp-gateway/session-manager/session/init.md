---
slug: "/reference/python/signalwire/mcp-gateway/session-manager/session/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.session_manager.Session.__init__"
  parent: "signalwire.mcp_gateway.session_manager.Session"
  module: "signalwire.mcp_gateway.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py"
---
# `__init__`

## Signature

```python
__init__(
    session_id: str,
    service_name: str,
    process: Any,
    created_at: datetime = datetime.now(),
    last_accessed: datetime = datetime.now(),
    timeout: int = 300,
    metadata: Dict[str, Any] = dict()
) -> None
```

## Parameters

| Name            | Type             | Required | Default           | Description |
| --------------- | ---------------- | -------- | ----------------- | ----------- |
| `session_id`    | `str`            | yes      | —                 | —           |
| `service_name`  | `str`            | yes      | —                 | —           |
| `process`       | `Any`            | yes      | —                 | —           |
| `created_at`    | `datetime`       | no       | `[object Object]` | —           |
| `last_accessed` | `datetime`       | no       | `[object Object]` | —           |
| `timeout`       | `int`            | no       | `300`             | —           |
| `metadata`      | `Dict[str, Any]` | no       | `[object Object]` | —           |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/mcp_gateway/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py)
