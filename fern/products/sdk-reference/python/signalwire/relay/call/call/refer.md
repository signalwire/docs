---
slug: "/reference/python/signalwire/relay/call/call/refer"
title: "refer"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.refer"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `refer`

Transfer a SIP call to an external SIP endpoint via REFER.

**Modifiers:** `async`

## Signature

```python
async refer(
    device: dict[str, Any],
    *,
    status_url: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `device`     | `dict[str, Any]` | yes      | —       | —           |
| `status_url` | `Optional[str]`  | no       | `None`  | —           |
| `...kwargs`  | `Any`            | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 676.
