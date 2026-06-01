---
slug: "/reference/python/signalwire/relay/call/call/tap"
title: "tap"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.tap"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `tap`

Intercept call media and stream it. Returns a TapAction.

**Modifiers:** `async`

## Signature

```python
async tap(
    tap: dict[str, Any],
    device: dict[str, Any],
    *,
    control_id: Optional[str] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> TapAction
```

## Parameters

| Name           | Type                                  | Required | Default | Description |
| -------------- | ------------------------------------- | -------- | ------- | ----------- |
| `tap`          | `dict[str, Any]`                      | yes      | —       | —           |
| `device`       | `dict[str, Any]`                      | yes      | —       | —           |
| `control_id`   | `Optional[str]`                       | no       | `None`  | —           |
| `on_completed` | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`    | `Any`                                 | no       | `{}`    | —           |

## Returns

`TapAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 806.
