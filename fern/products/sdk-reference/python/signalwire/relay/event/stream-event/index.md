---
slug: "/reference/python/signalwire/relay/event/stream-event"
title: "StreamEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.StreamEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `StreamEvent`

Event for calling.call.stream.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class StreamEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type  | Required | Default | Description |
| ------------ | ----- | -------- | ------- | ----------- |
| `control_id` | `str` | yes      | —       | —           |
| `name`       | `str` | yes      | —       | —           |
| `state`      | `str` | yes      | —       | —           |
| `url`        | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/stream-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/stream-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 256.
