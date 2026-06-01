---
slug: "/reference/python/signalwire/relay/call/call/join-conference"
title: "join_conference"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.join_conference"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `join_conference`

Join an ad-hoc audio conference.

**Modifiers:** `async`

## Signature

```python
async join_conference(
    name: str,
    *,
    muted: Optional[bool] = None,
    beep: Optional[str] = None,
    start_on_enter: Optional[bool] = None,
    end_on_exit: Optional[bool] = None,
    wait_url: Optional[str] = None,
    max_participants: Optional[int] = None,
    record: Optional[str] = None,
    region: Optional[str] = None,
    trim: Optional[str] = None,
    coach: Optional[str] = None,
    status_callback: Optional[str] = None,
    status_callback_event: Optional[str] = None,
    status_callback_event_type: Optional[str] = None,
    status_callback_method: Optional[str] = None,
    recording_status_callback: Optional[str] = None,
    recording_status_callback_event: Optional[str] = None,
    recording_status_callback_event_type: Optional[str] = None,
    recording_status_callback_method: Optional[str] = None,
    stream_obj: Optional[dict[str, Any]] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name                                   | Type                       | Required | Default | Description |
| -------------------------------------- | -------------------------- | -------- | ------- | ----------- |
| `name`                                 | `str`                      | yes      | —       | —           |
| `muted`                                | `Optional[bool]`           | no       | `None`  | —           |
| `beep`                                 | `Optional[str]`            | no       | `None`  | —           |
| `start_on_enter`                       | `Optional[bool]`           | no       | `None`  | —           |
| `end_on_exit`                          | `Optional[bool]`           | no       | `None`  | —           |
| `wait_url`                             | `Optional[str]`            | no       | `None`  | —           |
| `max_participants`                     | `Optional[int]`            | no       | `None`  | —           |
| `record`                               | `Optional[str]`            | no       | `None`  | —           |
| `region`                               | `Optional[str]`            | no       | `None`  | —           |
| `trim`                                 | `Optional[str]`            | no       | `None`  | —           |
| `coach`                                | `Optional[str]`            | no       | `None`  | —           |
| `status_callback`                      | `Optional[str]`            | no       | `None`  | —           |
| `status_callback_event`                | `Optional[str]`            | no       | `None`  | —           |
| `status_callback_event_type`           | `Optional[str]`            | no       | `None`  | —           |
| `status_callback_method`               | `Optional[str]`            | no       | `None`  | —           |
| `recording_status_callback`            | `Optional[str]`            | no       | `None`  | —           |
| `recording_status_callback_event`      | `Optional[str]`            | no       | `None`  | —           |
| `recording_status_callback_event_type` | `Optional[str]`            | no       | `None`  | —           |
| `recording_status_callback_method`     | `Optional[str]`            | no       | `None`  | —           |
| `stream_obj`                           | `Optional[dict[str, Any]]` | no       | `None`  | —           |
| `...kwargs`                            | `Any`                      | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 884.
