---
slug: "/reference/python/signalwire/relay/call/call/clear-digit-bindings"
title: "clear_digit_bindings"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.clear_digit_bindings"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `clear_digit_bindings`

Clear all digit bindings, optionally filtered by realm.

**Modifiers:** `async`

## Signature

```python
async clear_digit_bindings(
    *,
    realm: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name        | Type            | Required | Default | Description |
| ----------- | --------------- | -------- | ------- | ----------- |
| `realm`     | `Optional[str]` | no       | `None`  | —           |
| `...kwargs` | `Any`           | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1051.
