---
slug: "/reference/ruby/signal-wire/skills/skill-base/params"
title: "params"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillBase#params"
  parent: "SignalWire::Skills::SkillBase"
  module: "SignalWire.Skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb"
  visibility: "public"
---
# `params`

Python parity:

- `params` — params hash passed at construction
- `agent` — owning AgentBase instance (or nil for standalone)
- `logger` — namespaced logger `signalwire.skills.<name>`
- `swaig_fields` — extra SWAIG fields merged into tool defs;
  pulled out of `params` if provided

## Signature

```ruby
attr_reader params -> Object
```

## Source

[`lib/signalwire/skills/skill_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb)

Line 22.
