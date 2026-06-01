---
slug: "/reference/ruby/signal-wire/swaig/function-result/rpc-dial"
title: "rpc_dial"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#rpc_dial"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `rpc_dial`

Dial out to a number via RPC.

## Signature

```ruby
def rpc_dial(to_number:, from_number:, dest_swml:, device_type: "phone")
```

## Parameters

| Name           | Type | Required | Default   | Description |
| -------------- | ---- | -------- | --------- | ----------- |
| `to_number:`   | —    | yes      | —         | —           |
| `from_number:` | —    | yes      | —         | —           |
| `dest_swml:`   | —    | yes      | —         | —           |
| `device_type:` | —    | no       | `"phone"` | —           |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 660.
