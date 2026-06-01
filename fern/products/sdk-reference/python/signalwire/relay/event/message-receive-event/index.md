---
slug: "/reference/python/signalwire/relay/event/message-receive-event"
title: "MessageReceiveEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.MessageReceiveEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `MessageReceiveEvent`

Event for messaging.receive — inbound message notification.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class MessageReceiveEvent(RelayEvent)
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
| `segments`      | `int`       | yes      | —       | —           |
| `tags`          | `list[str]` | yes      | —       | —           |
| `to_number`     | `str`       | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/message-receive-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/message-receive-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 530.
