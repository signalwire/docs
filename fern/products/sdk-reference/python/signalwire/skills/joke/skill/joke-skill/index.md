---
slug: "/reference/python/signalwire/skills/joke/skill/joke-skill"
title: "JokeSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.joke.skill.JokeSkill"
  parent: "signalwire.skills.joke.skill"
  module: "signalwire.skills.joke.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/joke/skill.py"
---
# `JokeSkill`

Joke telling capability using API Ninjas with DataMap

## Signature

```python
class JokeSkill(SkillBase)
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

- [`get_global_data`](/reference/python/signalwire/skills/joke/skill/joke-skill/get-global-data) — Return global data to be available in DataMap variables
- [`get_hints`](/reference/python/signalwire/skills/joke/skill/joke-skill/get-hints) — Return speech recognition hints
- [`get_parameter_schema`](/reference/python/signalwire/skills/joke/skill/joke-skill/get-parameter-schema) — Get parameter schema for joke skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/joke/skill/joke-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/joke/skill/joke-skill/register-tools) — Register joke tool using DataMap
- [`setup`](/reference/python/signalwire/skills/joke/skill/joke-skill/setup) — Setup the joke skill

## Source

[`/src/signalwire/signalwire/skills/joke/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/joke/skill.py)

Line 17.
