---
slug: "/reference/python/signalwire/relay/event/echo-event/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.event.EchoEvent.__init__"
  parent: "signalwire.relay.event.EchoEvent"
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
    state: str = ''
) -> None
```

## Parameters

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `event_type` | `str`            | yes      | —       | —           |
| `params`     | `dict[str, Any]` | yes      | —       | —           |
| `call_id`    | `str`            | no       | `''`    | —           |
| `timestamp`  | `float`          | no       | `0.0`   | —           |
| `state`      | `str`            | no       | `''`    | —           |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)
