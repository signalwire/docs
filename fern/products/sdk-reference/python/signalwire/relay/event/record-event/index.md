---
slug: "/reference/python/signalwire/relay/event/record-event"
title: "RecordEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.RecordEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `RecordEvent`

Event for calling.call.record.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class RecordEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `control_id` | `str`            | yes      | —       | —           |
| `duration`   | `float`          | yes      | —       | —           |
| `record`     | `dict[str, Any]` | yes      | —       | —           |
| `size`       | `int`            | yes      | —       | —           |
| `state`      | `str`            | yes      | —       | —           |
| `url`        | `str`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/record-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/record-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 113.
