---
slug: "/reference/python/signalwire/relay/event/collect-event"
title: "CollectEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.CollectEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `CollectEvent`

Event for calling.call.collect.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class CollectEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `control_id` | `str`            | yes      | —       | —           |
| `final`      | `Optional[bool]` | yes      | —       | —           |
| `result`     | `dict[str, Any]` | yes      | —       | —           |
| `state`      | `str`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/collect-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/collect-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 143.
