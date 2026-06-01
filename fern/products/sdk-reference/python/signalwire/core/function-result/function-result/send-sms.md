---
slug: "/reference/python/signalwire/core/function-result/function-result/send-sms"
title: "send_sms"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.send_sms"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `send_sms`

Send a text message to a PSTN phone number using SWML.

This is a virtual helper that generates SWML to send SMS messages.
Either body or media (or both) must be provided.

## Signature

```python
send_sms(
    to_number: str,
    from_number: str,
    body: Optional[str] = None,
    media: Optional[List[str]] = None,
    tags: Optional[List[str]] = None,
    region: Optional[str] = None
) -> FunctionResult
```

## Parameters

| Name          | Type                  | Required | Default | Description                                                      |
| ------------- | --------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `to_number`   | `str`                 | yes      | —       | Phone number in E.164 format to send to                          |
| `from_number` | `str`                 | yes      | —       | Phone number in E.164 format to send from                        |
| `body`        | `Optional[str]`       | no       | `None`  | Body text of the message (optional if media provided)            |
| `media`       | `Optional[List[str]]` | no       | `None`  | Array of URLs to send in the message (optional if body provided) |
| `tags`        | `Optional[List[str]]` | no       | `None`  | Array of tags to associate with the message for UI searching     |
| `region`      | `Optional[str]`       | no       | `None`  | Region to originate the message from                             |

## Returns

`FunctionResult` — self for method chaining

## Throws

- `ValueError` — If neither body nor media is provided

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 741.
