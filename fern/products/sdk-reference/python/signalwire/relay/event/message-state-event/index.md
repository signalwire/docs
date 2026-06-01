---
slug: "/reference/python/signalwire/relay/event/message-state-event"
title: "MessageStateEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.MessageStateEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `MessageStateEvent`

Event for messaging.state — outbound message state change.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class MessageStateEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name            | Type        | Required | Default | Description |
| --------------- | ----------- | -------- | ------- | ----------- |
| `body`          | `str`       | yes      | —       | —           |
| `context`       | `str`       | yes      | —       | —           |
| `direction`     | `str`       | yes      | —       | —           |
| `from_number`   | `str`       | yes      | —       | —           |
| `media`         | `list[str]` | yes      | —       | —           |
| `message_id`    | `str`       | yes      | —       | —           |
| `message_state` | `str`       | yes      | —       | —           |
| `reason`        | `str`       | yes      | —       | —           |
| `segments`      | `int`       | yes      | —       | —           |
| `tags`          | `list[str]` | yes      | —       | —           |
| `to_number`     | `str`       | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/message-state-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/message-state-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 567.
