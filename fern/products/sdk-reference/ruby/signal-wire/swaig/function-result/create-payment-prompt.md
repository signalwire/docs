---
slug: "/reference/ruby/signal-wire/swaig/function-result/create-payment-prompt"
title: "create_payment_prompt"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult.create_payment_prompt"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `create_payment_prompt`

Create a payment prompt structure for use with +pay+.

## Signature

```ruby
def create_payment_prompt(for_situation, actions, card_type: nil, error_type: nil)
```

## Parameters

| Name            | Type          | Required | Default | Description                           |
| --------------- | ------------- | -------- | ------- | ------------------------------------- |
| `for_situation` | `String`      | yes      | —       | e.g. "payment-card-number"            |
| `actions`       | `Array<Hash>` | yes      | —       | actions with "type" and "phrase" keys |
| `card_type:`    | —             | no       | `nil`   | —                                     |
| `error_type:`   | —             | no       | `nil`   | —                                     |

## Returns

`Hash`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 718.
