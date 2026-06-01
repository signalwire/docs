---
slug: "/reference/python/signalwire/skills/math/skill/math-skill"
title: "MathSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.math.skill.MathSkill"
  parent: "signalwire.skills.math.skill"
  module: "signalwire.skills.math.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/math/skill.py"
---
# `MathSkill`

Provides basic mathematical calculation capabilities

## Signature

```python
class MathSkill(SkillBase)
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

- [`get_hints`](/reference/python/signalwire/skills/math/skill/math-skill/get-hints) — Return speech recognition hints
- [`get_parameter_schema`](/reference/python/signalwire/skills/math/skill/math-skill/get-parameter-schema) — Get the parameter schema for the math skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/math/skill/math-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/math/skill/math-skill/register-tools) — Register math tools with the agent
- [`setup`](/reference/python/signalwire/skills/math/skill/math-skill/setup) — Setup the math skill

## Source

[`/src/signalwire/signalwire/skills/math/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/math/skill.py)

Line 17.
