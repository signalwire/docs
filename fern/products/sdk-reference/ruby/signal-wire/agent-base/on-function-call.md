---
slug: "/reference/ruby/signal-wire/agent-base/on-function-call"
title: "on_function_call"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#on_function_call"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `on_function_call`

Dispatch a function call to the registered handler.

## Signature

```ruby
def on_function_call(name, args, raw_data)
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `name`     | —    | yes      | —       | —           |
| `args`     | —    | yes      | —       | —           |
| `raw_data` | —    | yes      | —       | —           |

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 607.
