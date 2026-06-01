---
slug: "/reference/ruby/signal-wire/skills"
title: "Skills"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::Skills"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb"
  visibility: "public"
---
# `Skills`

## Signature

```ruby
module Skills
```

## Classes

- [`SkillBase`](/reference/ruby/signal-wire/skills/skill-base) — Base class for all skills. Subclasses override the metadata methods and +register\_tools+ to supply tool hashes.
- [`SkillManager`](/reference/ruby/signal-wire/skills/skill-manager) — Thread-safe lifecycle manager for loaded skill instances.
- [`SkillRegistry`](/reference/ruby/signal-wire/skills/skill-registry) — Global registry mapping skill names to factory lambdas.

## Modules

- [`Builtin`](/reference/ruby/signal-wire/skills/builtin)

## Source

[`lib/signalwire/skills/skill_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb)

Line 12.
