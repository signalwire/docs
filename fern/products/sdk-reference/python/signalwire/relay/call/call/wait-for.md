---
slug: "/reference/python/signalwire/relay/call/call/wait-for"
title: "wait_for"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.wait_for"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `wait_for`

Wait for a specific event, optionally filtered by predicate.

**Modifiers:** `async`

## Signature

```python
async wait_for(
    event_type: str,
    predicate: Optional[Callable[RelayEvent, bool]] = None,
    timeout: Optional[float] = None
) -> RelayEvent
```

## Parameters

| Name         | Type                                   | Required | Default | Description |
| ------------ | -------------------------------------- | -------- | ------- | ----------- |
| `event_type` | `str`                                  | yes      | —       | —           |
| `predicate`  | `Optional[Callable[RelayEvent, bool]]` | no       | `None`  | —           |
| `timeout`    | `Optional[float]`                      | no       | `None`  | —           |

## Returns

`RelayEvent`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 391.
