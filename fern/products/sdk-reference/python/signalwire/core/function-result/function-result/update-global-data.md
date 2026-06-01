---
slug: "/reference/python/signalwire/core/function-result/function-result/update-global-data"
title: "update_global_data"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.update_global_data"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `update_global_data`

Update global agent data variables.

This is a convenience method that abstracts the set\_global\_data action.
Global data persists across the entire agent session and is available
in prompt variables and can be accessed by all functions.

## Signature

```python
update_global_data(data: Dict[str, Any]) -> FunctionResult
```

## Parameters

| Name   | Type             | Required | Default | Description                                                |
| ------ | ---------------- | -------- | ------- | ---------------------------------------------------------- |
| `data` | `Dict[str, Any]` | yes      | —       | Dictionary of key-value pairs to set/update in global data |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 247.
