---
slug: "/reference/python/signalwire/relay/event/connect-event"
title: "ConnectEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.ConnectEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `ConnectEvent`

Event for calling.call.connect.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class ConnectEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name            | Type             | Required | Default | Description |
| --------------- | ---------------- | -------- | ------- | ----------- |
| `connect_state` | `str`            | yes      | —       | —           |
| `peer`          | `dict[str, Any]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/connect-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/connect-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 168.
