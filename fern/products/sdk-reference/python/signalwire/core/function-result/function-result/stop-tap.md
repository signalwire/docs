---
slug: "/reference/python/signalwire/core/function-result/function-result/stop-tap"
title: "stop_tap"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.stop_tap"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `stop_tap`

Stop an active tap stream using SWML.

This is a virtual helper that generates SWML to stop a tap stream
that was started with tap().

## Signature

```python
stop_tap(control_id: Optional[str] = None) -> FunctionResult
```

## Parameters

| Name         | Type            | Required | Default | Description                                                                       |
| ------------ | --------------- | -------- | ------- | --------------------------------------------------------------------------------- |
| `control_id` | `Optional[str]` | no       | `None`  | ID of the tap to stop (optional) If not set, the last tap started will be stopped |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1253.
