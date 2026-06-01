---
slug: "/reference/python/signalwire/relay/message/message"
title: "Message"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.message.Message"
  parent: "signalwire.relay.message"
  module: "signalwire.relay.message"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py"
---
# `Message`

Represents a single SMS/MMS message.

For outbound messages, use `await message.wait()` to block until a
terminal state (delivered, undelivered, failed) is reached.

## Signature

```python
class Message
```

## Properties

| Name          | Type                   | Required | Default | Description                                       |
| ------------- | ---------------------- | -------- | ------- | ------------------------------------------------- |
| `body`        | `body`                 | yes      | —       | —                                                 |
| `context`     | `context`              | yes      | —       | —                                                 |
| `direction`   | `direction`            | yes      | —       | —                                                 |
| `from_number` | `from_number`          | yes      | —       | —                                                 |
| `is_done`     | `bool`                 | yes      | —       | True if the message has reached a terminal state. |
| `media`       | `list[str]`            | yes      | —       | —                                                 |
| `message_id`  | `message_id`           | yes      | —       | —                                                 |
| `reason`      | `reason`               | yes      | —       | —                                                 |
| `result`      | `Optional[RelayEvent]` | yes      | —       | The terminal RelayEvent, or None if not yet done. |
| `segments`    | `segments`             | yes      | —       | —                                                 |
| `state`       | `state`                | yes      | —       | —                                                 |
| `tags`        | `list[str]`            | yes      | —       | —                                                 |
| `to_number`   | `to_number`            | yes      | —       | —                                                 |

## Methods

- [`__init__`](/reference/python/signalwire/relay/message/message/init)
- [`__repr__`](/reference/python/signalwire/relay/message/message/repr)
- [`on`](/reference/python/signalwire/relay/message/message/on) — Register an event listener for state changes on this message.
- [`wait`](/reference/python/signalwire/relay/message/message/wait) — Block until the message reaches a terminal state.

## Source

[`/src/signalwire/signalwire/relay/message.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py)

Line 21.
