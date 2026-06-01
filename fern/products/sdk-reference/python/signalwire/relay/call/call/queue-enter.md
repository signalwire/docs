---
slug: "/reference/python/signalwire/relay/call/call/queue-enter"
title: "queue_enter"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.queue_enter"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `queue_enter`

Place the call in a queue.

**Modifiers:** `async`

## Signature

```python
async queue_enter(
    queue_name: str,
    *,
    control_id: Optional[str] = None,
    status_url: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name         | Type            | Required | Default | Description |
| ------------ | --------------- | -------- | ------- | ----------- |
| `queue_name` | `str`           | yes      | —       | —           |
| `control_id` | `Optional[str]` | no       | `None`  | —           |
| `status_url` | `Optional[str]` | no       | `None`  | —           |
| `...kwargs`  | `Any`           | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1268.
