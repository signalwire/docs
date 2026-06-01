---
slug: "/reference/python/signalwire/core/function-result/function-result/pay"
title: "pay"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.pay"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `pay`

Process payment using SWML pay action.

This is a virtual helper that generates SWML for payment processing.

## Signature

```python
pay(
    payment_connector_url: str,
    input_method: str = 'dtmf',
    status_url: Optional[str] = None,
    payment_method: str = 'credit-card',
    timeout: int = 5,
    max_attempts: int = 1,
    security_code: bool = True,
    postal_code: Union[bool, str] = True,
    min_postal_code_length: int = 0,
    token_type: str = 'reusable',
    charge_amount: Optional[str] = None,
    currency: str = 'usd',
    language: str = 'en-US',
    voice: str = 'woman',
    description: Optional[str] = None,
    valid_card_types: str = 'visa mastercard amex',
    parameters: Optional[List[Dict[str, str]]] = None,
    prompts: Optional[List[Dict[str, Any]]] = None,
    ai_response: Optional[str] = 'The payment status is ${pay_result}, do not mention anything else about collecting payment if successful.'
) -> FunctionResult
```

## Parameters

| Name                     | Type                             | Required | Default                                                                                                       | Description                                                  |
| ------------------------ | -------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `payment_connector_url`  | `str`                            | yes      | —                                                                                                             | URL to make payment requests to (required)                   |
| `input_method`           | `str`                            | no       | `'dtmf'`                                                                                                      | Method to collect payment details ("dtmf" or "voice")        |
| `status_url`             | `Optional[str]`                  | no       | `None`                                                                                                        | URL for status change notifications                          |
| `payment_method`         | `str`                            | no       | `'credit-card'`                                                                                               | Payment method ("credit-card" currently supported)           |
| `timeout`                | `int`                            | no       | `5`                                                                                                           | Seconds to wait for next digit (default: 5)                  |
| `max_attempts`           | `int`                            | no       | `1`                                                                                                           | Number of retry attempts (default: 1)                        |
| `security_code`          | `bool`                           | no       | `True`                                                                                                        | Whether to prompt for security code (default: True)          |
| `postal_code`            | `Union[bool, str]`               | no       | `True`                                                                                                        | Whether to prompt for postal code, or actual postcode        |
| `min_postal_code_length` | `int`                            | no       | `0`                                                                                                           | Minimum postal code digits (default: 0)                      |
| `token_type`             | `str`                            | no       | `'reusable'`                                                                                                  | Payment type ("one-time" or "reusable", default: "reusable") |
| `charge_amount`          | `Optional[str]`                  | no       | `None`                                                                                                        | Amount to charge as decimal string                           |
| `currency`               | `str`                            | no       | `'usd'`                                                                                                       | Currency code (default: "usd")                               |
| `language`               | `str`                            | no       | `'en-US'`                                                                                                     | Language for prompts (default: "en-US")                      |
| `voice`                  | `str`                            | no       | `'woman'`                                                                                                     | TTS voice to use (default: "woman")                          |
| `description`            | `Optional[str]`                  | no       | `None`                                                                                                        | Custom payment description                                   |
| `valid_card_types`       | `str`                            | no       | `'visa mastercard amex'`                                                                                      | Space-separated card types (default: "visa mastercard amex") |
| `parameters`             | `Optional[List[Dict[str, str]]]` | no       | `None`                                                                                                        | Array of name/value pairs for payment connector              |
| `prompts`                | `Optional[List[Dict[str, Any]]]` | no       | `None`                                                                                                        | Array of custom prompt configurations                        |
| `ai_response`            | `Optional[str]`                  | no       | `'The payment status is ${pay_result}, do not mention anything else about collecting payment if successful.'` | —                                                            |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 797.
