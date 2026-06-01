---
slug: "/reference/python/signalwire/relay/event/message-state-event/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.event.MessageStateEvent.__init__"
  parent: "signalwire.relay.event.MessageStateEvent"
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
    message_id: str = '',
    context: str = '',
    direction: str = '',
    from_number: str = '',
    to_number: str = '',
    body: str = '',
    media: list[str] = list(),
    segments: int = 0,
    message_state: str = '',
    reason: str = '',
    tags: list[str] = list()
) -> None
```

## Parameters

| Name            | Type             | Required | Default           | Description |
| --------------- | ---------------- | -------- | ----------------- | ----------- |
| `event_type`    | `str`            | yes      | —                 | —           |
| `params`        | `dict[str, Any]` | yes      | —                 | —           |
| `call_id`       | `str`            | no       | `''`              | —           |
| `timestamp`     | `float`          | no       | `0.0`             | —           |
| `message_id`    | `str`            | no       | `''`              | —           |
| `context`       | `str`            | no       | `''`              | —           |
| `direction`     | `str`            | no       | `''`              | —           |
| `from_number`   | `str`            | no       | `''`              | —           |
| `to_number`     | `str`            | no       | `''`              | —           |
| `body`          | `str`            | no       | `''`              | —           |
| `media`         | `list[str]`      | no       | `[object Object]` | —           |
| `segments`      | `int`            | no       | `0`               | —           |
| `message_state` | `str`            | no       | `''`              | —           |
| `reason`        | `str`            | no       | `''`              | —           |
| `tags`          | `list[str]`      | no       | `[object Object]` | —           |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)
