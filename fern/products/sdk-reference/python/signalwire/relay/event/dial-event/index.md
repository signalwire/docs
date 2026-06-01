---
slug: "/reference/python/signalwire/relay/event/dial-event"
title: "DialEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.DialEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `DialEvent`

Event for calling.call.dial.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class DialEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `call`       | `dict[str, Any]` | yes      | —       | —           |
| `dial_state` | `str`            | yes      | —       | —           |
| `tag`        | `str`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/dial-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/dial-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 302.
