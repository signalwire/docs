---
slug: "/reference/python/signalwire/relay/event/echo-event"
title: "EchoEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.EchoEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `EchoEvent`

Event for calling.call.echo.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class EchoEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name    | Type  | Required | Default | Description |
| ------- | ----- | -------- | ------- | ----------- |
| `state` | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/echo-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/echo-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 419.
