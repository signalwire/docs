---
slug: "/reference/python/signalwire/relay/event/play-event"
title: "PlayEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.PlayEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `PlayEvent`

Event for calling.call.play.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class PlayEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type  | Required | Default | Description |
| ------------ | ----- | -------- | ------- | ----------- |
| `control_id` | `str` | yes      | —       | —           |
| `state`      | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/play-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/play-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 92.
