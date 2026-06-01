---
slug: "/reference/python/signalwire/relay/call/call/ai-hold"
title: "ai_hold"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.ai_hold"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `ai_hold`

Put an AI agent session on hold.

**Modifiers:** `async`

## Signature

```python
async ai_hold(
    *,
    timeout: Optional[str] = None,
    prompt: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name        | Type            | Required | Default | Description |
| ----------- | --------------- | -------- | ------- | ----------- |
| `timeout`   | `Optional[str]` | no       | `None`  | —           |
| `prompt`    | `Optional[str]` | no       | `None`  | —           |
| `...kwargs` | `Any`           | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1218.
