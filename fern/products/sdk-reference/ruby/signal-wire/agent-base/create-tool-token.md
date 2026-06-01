---
slug: "/reference/ruby/signal-wire/agent-base/create-tool-token"
title: "create_tool_token"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#create_tool_token"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `create_tool_token`

Mint a per-call SWAIG-function token via the agent's SessionManager.

Python parity: state\_mixin.StateMixin#\_create\_tool\_token —
delegates to SessionManager#create\_token and returns "" on any
raised error (Python rescues all exceptions and returns "").

## Signature

```ruby
def create_tool_token(tool_name, call_id)
```

## Parameters

| Name        | Type | Required | Default | Description |
| ----------- | ---- | -------- | ------- | ----------- |
| `tool_name` | —    | yes      | —       | —           |
| `call_id`   | —    | yes      | —       | —           |

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 587.
