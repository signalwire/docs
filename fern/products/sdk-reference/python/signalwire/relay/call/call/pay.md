---
slug: "/reference/python/signalwire/relay/call/call/pay"
title: "pay"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.pay"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `pay`

Start a payment collection. Returns a PayAction.

**Modifiers:** `async`

## Signature

```python
async pay(
    payment_connector_url: str,
    *,
    control_id: Optional[str] = None,
    input_method: Optional[str] = None,
    status_url: Optional[str] = None,
    payment_method: Optional[str] = None,
    timeout: Optional[str] = None,
    max_attempts: Optional[str] = None,
    security_code: Optional[str] = None,
    postal_code: Optional[str] = None,
    min_postal_code_length: Optional[str] = None,
    token_type: Optional[str] = None,
    charge_amount: Optional[str] = None,
    currency: Optional[str] = None,
    language: Optional[str] = None,
    voice: Optional[str] = None,
    description: Optional[str] = None,
    valid_card_types: Optional[str] = None,
    parameters: Optional[list[dict[str, Any]]] = None,
    prompts: Optional[list[dict[str, Any]]] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> PayAction
```

## Parameters

| Name                     | Type                                  | Required | Default | Description |
| ------------------------ | ------------------------------------- | -------- | ------- | ----------- |
| `payment_connector_url`  | `str`                                 | yes      | —       | —           |
| `control_id`             | `Optional[str]`                       | no       | `None`  | —           |
| `input_method`           | `Optional[str]`                       | no       | `None`  | —           |
| `status_url`             | `Optional[str]`                       | no       | `None`  | —           |
| `payment_method`         | `Optional[str]`                       | no       | `None`  | —           |
| `timeout`                | `Optional[str]`                       | no       | `None`  | —           |
| `max_attempts`           | `Optional[str]`                       | no       | `None`  | —           |
| `security_code`          | `Optional[str]`                       | no       | `None`  | —           |
| `postal_code`            | `Optional[str]`                       | no       | `None`  | —           |
| `min_postal_code_length` | `Optional[str]`                       | no       | `None`  | —           |
| `token_type`             | `Optional[str]`                       | no       | `None`  | —           |
| `charge_amount`          | `Optional[str]`                       | no       | `None`  | —           |
| `currency`               | `Optional[str]`                       | no       | `None`  | —           |
| `language`               | `Optional[str]`                       | no       | `None`  | —           |
| `voice`                  | `Optional[str]`                       | no       | `None`  | —           |
| `description`            | `Optional[str]`                       | no       | `None`  | —           |
| `valid_card_types`       | `Optional[str]`                       | no       | `None`  | —           |
| `parameters`             | `Optional[list[dict[str, Any]]]`      | no       | `None`  | —           |
| `prompts`                | `Optional[list[dict[str, Any]]]`      | no       | `None`  | —           |
| `on_completed`           | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`              | `Any`                                 | no       | `{}`    | —           |

## Returns

`PayAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 694.
