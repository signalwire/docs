---
slug: "/reference/python/signalwire/relay/event/parse-event"
title: "parse_event"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.relay.event.parse_event"
  parent: "signalwire.relay.event"
  module: "signalwire.relay.event"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py"
---
# `parse_event`

Parse a raw signalwire.event params dict into a typed event object.

## Signature

```python
parse_event(payload: dict[str, Any]) -> RelayEvent
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `payload` | `dict[str, Any]` | yes      | —       | —           |

## Returns

`RelayEvent`

## Source

[`/src/signalwire/signalwire/relay/event.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/event.py)

Line 634.
