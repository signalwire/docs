---
slug: "/reference/ruby/signal-wire/agent-base/reset-contexts"
title: "reset_contexts"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#reset_contexts"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `reset_contexts`

Remove all contexts, returning the agent to a no-contexts state.
This is a convenience wrapper around +define\_contexts.reset+.
Use it in a dynamic config callback when you need to rebuild
contexts from scratch for a specific request.

## Signature

```ruby
def reset_contexts
```

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 1082.
