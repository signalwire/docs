---
slug: "/reference/ruby/signal-wire/agent-base/use-pom"
title: "use_pom"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#use_pom"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `use_pom`

Python parity:

- `logger` — agent-specific structured logger (Python: `self.log`).
- `skill_manager` — owning SkillManager (Python's `self.skill_manager`).
- `agent_id` — UUID identifier from constructor or auto-generated.
- `default_webhook_url` — base URL for SWAIG webhook fallbacks.
- `native_functions` — names of built-in SWAIG functions to advertise.
- `use_pom` — whether prompt-object-model rendering is enabled.

## Signature

```ruby
attr_reader use_pom -> Object
```

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 49.
