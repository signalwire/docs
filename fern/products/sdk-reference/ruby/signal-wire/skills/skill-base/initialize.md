---
slug: "/reference/ruby/signal-wire/skills/skill-base/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillBase#initialize"
  parent: "SignalWire::Skills::SkillBase"
  module: "SignalWire.Skills.SkillBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb"
  visibility: "public"
---
# `initialize`

Python parity: `SkillBase.__init__(self, agent, params=None)`.
First positional arg is the owning AgentBase (or nil for
standalone). The second is the params hash. We accept the legacy
1-arg form for backwards compatibility (`DateTimeSkill.new({...})`).

## Signature

```ruby
def initialize(agent = nil, params = nil)
```

## Parameters

| Name     | Type | Required | Default | Description |
| -------- | ---- | -------- | ------- | ----------- |
| `agent`  | —    | no       | `nil`   | —           |
| `params` | —    | no       | `nil`   | —           |

## Returns

`SkillBase` — a new instance of SkillBase

## Source

[`lib/signalwire/skills/skill_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_base.rb)

Line 34.
