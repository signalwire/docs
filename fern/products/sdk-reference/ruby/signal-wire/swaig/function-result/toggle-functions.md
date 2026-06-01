---
slug: "/reference/ruby/signal-wire/swaig/function-result/toggle-functions"
title: "toggle_functions"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#toggle_functions"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `toggle_functions`

Enable / disable specific SWAIG functions.

## Signature

```ruby
def toggle_functions(toggles)
```

## Parameters

| Name      | Type          | Required | Default | Description                            |
| --------- | ------------- | -------- | ------- | -------------------------------------- |
| `toggles` | `Array<Hash>` | yes      | —       | each with "function" and "active" keys |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 370.
