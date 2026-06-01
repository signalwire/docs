---
slug: "/reference/ruby/signal-wire/swaig/function-result/execute-rpc"
title: "execute_rpc"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#execute_rpc"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `execute_rpc`

Execute a generic RPC method via SWML.

## Signature

```ruby
def execute_rpc(method, params: nil, call_id: nil, node_id: nil)
```

## Parameters

| Name       | Type     | Required | Default | Description     |
| ---------- | -------- | -------- | ------- | --------------- |
| `method`   | `String` | yes      | —       | RPC method name |
| `params:`  | —        | no       | `nil`   | —               |
| `call_id:` | —        | no       | `nil`   | —               |
| `node_id:` | —        | no       | `nil`   | —               |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 640.
