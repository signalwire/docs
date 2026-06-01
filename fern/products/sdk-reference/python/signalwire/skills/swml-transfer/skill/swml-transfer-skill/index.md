---
slug: "/reference/python/signalwire/skills/swml-transfer/skill/swml-transfer-skill"
title: "SWMLTransferSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.swml_transfer.skill.SWMLTransferSkill"
  parent: "signalwire.skills.swml_transfer.skill"
  module: "signalwire.skills.swml_transfer.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/swml_transfer/skill.py"
---
# `SWMLTransferSkill`

Skill for transferring calls between agents using SWML with pattern matching

## Signature

```python
class SWMLTransferSkill(SkillBase)
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

- [`get_hints`](/reference/python/signalwire/skills/swml-transfer/skill/swml-transfer-skill/get-hints) — Return speech recognition hints
- [`get_instance_key`](/reference/python/signalwire/skills/swml-transfer/skill/swml-transfer-skill/get-instance-key) — Get the key used to track this skill instance
- [`get_parameter_schema`](/reference/python/signalwire/skills/swml-transfer/skill/swml-transfer-skill/get-parameter-schema) — Get parameter schema for SWML Transfer skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/swml-transfer/skill/swml-transfer-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/swml-transfer/skill/swml-transfer-skill/register-tools) — Register the transfer tool with pattern matching
- [`setup`](/reference/python/signalwire/skills/swml-transfer/skill/swml-transfer-skill/setup) — Setup and validate skill configuration

## Source

[`/src/signalwire/signalwire/skills/swml_transfer/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/swml_transfer/skill.py)

Line 18.
