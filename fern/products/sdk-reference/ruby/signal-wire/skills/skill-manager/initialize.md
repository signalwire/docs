---
slug: "/reference/ruby/signal-wire/skills/skill-manager/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillManager#initialize"
  parent: "SignalWire::Skills::SkillManager"
  module: "SignalWire.Skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb"
  visibility: "public"
---
# `initialize`

Python parity: `SkillManager.__init__(self, agent)` —
SkillManager keeps a back-pointer to its agent so loaded
skills can attach prompt sections / SWAIG tools directly.
Ruby allows nil for standalone use (tests, registry tools).

## Signature

```ruby
def initialize(agent = nil)
```

## Parameters

| Name    | Type | Required | Default | Description |
| ------- | ---- | -------- | ------- | ----------- |
| `agent` | —    | no       | `nil`   | —           |

## Returns

`SkillManager` — a new instance of SkillManager

## Source

[`lib/signalwire/skills/skill_manager.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb)

Line 31.
