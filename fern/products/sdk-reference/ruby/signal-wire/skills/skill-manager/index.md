---
slug: "/reference/ruby/signal-wire/skills/skill-manager"
title: "SkillManager"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillManager"
  parent: "SignalWire::Skills"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb"
  visibility: "public"
---
# `SkillManager`

Thread-safe lifecycle manager for loaded skill instances.

manager = SkillManager.new
manager.load('datetime', DateTimeSkill.new)
manager.get('datetime')  #=> <DateTimeSkill>
manager.unload('datetime')

## Signature

```ruby
class SkillManager < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`agent`](/reference/ruby/signal-wire/skills/skill-manager/agent) — Python parity: - `agent` — owning AgentBase instance (or nil) - `logger` — namespaced logger
- [`clear`](/reference/ruby/signal-wire/skills/skill-manager/clear) — Unload all skills.
- [`get`](/reference/ruby/signal-wire/skills/skill-manager/get) — Retrieve a loaded skill.
- [`initialize`](/reference/ruby/signal-wire/skills/skill-manager/initialize) — Python parity: `SkillManager.__init__(self, agent)` — SkillManager keeps a back-pointer to its agent so loaded skills can attach prompt sections / SWAIG tools directly. Ruby allows nil for standalone use (tests, registry tools).
- [`load`](/reference/ruby/signal-wire/skills/skill-manager/load) — Load a skill instance. Calls +setup+ on the skill; raises if it fails.
- [`loaded_keys`](/reference/ruby/signal-wire/skills/skill-manager/loaded-keys)
- [`loaded?`](/reference/ruby/signal-wire/skills/skill-manager/loaded)
- [`logger`](/reference/ruby/signal-wire/skills/skill-manager/logger) — Python parity: - `agent` — owning AgentBase instance (or nil) - `logger` — namespaced logger
- [`size`](/reference/ruby/signal-wire/skills/skill-manager/size)
- [`unload`](/reference/ruby/signal-wire/skills/skill-manager/unload) — Unload a skill by instance key. Calls +cleanup+ on it.

## Source

[`lib/signalwire/skills/skill_manager.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb)

Line 21.
