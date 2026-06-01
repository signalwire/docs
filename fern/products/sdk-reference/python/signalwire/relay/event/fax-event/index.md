---
slug: "/reference/python/signalwire/relay/event/fax-event"
title: "FaxEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.FaxEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `FaxEvent`

Event for calling.call.fax.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class FaxEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `control_id` | `str`            | yes      | —       | —           |
| `fax`        | `dict[str, Any]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/fax-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/fax-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 210.
