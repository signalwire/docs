---
slug: "/reference/ruby/signal-wire/skills/skill-registry/register-skill__2"
title: "register_skill"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillRegistry.register_skill"
  parent: "SignalWire::Skills::SkillRegistry"
  module: "SignalWire.Skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb"
  visibility: "public"
---
# `register_skill`

Register with an explicit lambda / proc instead of a block.

## Signature

```ruby
def register_skill(skill_name, factory)
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `skill_name` | `String` | yes      | —       | —           |
| `factory`    | `Proc`   | yes      | —       | —           |

## Source

[`lib/signalwire/skills/skill_registry.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb)

Line 156.
