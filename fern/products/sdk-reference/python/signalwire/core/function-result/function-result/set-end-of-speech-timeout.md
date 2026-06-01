---
slug: "/reference/python/signalwire/core/function-result/function-result/set-end-of-speech-timeout"
title: "set_end_of_speech_timeout"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.set_end_of_speech_timeout"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `set_end_of_speech_timeout`

Adjust end of speech timeout - milliseconds of silence after speaking
has been detected to finalize speech recognition.

## Signature

```python
set_end_of_speech_timeout(milliseconds: int) -> FunctionResult
```

## Parameters

| Name           | Type  | Required | Default | Description             |
| -------------- | ----- | -------- | ------- | ----------------------- |
| `milliseconds` | `int` | yes      | —       | Timeout in milliseconds |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 566.
