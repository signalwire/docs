---
slug: "/reference/python/signalwire/relay/call/call/stream"
title: "stream"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.stream"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `stream`

Start streaming call audio to a WebSocket endpoint. Returns a StreamAction.

**Modifiers:** `async`

## Signature

```python
async stream(
    url: str,
    *,
    name: Optional[str] = None,
    codec: Optional[str] = None,
    track: Optional[str] = None,
    status_url: Optional[str] = None,
    status_url_method: Optional[str] = None,
    authorization_bearer_token: Optional[str] = None,
    custom_parameters: Optional[dict[str, Any]] = None,
    control_id: Optional[str] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> StreamAction
```

## Parameters

| Name                         | Type                                  | Required | Default | Description |
| ---------------------------- | ------------------------------------- | -------- | ------- | ----------- |
| `url`                        | `str`                                 | yes      | —       | —           |
| `name`                       | `Optional[str]`                       | no       | `None`  | —           |
| `codec`                      | `Optional[str]`                       | no       | `None`  | —           |
| `track`                      | `Optional[str]`                       | no       | `None`  | —           |
| `status_url`                 | `Optional[str]`                       | no       | `None`  | —           |
| `status_url_method`          | `Optional[str]`                       | no       | `None`  | —           |
| `authorization_bearer_token` | `Optional[str]`                       | no       | `None`  | —           |
| `custom_parameters`          | `Optional[dict[str, Any]]`            | no       | `None`  | —           |
| `control_id`                 | `Optional[str]`                       | no       | `None`  | —           |
| `on_completed`               | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`                  | `Any`                                 | no       | `{}`    | —           |

## Returns

`StreamAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 830.
