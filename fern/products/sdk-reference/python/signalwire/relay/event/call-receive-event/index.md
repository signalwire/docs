---
slug: "/reference/python/signalwire/relay/event/call-receive-event"
title: "CallReceiveEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.CallReceiveEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `CallReceiveEvent`

Event for calling.call.receive — inbound call notification.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class CallReceiveEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `call_state` | `str`            | yes      | —       | —           |
| `context`    | `str`            | yes      | —       | —           |
| `device`     | `dict[str, Any]` | yes      | —       | —           |
| `direction`  | `str`            | yes      | —       | —           |
| `node_id`    | `str`            | yes      | —       | —           |
| `project_id` | `str`            | yes      | —       | —           |
| `segment_id` | `str`            | yes      | —       | —           |
| `tag`        | `str`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/call-receive-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/call-receive-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 59.
