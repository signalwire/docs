---
slug: "/reference/cpp/signalwire/skills/skill-base"
title: "SkillBase"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::SkillBase"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp"
  visibility: "public"
---
# `SkillBase`

Abstract base class for all skills.

## Signature

```cpp
class signalwire::skills::SkillBase
```

## Methods

- [`~SkillBase`](/reference/cpp/signalwire/skills/skill-base/skill-base)
- [`cleanup`](/reference/cpp/signalwire/skills/skill-base/cleanup) — Cleanup resources.
- [`define_tool`](/reference/cpp/signalwire/skills/skill-base/define-tool) — Define a tool (convenience for register\_tools implementations).
- [`get_datamap_functions`](/reference/cpp/signalwire/skills/skill-base/get-datamap-functions) — Get SWAIG DataMap functions (for DataMap-based skills).
- [`get_global_data`](/reference/cpp/signalwire/skills/skill-base/get-global-data) — Get global data to merge into agent.
- [`get_hints`](/reference/cpp/signalwire/skills/skill-base/get-hints) — Get speech recognition hints to merge into agent.
- [`get_instance_key`](/reference/cpp/signalwire/skills/skill-base/get-instance-key) — Get instance key for multi-instance skills.
- [`get_param`](/reference/cpp/signalwire/skills/skill-base/get-param) — Get a parameter value with a default.
- [`get_param_or_env`](/reference/cpp/signalwire/skills/skill-base/get-param-or-env) — Get a string parameter with env var fallback.
- [`get_parameter_schema`](/reference/cpp/signalwire/skills/skill-base/get-parameter-schema) — Get parameter schema for GUI tools.
- [`get_prompt_sections`](/reference/cpp/signalwire/skills/skill-base/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/skill-base/register-tools) — Register tools with the agent. Returns tool definitions.
- [`required_env_vars`](/reference/cpp/signalwire/skills/skill-base/required-env-vars)
- [`required_packages`](/reference/cpp/signalwire/skills/skill-base/required-packages)
- [`setup`](/reference/cpp/signalwire/skills/skill-base/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/skill-base/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/skill-base/skill-name)
- [`skill_version`](/reference/cpp/signalwire/skills/skill-base/skill-version)
- [`supports_multiple_instances`](/reference/cpp/signalwire/skills/skill-base/supports-multiple-instances)

## Source

[`include/signalwire/skills/skill_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp)

Line 26.
