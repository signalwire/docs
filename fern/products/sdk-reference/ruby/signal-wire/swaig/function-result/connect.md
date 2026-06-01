---
slug: "/reference/ruby/signal-wire/swaig/function-result/connect"
title: "connect"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#connect"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `connect`

Connect / transfer the call to another destination.

## Signature

```ruby
def connect(destination, final: true, from_addr: nil)
```

## Parameters

| Name          | Type     | Required | Default | Description                     |
| ------------- | -------- | -------- | ------- | ------------------------------- |
| `destination` | `String` | yes      | —       | phone number, SIP address, etc. |
| `final:`      | —        | no       | `true`  | —                               |
| `from_addr:`  | —        | no       | `nil`   | —                               |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 80.
