---
slug: "/reference/python/signalwire/relay/event/conference-event"
title: "ConferenceEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.ConferenceEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `ConferenceEvent`

Event for calling.conference.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class ConferenceEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name            | Type  | Required | Default | Description |
| --------------- | ----- | -------- | ------- | ----------- |
| `conference_id` | `str` | yes      | —       | —           |
| `name`          | `str` | yes      | —       | —           |
| `status`        | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/conference-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/conference-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 486.
