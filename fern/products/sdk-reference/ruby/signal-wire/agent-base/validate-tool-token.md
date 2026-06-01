---
slug: "/reference/ruby/signal-wire/agent-base/validate-tool-token"
title: "validate_tool_token"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#validate_tool_token"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `validate_tool_token`

Validate a per-call SWAIG-function token. Returns false when the
function is not registered, when the SessionManager rejects the
token, or on any underlying exception.

Python parity: state\_mixin.StateMixin#validate\_tool\_token —
rejects unknown function names up-front and rescues exceptions.

## Signature

```ruby
def validate_tool_token(function_name, token, call_id)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `function_name` | —    | yes      | —       | —           |
| `token`         | —    | yes      | —       | —           |
| `call_id`       | —    | yes      | —       | —           |

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 599.
