---
slug: "/reference/ruby/signal-wire/swaig/function-result/swml-transfer"
title: "swml_transfer"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#swml_transfer"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `swml_transfer`

Transfer via SWML with an AI response when transfer completes.

## Signature

```ruby
def swml_transfer(dest, ai_response, final: true)
```

## Parameters

| Name          | Type     | Required | Default | Description                             |
| ------------- | -------- | -------- | ------- | --------------------------------------- |
| `dest`        | `String` | yes      | —       | destination URL for the transfer        |
| `ai_response` | `String` | yes      | —       | message AI says when transfer completes |
| `final:`      | —        | no       | `true`  | —                                       |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 104.
