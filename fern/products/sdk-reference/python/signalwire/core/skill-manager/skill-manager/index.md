---
slug: "/reference/python/signalwire/core/skill-manager/skill-manager"
title: "SkillManager"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.skill_manager.SkillManager"
  parent: "signalwire.core.skill_manager"
  module: "signalwire.core.skill_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_manager.py"
---
# `SkillManager`

Manages loading and lifecycle of agent skills

## Signature

```python
class SkillManager
```

## Properties

| Name            | Type                   | Required | Default | Description |
| --------------- | ---------------------- | -------- | ------- | ----------- |
| `agent`         | `agent`                | yes      | —       | —           |
| `loaded_skills` | `Dict[str, SkillBase]` | yes      | —       | —           |
| `logger`        | `logger`               | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/skill-manager/skill-manager/init)
- [`get_skill`](/reference/python/signalwire/core/skill-manager/skill-manager/get-skill) — Get a loaded skill instance by identifier
- [`has_skill`](/reference/python/signalwire/core/skill-manager/skill-manager/has-skill) — Check if skill is currently loaded
- [`list_loaded_skills`](/reference/python/signalwire/core/skill-manager/skill-manager/list-loaded-skills) — List instance keys of currently loaded skills
- [`load_skill`](/reference/python/signalwire/core/skill-manager/skill-manager/load-skill) — Load and setup a skill by name
- [`unload_skill`](/reference/python/signalwire/core/skill-manager/skill-manager/unload-skill) — Unload a skill and cleanup

## Source

[`/src/signalwire/signalwire/core/skill_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_manager.py)

Line 14.
