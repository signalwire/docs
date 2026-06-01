---
slug: "/reference/python/signalwire/relay/call/call/collect"
title: "collect"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.collect"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `collect`

Collect digit/speech input without playing media.

**Modifiers:** `async`

## Signature

```python
async collect(
    *,
    digits: Optional[dict[str, Any]] = None,
    speech: Optional[dict[str, Any]] = None,
    initial_timeout: Optional[float] = None,
    partial_results: Optional[bool] = None,
    continuous: Optional[bool] = None,
    send_start_of_input: Optional[bool] = None,
    start_input_timers: Optional[bool] = None,
    control_id: Optional[str] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> StandaloneCollectAction
```

## Parameters

| Name                  | Type                                  | Required | Default | Description |
| --------------------- | ------------------------------------- | -------- | ------- | ----------- |
| `digits`              | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `speech`              | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `initial_timeout`     | `Optional[float]`                     | no       | `None`  | —           |
| `partial_results`     | `Optional[bool]`                      | no       | `None`  | —           |
| `continuous`          | `Optional[bool]`                      | no       | `None`  | —           |
| `send_start_of_input` | `Optional[bool]`                      | no       | `None`  | —           |
| `start_input_timers`  | `Optional[bool]`                      | no       | `None`  | —           |
| `control_id`          | `Optional[str]`                       | no       | `None`  | —           |
| `on_completed`        | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`           | `Any`                                 | no       | `{}`    | —           |

## Returns

`StandaloneCollectAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 565.
