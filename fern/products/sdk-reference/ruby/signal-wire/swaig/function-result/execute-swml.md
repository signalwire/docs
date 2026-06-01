---
slug: "/reference/ruby/signal-wire/swaig/function-result/execute-swml"
title: "execute_swml"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#execute_swml"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `execute_swml`

Execute SWML content with optional transfer.

## Signature

```ruby
def execute_swml(swml_content, transfer: false)
```

## Parameters

| Name           | Type             | Required | Default | Description                        |
| -------------- | ---------------- | -------- | ------- | ---------------------------------- |
| `swml_content` | `Hash \| String` | yes      | —       | SWML data structure or JSON string |
| `transfer:`    | —                | no       | `false` | —                                  |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 404.
