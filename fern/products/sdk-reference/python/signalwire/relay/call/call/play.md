---
slug: "/reference/python/signalwire/relay/call/call/play"
title: "play"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.play"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `play`

Play audio content. Returns a PlayAction for stop/pause/resume/wait.

**Modifiers:** `async`

## Signature

```python
async play(
    media: list[dict[str, Any]],
    *,
    volume: Optional[float] = None,
    direction: Optional[str] = None,
    loop: Optional[int] = None,
    control_id: Optional[str] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> PlayAction
```

## Parameters

| Name           | Type                                  | Required | Default | Description |
| -------------- | ------------------------------------- | -------- | ------- | ----------- |
| `media`        | `list[dict[str, Any]]`                | yes      | —       | —           |
| `volume`       | `Optional[float]`                     | no       | `None`  | —           |
| `direction`    | `Optional[str]`                       | no       | `None`  | —           |
| `loop`         | `Optional[int]`                       | no       | `None`  | —           |
| `control_id`   | `Optional[str]`                       | no       | `None`  | —           |
| `on_completed` | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`    | `Any`                                 | no       | `{}`    | —           |

## Returns

`PlayAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 494.
