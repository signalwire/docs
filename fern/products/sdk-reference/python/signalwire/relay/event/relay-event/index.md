---
slug: "/reference/python/signalwire/relay/event/relay-event"
title: "RelayEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.RelayEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `RelayEvent`

Base event — wraps the raw params dict from a signalwire.event message.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class RelayEvent
```

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `call_id`    | `str`            | yes      | —       | —           |
| `event_type` | `str`            | yes      | —       | —           |
| `params`     | `dict[str, Any]` | yes      | —       | —           |
| `timestamp`  | `float`          | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/relay-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/relay-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 13.
