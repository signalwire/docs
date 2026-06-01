---
slug: "/reference/python/signalwire/core/function-result/function-result/record-call"
title: "record_call"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.record_call"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `record_call`

Start background call recording using SWML.

This is a virtual helper that generates SWML to start recording the call
in the background. Unlike foreground recording, the script continues
executing while recording happens in the background.

## Signature

```python
record_call(
    control_id: Optional[str] = None,
    stereo: bool = False,
    format: str = 'wav',
    direction: str = 'both',
    terminators: Optional[str] = None,
    beep: bool = False,
    input_sensitivity: float = 44.0,
    initial_timeout: Optional[float] = None,
    end_silence_timeout: Optional[float] = None,
    max_length: Optional[float] = None,
    status_url: Optional[str] = None
) -> FunctionResult
```

## Parameters

| Name                  | Type              | Required | Default  | Description                                                                      |
| --------------------- | ----------------- | -------- | -------- | -------------------------------------------------------------------------------- |
| `control_id`          | `Optional[str]`   | no       | `None`   | Identifier for this recording (for use with stop\_record\_call)                  |
| `stereo`              | `bool`            | no       | `False`  | Record in stereo (default: False)                                                |
| `format`              | `str`             | no       | `'wav'`  | Recording format - "wav" or "mp3" (default: "wav")                               |
| `direction`           | `str`             | no       | `'both'` | Audio direction - "speak", "listen", or "both" (default: "both")                 |
| `terminators`         | `Optional[str]`   | no       | `None`   | Digits that stop recording when pressed                                          |
| `beep`                | `bool`            | no       | `False`  | Play beep before recording (default: False)                                      |
| `input_sensitivity`   | `float`           | no       | `44.0`   | Input sensitivity for recording (default: 44.0)                                  |
| `initial_timeout`     | `Optional[float]` | no       | `None`   | Time in seconds to wait for speech start (for voicemail-style recording)         |
| `end_silence_timeout` | `Optional[float]` | no       | `None`   | Time in seconds to wait in silence before ending (for voicemail-style recording) |
| `max_length`          | `Optional[float]` | no       | `None`   | Maximum recording length in seconds                                              |
| `status_url`          | `Optional[str]`   | no       | `None`   | URL to send recording status events to                                           |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 883.
