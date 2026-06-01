---
slug: "/reference/python/signalwire/relay/call/call/transcribe"
title: "transcribe"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.transcribe"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `transcribe`

Start transcribing the call. Returns a TranscribeAction.

**Modifiers:** `async`

## Signature

```python
async transcribe(
    *,
    control_id: Optional[str] = None,
    status_url: Optional[str] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> TranscribeAction
```

## Parameters

| Name           | Type                                  | Required | Default | Description |
| -------------- | ------------------------------------- | -------- | ------- | ----------- |
| `control_id`   | `Optional[str]`                       | no       | `None`  | —           |
| `status_url`   | `Optional[str]`                       | no       | `None`  | —           |
| `on_completed` | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`    | `Any`                                 | no       | `{}`    | —           |

## Returns

`TranscribeAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 986.
