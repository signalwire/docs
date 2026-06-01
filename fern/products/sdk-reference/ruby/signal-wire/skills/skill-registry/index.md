---
slug: "/reference/ruby/signal-wire/skills/skill-registry"
title: "SkillRegistry"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillRegistry"
  parent: "SignalWire::Skills"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb"
  visibility: "public"
---
# `SkillRegistry`

Global registry mapping skill names to factory lambdas.

SkillRegistry.register('datetime') { |params| DateTimeSkill.new(params) }
factory = SkillRegistry.get\_factory('datetime')
skill   = factory.call({ 'timezone' => 'UTC' })

## Signature

```ruby
class SkillRegistry < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`add_skill_directory`](/reference/ruby/signal-wire/skills/skill-registry/add-skill-directory) — Add a directory to search for skills.
- [`external_paths`](/reference/ruby/signal-wire/skills/skill-registry/external-paths) — External skill directories registered via #add\_skill\_directory. Mirrors Python's `_external_paths` accessor surface.
- [`get_all_skills_schema`](/reference/ruby/signal-wire/skills/skill-registry/get-all-skills-schema) — Get complete schema for all registered skills (instance form).
- [`get_all_skills_schema`](/reference/ruby/signal-wire/skills/skill-registry/get-all-skills-schema__2) — Get complete schema for all registered skills.
- [`get_factory`](/reference/ruby/signal-wire/skills/skill-registry/get-factory) — Get the factory for a skill.
- [`initialize`](/reference/ruby/signal-wire/skills/skill-registry/initialize) — Per-instance state for the skill-directory parity surface; the class-method API above is preserved for backwards compatibility, but `add_skill_directory` mirrors Python's instance-method shape exactly (Python's `signalwire.skills.registry.SkillRegistry`).
- [`last_registered`](/reference/ruby/signal-wire/skills/skill-registry/last-registered) — The most recently registered skill name (instance form).
- [`list_skills`](/reference/ruby/signal-wire/skills/skill-registry/list-skills) — List all registered skill names (instance form).
- [`list_skills`](/reference/ruby/signal-wire/skills/skill-registry/list-skills__2) — List all registered skill names.
- [`logger`](/reference/ruby/signal-wire/skills/skill-registry/logger) — Python parity: `self.logger = get_logger("skill_registry")`. Per-instance logger; the class-level API uses the same name.
- [`register`](/reference/ruby/signal-wire/skills/skill-registry/register) — Register a skill factory.
- [`register_builtins!`](/reference/ruby/signal-wire/skills/skill-registry/register-builtins) — Register all built-in skills. Called at load time.
- [`register_skill`](/reference/ruby/signal-wire/skills/skill-registry/register-skill) — Register a skill class or factory (instance form).
- [`register_skill`](/reference/ruby/signal-wire/skills/skill-registry/register-skill__2) — Register with an explicit lambda / proc instead of a block.
- [`registered?`](/reference/ruby/signal-wire/skills/skill-registry/registered) — Check if a skill is registered.
- [`reset!`](/reference/ruby/signal-wire/skills/skill-registry/reset) — Clear all registrations (primarily for testing).

## Source

[`lib/signalwire/skills/skill_registry.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb)

Line 19.
