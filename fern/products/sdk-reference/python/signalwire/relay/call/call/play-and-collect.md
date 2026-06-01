---
slug: "/reference/python/signalwire/relay/call/call/play-and-collect"
title: "play_and_collect"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.play_and_collect"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `play_and_collect`

Play audio and collect digit/speech input.

**Modifiers:** `async`

## Signature

```python
async play_and_collect(
    media: list[dict[str, Any]],
    collect: dict[str, Any],
    *,
    volume: Optional[float] = None,
    control_id: Optional[str] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> CollectAction
```

## Parameters

| Name           | Type                                  | Required | Default | Description |
| -------------- | ------------------------------------- | -------- | ------- | ----------- |
| `media`        | `list[dict[str, Any]]`                | yes      | —       | —           |
| `collect`      | `dict[str, Any]`                      | yes      | —       | —           |
| `volume`       | `Optional[float]`                     | no       | `None`  | —           |
| `control_id`   | `Optional[str]`                       | no       | `None`  | —           |
| `on_completed` | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`    | `Any`                                 | no       | `{}`    | —           |

## Returns

`CollectAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 542.
