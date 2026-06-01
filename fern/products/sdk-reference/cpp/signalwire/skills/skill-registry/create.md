---
slug: "/reference/cpp/signalwire/skills/skill-registry/create"
title: "create"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::skills::SkillRegistry::create"
  parent: "signalwire::skills::SkillRegistry"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_registry.hpp"
  visibility: "public"
---
# `create`

Create a skill instance by name.

**Modifiers:** `const` `inline`

## Signature

```cpp
std::unique_ptr< SkillBase > create(const std::string & name) const
```

## Parameters

| Name   | Type                  | Required | Default | Description |
| ------ | --------------------- | -------- | ------- | ----------- |
| `name` | `const std::string &` | yes      | —       | —           |

## Returns

`std::unique_ptr< SkillBase >`

## Source

[`include/signalwire/skills/skill_registry.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_registry.hpp)

Line 32.
