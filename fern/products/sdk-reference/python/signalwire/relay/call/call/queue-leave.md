---
slug: "/reference/python/signalwire/relay/call/call/queue-leave"
title: "queue_leave"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.queue_leave"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `queue_leave`

Remove the call from a queue.

**Modifiers:** `async`

## Signature

```python
async queue_leave(
    queue_name: str,
    *,
    control_id: Optional[str] = None,
    queue_id: Optional[str] = None,
    status_url: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name         | Type            | Required | Default | Description |
| ------------ | --------------- | -------- | ------- | ----------- |
| `queue_name` | `str`           | yes      | —       | —           |
| `control_id` | `Optional[str]` | no       | `None`  | —           |
| `queue_id`   | `Optional[str]` | no       | `None`  | —           |
| `status_url` | `Optional[str]` | no       | `None`  | —           |
| `...kwargs`  | `Any`           | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1287.
