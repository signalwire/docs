---
slug: "/reference/cpp/signalwire/skills/datasphere-skill"
title: "DatasphereSkill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::DatasphereSkill"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/datasphere.cpp"
  visibility: "public"
---
# `DatasphereSkill`

SignalWire DataSphere RAG search skill — issues a real POST against the DataSphere /api/datasphere/documents/{document\_id}/search endpoint with the user query in the JSON body, parses the results\[] array, and returns a flattened text summary. Matches the Python DatasphereSkill upstream-call shape.
DATASPHERE\_BASE\_URL env var overrides the upstream URL (used by audit\_skills\_dispatch.py); when unset, the real upstream is built from space\_name (https://{space}.signalwire.com).

## Signature

```cpp
class signalwire::skills::DatasphereSkill : signalwire::skills::SkillBase
```

## Inheritance

**Extends:** [signalwire::skills::SkillBase](/reference/cpp/signalwire/skills/skill-base)

## Methods

- [`get_global_data`](/reference/cpp/signalwire/skills/datasphere-skill/get-global-data) — Get global data to merge into agent.
- [`get_prompt_sections`](/reference/cpp/signalwire/skills/datasphere-skill/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/datasphere-skill/register-tools) — Register tools with the agent. Returns tool definitions.
- [`setup`](/reference/cpp/signalwire/skills/datasphere-skill/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/datasphere-skill/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/datasphere-skill/skill-name)
- [`supports_multiple_instances`](/reference/cpp/signalwire/skills/datasphere-skill/supports-multiple-instances)

## Source

[`src/skills/builtin/datasphere.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/datasphere.cpp)

Line 22.
