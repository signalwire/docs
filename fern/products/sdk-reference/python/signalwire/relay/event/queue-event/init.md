---
slug: "/reference/python/signalwire/relay/event/queue-event/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.event.QueueEvent.__init__"
  parent: "signalwire.relay.event.QueueEvent"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `__init__`

## Signature

```python
__init__(
    event_type: str,
    params: dict[str, Any],
    call_id: str = '',
    timestamp: float = 0.0,
    control_id: str = '',
    status: str = '',
    queue_id: str = '',
    queue_name: str = '',
    position: int = 0,
    size: int = 0
) -> None
```

## Parameters

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `event_type` | `str`            | yes      | —       | —           |
| `params`     | `dict[str, Any]` | yes      | —       | —           |
| `call_id`    | `str`            | no       | `''`    | —           |
| `timestamp`  | `float`          | no       | `0.0`   | —           |
| `control_id` | `str`            | no       | `''`    | —           |
| `status`     | `str`            | no       | `''`    | —           |
| `queue_id`   | `str`            | no       | `''`    | —           |
| `queue_name` | `str`            | no       | `''`    | —           |
| `position`   | `int`            | no       | `0`     | —           |
| `size`       | `int`            | no       | `0`     | —           |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)
