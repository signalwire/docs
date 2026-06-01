---
slug: "/reference/cpp/signalwire/skills/joke-skill"
title: "JokeSkill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::JokeSkill"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/joke.cpp"
  visibility: "public"
---
# `JokeSkill`

## Signature

```cpp
class signalwire::skills::JokeSkill : signalwire::skills::SkillBase
```

## Inheritance

**Extends:** [signalwire::skills::SkillBase](/reference/cpp/signalwire/skills/skill-base)

## Methods

- [`get_datamap_functions`](/reference/cpp/signalwire/skills/joke-skill/get-datamap-functions) — Get SWAIG DataMap functions (for DataMap-based skills).
- [`get_global_data`](/reference/cpp/signalwire/skills/joke-skill/get-global-data) — Get global data to merge into agent.
- [`get_prompt_sections`](/reference/cpp/signalwire/skills/joke-skill/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/joke-skill/register-tools) — Register tools with the agent. Returns tool definitions.
- [`setup`](/reference/cpp/signalwire/skills/joke-skill/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/joke-skill/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/joke-skill/skill-name)

## Source

[`src/skills/builtin/joke.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/joke.cpp)

Line 10.
