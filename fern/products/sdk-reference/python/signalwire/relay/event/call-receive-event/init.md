---
slug: "/reference/python/signalwire/relay/event/call-receive-event/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.event.CallReceiveEvent.__init__"
  parent: "signalwire.relay.event.CallReceiveEvent"
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
    call_state: str = '',
    direction: str = '',
    device: dict[str, Any] = dict(),
    node_id: str = '',
    project_id: str = '',
    context: str = '',
    segment_id: str = '',
    tag: str = ''
) -> None
```

## Parameters

| Name         | Type             | Required | Default           | Description |
| ------------ | ---------------- | -------- | ----------------- | ----------- |
| `event_type` | `str`            | yes      | —                 | —           |
| `params`     | `dict[str, Any]` | yes      | —                 | —           |
| `call_id`    | `str`            | no       | `''`              | —           |
| `timestamp`  | `float`          | no       | `0.0`             | —           |
| `call_state` | `str`            | no       | `''`              | —           |
| `direction`  | `str`            | no       | `''`              | —           |
| `device`     | `dict[str, Any]` | no       | `[object Object]` | —           |
| `node_id`    | `str`            | no       | `''`              | —           |
| `project_id` | `str`            | no       | `''`              | —           |
| `context`    | `str`            | no       | `''`              | —           |
| `segment_id` | `str`            | no       | `''`              | —           |
| `tag`        | `str`            | no       | `''`              | —           |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)
