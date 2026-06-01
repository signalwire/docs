---
slug: "/reference/ruby/signal-wire/swaig/function-result/switch-context"
title: "switch_context"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult#switch_context"
  parent: "SignalWire::Swaig::FunctionResult"
  module: "SignalWire.Swaig.FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `switch_context`

Switch agent context/prompt during conversation.

When only +system\_prompt+ is provided and all flags are false, emits
a simple string context switch. Otherwise emits the full object form.

## Signature

```ruby
def switch_context(system_prompt: nil, user_prompt: nil, consolidate: false, full_reset: false, isolated: false)
```

## Parameters

| Name             | Type | Required | Default | Description |
| ---------------- | ---- | -------- | ------- | ----------- |
| `system_prompt:` | —    | no       | `nil`   | —           |
| `user_prompt:`   | —    | no       | `nil`   | —           |
| `consolidate:`   | —    | no       | `false` | —           |
| `full_reset:`    | —    | no       | `false` | —           |
| `isolated:`      | —    | no       | `false` | —           |

## Returns

`self`

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 233.
