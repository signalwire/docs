---
slug: "/reference/python/signalwire/relay/call/call/bind-digit"
title: "bind_digit"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.bind_digit"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `bind_digit`

Bind a DTMF digit sequence to trigger a RELAY method.

**Modifiers:** `async`

## Signature

```python
async bind_digit(
    digits: str,
    bind_method: str,
    *,
    bind_params: Optional[dict[str, Any]] = None,
    realm: Optional[str] = None,
    max_triggers: Optional[int] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name           | Type                       | Required | Default | Description |
| -------------- | -------------------------- | -------- | ------- | ----------- |
| `digits`       | `str`                      | yes      | —       | —           |
| `bind_method`  | `str`                      | yes      | —       | —           |
| `bind_params`  | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `realm`        | `Optional[str]`            | no       | `None`  | —           |
| `max_triggers` | `Optional[int]`            | no       | `None`  | —           |
| `...kwargs`    | `Any`                      | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1027.
