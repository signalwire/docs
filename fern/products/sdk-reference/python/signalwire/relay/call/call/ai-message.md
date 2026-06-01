---
slug: "/reference/python/signalwire/relay/call/call/ai-message"
title: "ai_message"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.ai_message"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `ai_message`

Send a message to an active AI agent session.

**Modifiers:** `async`

## Signature

```python
async ai_message(
    *,
    message_text: Optional[str] = None,
    role: Optional[str] = None,
    reset: Optional[dict[str, Any]] = None,
    global_data: Optional[dict[str, Any]] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name           | Type                       | Required | Default | Description |
| -------------- | -------------------------- | -------- | ------- | ----------- |
| `message_text` | `Optional[str]`            | no       | `None`  | —           |
| `role`         | `Optional[str]`            | no       | `None`  | —           |
| `reset`        | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `global_data`  | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `...kwargs`    | `Any`                      | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1196.
