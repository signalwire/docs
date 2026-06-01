---
slug: "/reference/python/signalwire/relay/message"
title: "message"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.relay.message"
  parent: "signalwire.relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py"
---
# `message`

Message object — represents an SMS/MMS message in the RELAY messaging namespace.

A Message tracks the lifecycle of a sent or received message via state events.
Outbound messages progress through: queued → initiated → sent → delivered (or
undelivered/failed).  Inbound messages arrive fully formed with state "received".

## Signature

```python
module message
```

## Properties

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `logger` | `logger` | yes      | —       | —           |

## Classes

- [`Message`](/reference/python/signalwire/relay/message/message) — Represents a single SMS/MMS message.

## Source

[`/src/signalwire/signalwire/relay/message.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py)
