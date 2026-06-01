---
slug: "/reference/python/signalwire/relay/event/pay-event"
title: "PayEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.PayEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `PayEvent`

Event for calling.call.pay.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class PayEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type  | Required | Default | Description |
| ------------ | ----- | -------- | ------- | ----------- |
| `control_id` | `str` | yes      | —       | —           |
| `state`      | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/pay-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/pay-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 369.
