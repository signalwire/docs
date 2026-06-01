---
slug: "/reference/python/signalwire/skills/google-maps/skill/google-maps-skill"
title: "GoogleMapsSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.google_maps.skill.GoogleMapsSkill"
  parent: "signalwire.skills.google_maps.skill"
  module: "signalwire.skills.google_maps.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/google_maps/skill.py"
---
# `GoogleMapsSkill`

Validate addresses and compute driving routes using Google Maps

## Signature

```python
class GoogleMapsSkill(SkillBase)
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

- [`get_hints`](/reference/python/signalwire/skills/google-maps/skill/google-maps-skill/get-hints) — Return speech recognition hints
- [`get_parameter_schema`](/reference/python/signalwire/skills/google-maps/skill/google-maps-skill/get-parameter-schema) — Get parameter schema for google\_maps skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/google-maps/skill/google-maps-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/google-maps/skill/google-maps-skill/register-tools) — Register address lookup and route computation tools
- [`setup`](/reference/python/signalwire/skills/google-maps/skill/google-maps-skill/setup) — Setup the Google Maps skill

## Source

[`/src/signalwire/signalwire/skills/google_maps/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/google_maps/skill.py)

Line 378.
