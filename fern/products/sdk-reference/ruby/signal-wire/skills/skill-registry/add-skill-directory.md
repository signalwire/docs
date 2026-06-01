---
slug: "/reference/ruby/signal-wire/skills/skill-registry/add-skill-directory"
title: "add_skill_directory"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::Skills::SkillRegistry#add_skill_directory"
  parent: "SignalWire::Skills::SkillRegistry"
  module: "SignalWire.Skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb"
  visibility: "public"
---
# `add_skill_directory`

Add a directory to search for skills.

Mirrors Python's `SkillRegistry.add_skill_directory`: validate
that the path exists and is a directory, then append it
(de-duplicated) to `@external_paths`. Raises `ArgumentError`
(the Ruby analog of Python's `ValueError`) for invalid input.

## Signature

```ruby
def add_skill_directory(path)
```

## Parameters

| Name   | Type     | Required | Default | Description                              |
| ------ | -------- | -------- | ------- | ---------------------------------------- |
| `path` | `String` | yes      | —       | absolute or relative path to a directory |

## Returns

`void`

## Throws

- `ArgumentError` — when the path doesn't exist or isn't a directory.

## Source

[`lib/signalwire/skills/skill_registry.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/skills/skill_registry.rb)

Line 52.
