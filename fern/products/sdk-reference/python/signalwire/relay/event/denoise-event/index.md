---
slug: "/reference/python/signalwire/relay/event/denoise-event"
title: "DenoiseEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.DenoiseEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `DenoiseEvent`

Event for calling.call.denoise.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class DenoiseEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `denoised` | `bool` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/denoise-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/denoise-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 350.
