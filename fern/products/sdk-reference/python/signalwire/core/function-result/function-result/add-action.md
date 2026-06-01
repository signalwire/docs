---
slug: "/reference/python/signalwire/core/function-result/function-result/add-action"
title: "add_action"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.add_action"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `add_action`

Add a structured action to the response

## Signature

```python
add_action(name: str, data: Any) -> FunctionResult
```

## Parameters

| Name   | Type  | Required | Default | Description                                                          |
| ------ | ----- | -------- | ------- | -------------------------------------------------------------------- |
| `name` | `str` | yes      | —       | The name/type of the action (e.g., "play", "transfer")               |
| `data` | `Any` | yes      | —       | The data for the action - can be a string, boolean, object, or array |

## Returns

`FunctionResult` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 114.
