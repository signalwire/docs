---
slug: "/reference/python/signalwire/core/function-result/function-result/execute-swml"
title: "execute_swml"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.execute_swml"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `execute_swml`

Execute SWML content with optional transfer behavior.

## Signature

```python
execute_swml(swml_content, transfer: bool = False) -> FunctionResult
```

## Parameters

| Name           | Type   | Required | Default | Description                                              |
| -------------- | ------ | -------- | ------- | -------------------------------------------------------- |
| `swml_content` | —      | yes      | —       | Can be:                                                  |
| `transfer`     | `bool` | no       | `False` | Boolean - whether call should exit agent after execution |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 396.
