---
slug: "/reference/ruby/signal-wire/swaig/function-result/create-payment-action"
title: "create_payment_action"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult.create_payment_action"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `create_payment_action`

Create a payment action for use inside payment prompts.

## Signature

```ruby
def create_payment_action(action_type, phrase)
```

## Parameters

| Name          | Type     | Required | Default | Description     |
| ------------- | -------- | -------- | ------- | --------------- |
| `action_type` | `String` | yes      | —       | "Say" or "Play" |
| `phrase`      | `String` | yes      | —       | —               |

## Returns

`Hash`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 733.
