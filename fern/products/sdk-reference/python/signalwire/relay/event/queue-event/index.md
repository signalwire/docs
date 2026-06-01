---
slug: "/reference/python/signalwire/relay/event/queue-event"
title: "QueueEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.QueueEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `QueueEvent`

Event for calling.call.queue.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class QueueEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type  | Required | Default | Description |
| ------------ | ----- | -------- | ------- | ----------- |
| `control_id` | `str` | yes      | —       | —           |
| `position`   | `int` | yes      | —       | —           |
| `queue_id`   | `str` | yes      | —       | —           |
| `queue_name` | `str` | yes      | —       | —           |
| `size`       | `int` | yes      | —       | —           |
| `status`     | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/queue-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/queue-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 390.
