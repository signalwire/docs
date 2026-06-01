---
slug: "/reference/cpp/signalwire/skills/skill-registry/register-skill"
title: "register_skill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::skills::SkillRegistry::register_skill"
  parent: "signalwire::skills::SkillRegistry"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_registry.hpp"
  visibility: "public"
---
# `register_skill`

Register a skill factory.

**Modifiers:** `inline`

## Signature

```cpp
void register_skill(const std::string & name, SkillFactory factory)
```

## Parameters

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `name`    | `const std::string &` | yes      | —       | —           |
| `factory` | `SkillFactory`        | yes      | —       | —           |

## Source

[`include/signalwire/skills/skill_registry.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_registry.hpp)

Line 26.
