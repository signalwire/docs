---
slug: "/reference/python/signalwire/relay/event/tap-event"
title: "TapEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.TapEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `TapEvent`

Event for calling.call.tap.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class TapEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `control_id` | `str`            | yes      | —       | —           |
| `device`     | `dict[str, Any]` | yes      | —       | —           |
| `state`      | `str`            | yes      | —       | —           |
| `tap`        | `dict[str, Any]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/tap-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/tap-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 231.
