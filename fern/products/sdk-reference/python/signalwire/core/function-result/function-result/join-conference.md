---
slug: "/reference/python/signalwire/core/function-result/function-result/join-conference"
title: "join_conference"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.join_conference"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `join_conference`

Join an ad-hoc audio conference with RELAY and CXML calls using SWML.

This is a virtual helper that generates SWML to join audio conferences
with extensive configuration options for call management and recording.

## Signature

```python
join_conference(
    name: str,
    muted: bool = False,
    beep: str = 'true',
    start_on_enter: bool = True,
    end_on_exit: bool = False,
    wait_url: Optional[str] = None,
    max_participants: int = 250,
    record: str = 'do-not-record',
    region: Optional[str] = None,
    trim: str = 'trim-silence',
    coach: Optional[str] = None,
    status_callback_event: Optional[str] = None,
    status_callback: Optional[str] = None,
    status_callback_method: str = 'POST',
    recording_status_callback: Optional[str] = None,
    recording_status_callback_method: str = 'POST',
    recording_status_callback_event: str = 'completed',
    result: Optional[Any] = None
) -> FunctionResult
```

## Parameters

| Name                               | Type            | Required | Default           | Description                                                                                     |
| ---------------------------------- | --------------- | -------- | ----------------- | ----------------------------------------------------------------------------------------------- |
| `name`                             | `str`           | yes      | —                 | Name of conference (required)                                                                   |
| `muted`                            | `bool`          | no       | `False`           | Whether to join muted (default: False)                                                          |
| `beep`                             | `str`           | no       | `'true'`          | Beep configuration - "true", "false", "onEnter", "onExit" (default: "true")                     |
| `start_on_enter`                   | `bool`          | no       | `True`            | Whether conference starts when this participant enters (default: True)                          |
| `end_on_exit`                      | `bool`          | no       | `False`           | Whether conference ends when this participant exits (default: False)                            |
| `wait_url`                         | `Optional[str]` | no       | `None`            | SWML URL for hold music (default: None for default hold music)                                  |
| `max_participants`                 | `int`           | no       | `250`             | Maximum participants <= 250 (default: 250)                                                      |
| `record`                           | `str`           | no       | `'do-not-record'` | Recording mode - "do-not-record", "record-from-start" (default: "do-not-record")                |
| `region`                           | `Optional[str]` | no       | `None`            | Conference region (default: None)                                                               |
| `trim`                             | `str`           | no       | `'trim-silence'`  | Trim silence - "trim-silence", "do-not-trim" (default: "trim-silence")                          |
| `coach`                            | `Optional[str]` | no       | `None`            | SWML Call ID or CXML CallSid for coaching (default: None)                                       |
| `status_callback_event`            | `Optional[str]` | no       | `None`            | Events to report - "start end join leave mute hold modify speaker announcement" (default: None) |
| `status_callback`                  | `Optional[str]` | no       | `None`            | URL for status callbacks (default: None)                                                        |
| `status_callback_method`           | `str`           | no       | `'POST'`          | HTTP method - "GET", "POST" (default: "POST")                                                   |
| `recording_status_callback`        | `Optional[str]` | no       | `None`            | URL for recording status callbacks (default: None)                                              |
| `recording_status_callback_method` | `str`           | no       | `'POST'`          | HTTP method - "GET", "POST" (default: "POST")                                                   |
| `recording_status_callback_event`  | `str`           | no       | `'completed'`     | Recording events - "in-progress completed absent" (default: "completed")                        |
| `result`                           | `Optional[Any]` | no       | `None`            | Switch on return\_value when object {} or cond when array \[] (default: None)                   |

## Returns

`FunctionResult` — self for method chaining

## Throws

- `ValueError` — If beep value is invalid or max\_participants exceeds 250

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1046.
