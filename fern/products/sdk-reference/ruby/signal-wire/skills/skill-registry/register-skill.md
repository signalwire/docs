---
slug: "/reference/ruby/signal-wire/skills/skill-registry/register-skill"
title: "register_skill"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillRegistry#register_skill"
  parent: "SignalWire::Skills::SkillRegistry"
  module: "SignalWire.Skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb"
  visibility: "public"
---
# `register_skill`

Register a skill class or factory (instance form).

Python parity: `SkillRegistry.register_skill(self, skill_class)`
accepts a SkillBase subclass and stores its factory. Ruby
accepts either a class with a `new(params)` constructor, a
`Proc` /`Lambda`, or a 2-arg `(name, factory)` form for
explicit naming. Returns `self` for chaining.

## Signature

```ruby
def register_skill(skill_class_or_name, factory = nil)
```

## Parameters

| Name                  | Type              | Required | Default | Description                                                                            |
| --------------------- | ----------------- | -------- | ------- | -------------------------------------------------------------------------------------- |
| `skill_class_or_name` | `Class \| String` | yes      | —       | either a SkillBase subclass (Python style) or a string skill name (legacy 2-arg form). |
| `factory`             | `Proc \| nil`     | no       | `nil`   | explicit factory when first arg is a string (legacy form).                             |

## Throws

- `ArgumentError`

## Source

[`lib/signalwire/skills/skill_registry.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb)

Line 104.
