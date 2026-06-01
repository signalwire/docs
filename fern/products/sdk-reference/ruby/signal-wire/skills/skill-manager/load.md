---
slug: "/reference/ruby/signal-wire/skills/skill-manager/load"
title: "load"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillManager#load"
  parent: "SignalWire::Skills::SkillManager"
  module: "SignalWire.Skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb"
  visibility: "public"
---
# `load`

Load a skill instance. Calls +setup+ on the skill; raises if it fails.

## Signature

```ruby
def load(key, skill)
```

## Parameters

| Name    | Type        | Required | Default | Description        |
| ------- | ----------- | -------- | ------- | ------------------ |
| `key`   | `String`    | yes      | —       | the instance key   |
| `skill` | `SkillBase` | yes      | —       | the skill instance |

## Returns

`SkillBase` — the loaded skill

## Source

[`lib/signalwire/skills/skill_manager.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb)

Line 42.
