---
slug: "/reference/python/signalwire/relay/event/hold-event"
title: "HoldEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.HoldEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `HoldEvent`

Event for calling.call.hold.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class HoldEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name    | Type  | Required | Default | Description |
| ------- | ----- | -------- | ------- | ----------- |
| `state` | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/hold-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/hold-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 467.
