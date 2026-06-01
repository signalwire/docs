---
slug: "/reference/python/signalwire/relay/call/call/live-translate"
title: "live_translate"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.live_translate"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `live_translate`

Start or stop live translation on the call.

**Modifiers:** `async`

## Signature

```python
async live_translate(
    action: dict[str, Any],
    *,
    status_url: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `action`     | `dict[str, Any]` | yes      | —       | —           |
| `status_url` | `Optional[str]`  | no       | `None`  | —           |
| `...kwargs`  | `Any`            | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1078.
