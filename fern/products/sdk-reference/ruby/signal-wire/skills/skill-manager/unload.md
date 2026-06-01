---
slug: "/reference/ruby/signal-wire/skills/skill-manager/unload"
title: "unload"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillManager#unload"
  parent: "SignalWire::Skills::SkillManager"
  module: "SignalWire.Skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb"
  visibility: "public"
---
# `unload`

Unload a skill by instance key. Calls +cleanup+ on it.

## Signature

```ruby
def unload(key)
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `String` | yes      | —       | —           |

## Returns

`SkillBase | nil` — the removed skill, or nil

## Source

[`lib/signalwire/skills/skill_manager.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_manager.rb)

Line 58.
