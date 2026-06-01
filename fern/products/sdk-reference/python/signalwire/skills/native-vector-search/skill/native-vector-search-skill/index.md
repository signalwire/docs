---
slug: "/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill"
title: "NativeVectorSearchSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.native_vector_search.skill.NativeVectorSearchSkill"
  parent: "signalwire.skills.native_vector_search.skill"
  module: "signalwire.skills.native_vector_search.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/native_vector_search/skill.py"
---
# `NativeVectorSearchSkill`

Native vector search capability using local document indexes or remote search servers

## Signature

```python
class NativeVectorSearchSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                          | Type                          | Required | Default | Description |
| ----------------------------- | ----------------------------- | -------- | ------- | ----------- |
| `REQUIRED_ENV_VARS`           | `REQUIRED_ENV_VARS`           | yes      | —       | —           |
| `REQUIRED_PACKAGES`           | `REQUIRED_PACKAGES`           | yes      | —       | —           |
| `SKILL_DESCRIPTION`           | `SKILL_DESCRIPTION`           | yes      | —       | —           |
| `SKILL_NAME`                  | `SKILL_NAME`                  | yes      | —       | —           |
| `SKILL_VERSION`               | `SKILL_VERSION`               | yes      | —       | —           |
| `SUPPORTS_MULTIPLE_INSTANCES` | `SUPPORTS_MULTIPLE_INSTANCES` | yes      | —       | —           |

## Methods

- [`cleanup`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/cleanup) — Cleanup when skill is removed or agent shuts down
- [`get_global_data`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/get-global-data) — Return data to add to agent's global context
- [`get_hints`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/get-hints) — Return speech recognition hints for this skill
- [`get_instance_key`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/get-instance-key) — Get the key used to track this skill instance
- [`get_parameter_schema`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/get-parameter-schema) — Get parameter schema for Native Vector Search skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/register-tools) — Register native vector search tool with the agent
- [`setup`](/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/setup) — Setup the native vector search skill

## Source

[`/src/signalwire/signalwire/skills/native_vector_search/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/native_vector_search/skill.py)

Line 19.
