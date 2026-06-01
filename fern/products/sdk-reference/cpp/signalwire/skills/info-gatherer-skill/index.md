---
slug: "/reference/cpp/signalwire/skills/info-gatherer-skill"
title: "InfoGathererSkill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::InfoGathererSkill"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/info_gatherer.cpp"
  visibility: "public"
---
# `InfoGathererSkill`

## Signature

```cpp
class signalwire::skills::InfoGathererSkill : signalwire::skills::SkillBase
```

## Inheritance

**Extends:** [signalwire::skills::SkillBase](/reference/cpp/signalwire/skills/skill-base)

## Methods

- [`get_global_data`](/reference/cpp/signalwire/skills/info-gatherer-skill/get-global-data) — Get global data to merge into agent.
- [`get_instance_key`](/reference/cpp/signalwire/skills/info-gatherer-skill/get-instance-key) — Get instance key for multi-instance skills.
- [`get_prompt_sections`](/reference/cpp/signalwire/skills/info-gatherer-skill/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/info-gatherer-skill/register-tools) — Register tools with the agent. Returns tool definitions.
- [`setup`](/reference/cpp/signalwire/skills/info-gatherer-skill/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/info-gatherer-skill/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/info-gatherer-skill/skill-name)
- [`supports_multiple_instances`](/reference/cpp/signalwire/skills/info-gatherer-skill/supports-multiple-instances)

## Source

[`src/skills/builtin/info_gatherer.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/info_gatherer.cpp)

Line 9.
