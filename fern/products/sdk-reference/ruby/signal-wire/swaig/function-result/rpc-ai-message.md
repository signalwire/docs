---
slug: "/reference/ruby/signal-wire/swaig/function-result/rpc-ai-message"
title: "rpc_ai_message"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#rpc_ai_message"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `rpc_ai_message`

Inject a message into an AI agent on another call.

## Signature

```ruby
def rpc_ai_message(call_id, message_text, role: "system")
```

## Parameters

| Name           | Type     | Required | Default    | Description |
| -------------- | -------- | -------- | ---------- | ----------- |
| `call_id`      | `String` | yes      | —          | —           |
| `message_text` | `String` | yes      | —          | —           |
| `role:`        | —        | no       | `"system"` | —           |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 682.
