---
slug: "/reference/python/signalwire/relay/call/call/connect"
title: "connect"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.connect"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `connect`

Bridge the call to one or more destinations.

**Modifiers:** `async`

## Signature

```python
async connect(
    devices: list[list[dict[str, Any]]],
    *,
    ringback: Optional[list[dict[str, Any]]] = None,
    tag: Optional[str] = None,
    max_duration: Optional[int] = None,
    max_price_per_minute: Optional[float] = None,
    status_url: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name                   | Type                             | Required | Default | Description |
| ---------------------- | -------------------------------- | -------- | ------- | ----------- |
| `devices`              | `list[list[dict[str, Any]]]`     | yes      | —       | —           |
| `ringback`             | `Optional[list[dict[str, Any]]]` | no       | `None`  | —           |
| `tag`                  | `Optional[str]`                  | no       | `None`  | —           |
| `max_duration`         | `Optional[int]`                  | no       | `None`  | —           |
| `max_price_per_minute` | `Optional[float]`                | no       | `None`  | —           |
| `status_url`           | `Optional[str]`                  | no       | `None`  | —           |
| `...kwargs`            | `Any`                            | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 604.
