---
slug: "/reference/cpp/signalwire/skills/math-skill"
title: "MathSkill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::MathSkill"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/math.cpp"
  visibility: "public"
---
# `MathSkill`

## Signature

```cpp
class signalwire::skills::MathSkill : signalwire::skills::SkillBase
```

## Inheritance

**Extends:** [signalwire::skills::SkillBase](/reference/cpp/signalwire/skills/skill-base)

## Methods

- [`get_prompt_sections`](/reference/cpp/signalwire/skills/math-skill/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/math-skill/register-tools) — Register tools with the agent. Returns tool definitions.
- [`setup`](/reference/cpp/signalwire/skills/math-skill/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/math-skill/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/math-skill/skill-name)
- [`supports_multiple_instances`](/reference/cpp/signalwire/skills/math-skill/supports-multiple-instances)

## Source

[`src/skills/builtin/math.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/math.cpp)

Line 100.
