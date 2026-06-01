---
slug: "/reference/python/signalwire/skills/datetime/skill/date-time-skill"
title: "DateTimeSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.datetime.skill.DateTimeSkill"
  parent: "signalwire.skills.datetime.skill"
  module: "signalwire.skills.datetime.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/datetime/skill.py"
---
# `DateTimeSkill`

Provides current date, time, and timezone information

## Signature

```python
class DateTimeSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `REQUIRED_ENV_VARS` | `REQUIRED_ENV_VARS` | yes      | —       | —           |
| `REQUIRED_PACKAGES` | `REQUIRED_PACKAGES` | yes      | —       | —           |
| `SKILL_DESCRIPTION` | `SKILL_DESCRIPTION` | yes      | —       | —           |
| `SKILL_NAME`        | `SKILL_NAME`        | yes      | —       | —           |
| `SKILL_VERSION`     | `SKILL_VERSION`     | yes      | —       | —           |

## Methods

- [`get_hints`](/reference/python/signalwire/skills/datetime/skill/date-time-skill/get-hints) — Return speech recognition hints
- [`get_parameter_schema`](/reference/python/signalwire/skills/datetime/skill/date-time-skill/get-parameter-schema) — Get the parameter schema for the datetime skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/datetime/skill/date-time-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/datetime/skill/date-time-skill/register-tools) — Register datetime tools with the agent
- [`setup`](/reference/python/signalwire/skills/datetime/skill/date-time-skill/setup) — Setup the datetime skill

## Source

[`/src/signalwire/signalwire/skills/datetime/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/datetime/skill.py)

Line 17.
