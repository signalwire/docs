---
slug: "/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill"
title: "DataSphereSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.datasphere.skill.DataSphereSkill"
  parent: "signalwire.skills.datasphere.skill"
  module: "signalwire.skills.datasphere.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/datasphere/skill.py"
---
# `DataSphereSkill`

SignalWire DataSphere knowledge search capability

## Signature

```python
class DataSphereSkill(SkillBase)
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

- [`cleanup`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/cleanup) — Clean up resources when skill is unloaded.
- [`get_global_data`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/get-global-data) — Return global data for agent context
- [`get_hints`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/get-hints) — Return speech recognition hints
- [`get_instance_key`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/get-instance-key) — Get the key used to track this skill instance
- [`get_parameter_schema`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/get-parameter-schema) — Get parameter schema for DataSphere skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/register-tools) — Register knowledge search tool with the agent
- [`setup`](/reference/python/signalwire/skills/datasphere/skill/data-sphere-skill/setup) — Setup the datasphere skill

## Source

[`/src/signalwire/signalwire/skills/datasphere/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/datasphere/skill.py)

Line 17.
