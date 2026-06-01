---
slug: "/reference/python/signalwire/relay/event/refer-event"
title: "ReferEvent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.event.ReferEvent"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `ReferEvent`

Event for calling.call.refer.

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class ReferEvent(RelayEvent)
```

## Inheritance

**Extends:** [RelayEvent](/reference/python/signalwire/relay/event/relay-event)

## Properties

| Name                       | Type  | Required | Default | Description |
| -------------------------- | ----- | -------- | ------- | ----------- |
| `sip_notify_response_code` | `str` | yes      | —       | —           |
| `sip_refer_response_code`  | `str` | yes      | —       | —           |
| `sip_refer_to`             | `str` | yes      | —       | —           |
| `state`                    | `str` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/event/refer-event/init)
- [`from_payload`](/reference/python/signalwire/relay/event/refer-event/from-payload)

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 325.
