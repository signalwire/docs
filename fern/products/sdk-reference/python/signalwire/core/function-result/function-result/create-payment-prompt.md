---
slug: "/reference/python/signalwire/core/function-result/function-result/create-payment-prompt"
title: "create_payment_prompt"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.create_payment_prompt"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `create_payment_prompt`

Create a payment prompt structure for use with pay() method.

**Modifiers:** `static`

## Signature

```python
@staticmethod
create_payment_prompt(
    for_situation: str,
    actions: List[Dict[str, str]],
    card_type: Optional[str] = None,
    error_type: Optional[str] = None
) -> Dict[str, Any]
```

## Parameters

| Name            | Type                   | Required | Default | Description                                               |
| --------------- | ---------------------- | -------- | ------- | --------------------------------------------------------- |
| `for_situation` | `str`                  | yes      | —       | Situation to use prompt for (e.g., "payment-card-number") |
| `actions`       | `List[Dict[str, str]]` | yes      | —       | List of actions with 'type' and 'phrase' keys             |
| `card_type`     | `Optional[str]`        | no       | `None`  | Space-separated card types for this prompt                |
| `error_type`    | `Optional[str]`        | no       | `None`  | Space-separated error types for this prompt               |

## Returns

`Dict[str, Any]` — Dictionary representing the prompt structure

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1441.
