---
slug: "/reference/python/signalwire/relay/event/call-state-event"
title: "CallStateEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.CallStateEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `CallStateEvent`

Event for calling.call.state.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class CallStateEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `call_state` | `str`            | yes      | —       | —           |
| `device`     | `dict[str, Any]` | yes      | —       | —           |
| `direction`  | `str`            | yes      | —       | —           |
| `end_reason` | `str`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/call-state-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/call-state-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 34.
