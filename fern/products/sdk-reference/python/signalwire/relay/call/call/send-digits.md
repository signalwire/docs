---
slug: "/reference/python/signalwire/relay/call/call/send-digits"
title: "send_digits"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.send_digits"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `send_digits`

Send DTMF digits on the call.

**Modifiers:** `async`

## Signature

```python
async send_digits(digits: str, *, control_id: Optional[str] = None) -> dict
```

## Parameters

| Name         | Type            | Required | Default | Description |
| ------------ | --------------- | -------- | ------- | ----------- |
| `digits`     | `str`           | yes      | —       | —           |
| `control_id` | `Optional[str]` | no       | `None`  | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 638.
