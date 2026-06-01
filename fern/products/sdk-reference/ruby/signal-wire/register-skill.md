---
slug: "/reference/ruby/signal-wire/register-skill"
title: "register_skill"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire.register_skill"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire.rb"
  visibility: "public"
---
# `register_skill`

Register a custom skill class with the global skill registry.

Mirrors Python's `signalwire.register_skill(skill_class)` — the
Ruby singleton registry stores factories by name. The class is
expected to expose a `::skill_name` (or `SKILL_NAME` constant)
so we can derive the registration key.

## Signature

```ruby
def register_skill(skill_class)
```

## Parameters

| Name          | Type    | Required | Default | Description                                   |
| ------------- | ------- | -------- | ------- | --------------------------------------------- |
| `skill_class` | `Class` | yes      | —       | A subclass of {SignalWire::Skills::SkillBase} |

## Returns

`void`

## Source

[`lib/signalwire.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire.rb)

Line 60.
