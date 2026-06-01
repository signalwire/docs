---
slug: "/reference/python/signalwire/core/function-result/function-result/create-payment-parameter"
title: "create_payment_parameter"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.create_payment_parameter"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `create_payment_parameter`

Create a payment parameter for use with pay() method.

**Modifiers:** `static`

## Signature

```python
@staticmethod
create_payment_parameter(name: str, value: str) -> Dict[str, str]
```

## Parameters

| Name    | Type  | Required | Default | Description     |
| ------- | ----- | -------- | ------- | --------------- |
| `name`  | `str` | yes      | —       | Parameter name  |
| `value` | `str` | yes      | —       | Parameter value |

## Returns

`Dict[str, str]` — Dictionary representing the parameter

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1486.
