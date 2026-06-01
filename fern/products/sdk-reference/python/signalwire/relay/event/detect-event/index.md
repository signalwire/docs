---
slug: "/reference/python/signalwire/relay/event/detect-event"
title: "DetectEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.DetectEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `DetectEvent`

Event for calling.call.detect.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class DetectEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `control_id` | `str`            | yes      | —       | —           |
| `detect`     | `dict[str, Any]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/detect-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/detect-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 189.
