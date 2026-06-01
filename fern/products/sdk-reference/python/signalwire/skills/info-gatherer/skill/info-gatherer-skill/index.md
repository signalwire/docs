---
slug: "/reference/python/signalwire/skills/info-gatherer/skill/info-gatherer-skill"
title: "InfoGathererSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.info_gatherer.skill.InfoGathererSkill"
  parent: "signalwire.skills.info_gatherer.skill"
  module: "signalwire.skills.info_gatherer.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/info_gatherer/skill.py"
---
# `InfoGathererSkill`

Skill that guides an AI agent through a series of questions, collecting
and storing answers in namespaced global\_data.

Supports multiple instances with different prefixes so several
question sets can coexist on a single agent (e.g. "intake" and
"medical" questionnaires running side by side).

## Signature

```python
class InfoGathererSkill(SkillBase)
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

- [`get_global_data`](/reference/python/signalwire/skills/info-gatherer/skill/info-gatherer-skill/get-global-data)
- [`get_instance_key`](/reference/python/signalwire/skills/info-gatherer/skill/info-gatherer-skill/get-instance-key)
- [`get_parameter_schema`](/reference/python/signalwire/skills/info-gatherer/skill/info-gatherer-skill/get-parameter-schema)
- [`register_tools`](/reference/python/signalwire/skills/info-gatherer/skill/info-gatherer-skill/register-tools)
- [`setup`](/reference/python/signalwire/skills/info-gatherer/skill/info-gatherer-skill/setup)

## Source

[`/src/signalwire/signalwire/skills/info_gatherer/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/info_gatherer/skill.py)

Line 16.
