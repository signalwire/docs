---
slug: "/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill"
title: "DataSphereServerlessSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.datasphere_serverless.skill.DataSphereServerlessSkill"
  parent: "signalwire.skills.datasphere_serverless.skill"
  module: "signalwire.skills.datasphere_serverless.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/datasphere_serverless/skill.py"
---
# `DataSphereServerlessSkill`

SignalWire DataSphere knowledge search using DataMap (serverless execution)

## Signature

```python
class DataSphereServerlessSkill(SkillBase)
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

- [`get_global_data`](/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill/get-global-data) — Return global data for agent context
- [`get_hints`](/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill/get-hints) — Return speech recognition hints
- [`get_instance_key`](/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill/get-instance-key) — Get the key used to track this skill instance
- [`get_parameter_schema`](/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill/get-parameter-schema) — Get parameter schema for DataSphere Serverless skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill/register-tools) — Register knowledge search tool using DataMap
- [`setup`](/reference/python/signalwire/skills/datasphere-serverless/skill/data-sphere-serverless-skill/setup) — Setup the datasphere serverless skill

## Source

[`/src/signalwire/signalwire/skills/datasphere_serverless/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/datasphere_serverless/skill.py)

Line 17.
