---
slug: "/reference/ruby/signal-wire/swaig/function-result/pay"
title: "pay"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#pay"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `pay`

Process payment using SWML pay action.

## Signature

```ruby
def pay(payment_connector_url:, input_method: "dtmf", status_url: nil, payment_method: "credit-card", timeout: 5, max_attempts: 1, security_code: true, postal_code: true, min_postal_code_length: 0, token_type: "reusable", charge_amount: nil, currency: "usd", language: "en-US", voice: "woman", description: nil, valid_card_types: "visa mastercard amex", parameters: nil, prompts: nil, ai_response: 'The payment status is ${pay_result}, do not mention anything else about collecting payment if successful.')
```

## Parameters

| Name                      | Type | Required | Default                                                                                                       | Description |
| ------------------------- | ---- | -------- | ------------------------------------------------------------------------------------------------------------- | ----------- |
| `payment_connector_url:`  | —    | yes      | —                                                                                                             | —           |
| `input_method:`           | —    | no       | `"dtmf"`                                                                                                      | —           |
| `status_url:`             | —    | no       | `nil`                                                                                                         | —           |
| `payment_method:`         | —    | no       | `"credit-card"`                                                                                               | —           |
| `timeout:`                | —    | no       | `5`                                                                                                           | —           |
| `max_attempts:`           | —    | no       | `1`                                                                                                           | —           |
| `security_code:`          | —    | no       | `true`                                                                                                        | —           |
| `postal_code:`            | —    | no       | `true`                                                                                                        | —           |
| `min_postal_code_length:` | —    | no       | `0`                                                                                                           | —           |
| `token_type:`             | —    | no       | `"reusable"`                                                                                                  | —           |
| `charge_amount:`          | —    | no       | `nil`                                                                                                         | —           |
| `currency:`               | —    | no       | `"usd"`                                                                                                       | —           |
| `language:`               | —    | no       | `"en-US"`                                                                                                     | —           |
| `voice:`                  | —    | no       | `"woman"`                                                                                                     | —           |
| `description:`            | —    | no       | `nil`                                                                                                         | —           |
| `valid_card_types:`       | —    | no       | `"visa mastercard amex"`                                                                                      | —           |
| `parameters:`             | —    | no       | `nil`                                                                                                         | —           |
| `prompts:`                | —    | no       | `nil`                                                                                                         | —           |
| `ai_response:`            | —    | no       | `'The payment status is ${pay_result}, do not mention anything else about collecting payment if successful.'` | —           |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 586.
