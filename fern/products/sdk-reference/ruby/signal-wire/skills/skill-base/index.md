---
slug: "/reference/ruby/signal-wire/skills/skill-base"
title: "SkillBase"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillBase"
  parent: "SignalWire::Skills"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb"
  visibility: "public"
---
# `SkillBase`

Base class for all skills. Subclasses override the metadata methods
and +register\_tools+ to supply tool hashes.

## Signature

```ruby
class SkillBase < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`agent`](/reference/ruby/signal-wire/skills/skill-base/agent) — Python parity: - `params` — params hash passed at construction - `agent` — owning AgentBase instance (or nil for standalone) - `logger` — namespaced logger `signalwire.skills.<name>` - `swaig_fields` — extra SWAIG fields merged into tool defs; pulled out of `params` if provided
- [`cleanup`](/reference/ruby/signal-wire/skills/skill-base/cleanup) — Called when the skill is unloaded.
- [`description`](/reference/ruby/signal-wire/skills/skill-base/description)
- [`get_global_data`](/reference/ruby/signal-wire/skills/skill-base/get-global-data) — Global data to merge into the agent.
- [`get_hints`](/reference/ruby/signal-wire/skills/skill-base/get-hints) — Speech recognition hints.
- [`get_param`](/reference/ruby/signal-wire/skills/skill-base/get-param) — Helper to get a param with env-var fallback.
- [`get_parameter_schema`](/reference/ruby/signal-wire/skills/skill-base/get-parameter-schema) — Parameter schema for GUI / validation.
- [`get_prompt_sections`](/reference/ruby/signal-wire/skills/skill-base/get-prompt-sections) — Prompt sections to add to the agent.
- [`initialize`](/reference/ruby/signal-wire/skills/skill-base/initialize) — Python parity: `SkillBase.__init__(self, agent, params=None)`. First positional arg is the owning AgentBase (or nil for standalone). The second is the params hash. We accept the legacy 1-arg form for backwards compatibility (`DateTimeSkill.new({...})`).
- [`instance_key`](/reference/ruby/signal-wire/skills/skill-base/instance-key) — Unique key for tracking this skill instance.
- [`logger`](/reference/ruby/signal-wire/skills/skill-base/logger) — Python parity: - `params` — params hash passed at construction - `agent` — owning AgentBase instance (or nil for standalone) - `logger` — namespaced logger `signalwire.skills.<name>` - `swaig_fields` — extra SWAIG fields merged into tool defs; pulled out of `params` if provided
- [`name`](/reference/ruby/signal-wire/skills/skill-base/name)
- [`params`](/reference/ruby/signal-wire/skills/skill-base/params) — Python parity: - `params` — params hash passed at construction - `agent` — owning AgentBase instance (or nil for standalone) - `logger` — namespaced logger `signalwire.skills.<name>` - `swaig_fields` — extra SWAIG fields merged into tool defs; pulled out of `params` if provided
- [`register_tools`](/reference/ruby/signal-wire/skills/skill-base/register-tools) — Return an Array of tool definition hashes. Each hash should have: :name, :description, :parameters, :handler (lambda/proc)
- [`required_env_vars`](/reference/ruby/signal-wire/skills/skill-base/required-env-vars)
- [`setup`](/reference/ruby/signal-wire/skills/skill-base/setup) — Called once after construction. Return +true+ if the skill is ready.
- [`supports_multiple_instances?`](/reference/ruby/signal-wire/skills/skill-base/supports-multiple-instances)
- [`swaig_fields`](/reference/ruby/signal-wire/skills/skill-base/swaig-fields) — Python parity: - `params` — params hash passed at construction - `agent` — owning AgentBase instance (or nil for standalone) - `logger` — namespaced logger `signalwire.skills.<name>` - `swaig_fields` — extra SWAIG fields merged into tool defs; pulled out of `params` if provided
- [`version`](/reference/ruby/signal-wire/skills/skill-base/version)

## Source

[`lib/signalwire/skills/skill_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb)

Line 15.
