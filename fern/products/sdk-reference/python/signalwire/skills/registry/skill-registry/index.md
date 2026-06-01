---
slug: "/reference/python/signalwire/skills/registry/skill-registry"
title: "SkillRegistry"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.registry.SkillRegistry"
  parent: "signalwire.skills.registry"
  module: "signalwire.skills.registry"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/registry.py"
---
# `SkillRegistry`

Global registry for on-demand skill loading

## Signature

```python
class SkillRegistry
```

## Properties

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `logger` | `logger` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/skills/registry/skill-registry/init)
- [`add_skill_directory`](/reference/python/signalwire/skills/registry/skill-registry/add-skill-directory) — Add a directory to search for skills
- [`discover_skills`](/reference/python/signalwire/skills/registry/skill-registry/discover-skills) — Deprecated: Skills are now loaded on-demand
- [`get_all_skills_schema`](/reference/python/signalwire/skills/registry/skill-registry/get-all-skills-schema) — Get complete schema for all available skills including parameter metadata
- [`get_skill_class`](/reference/python/signalwire/skills/registry/skill-registry/get-skill-class) — Get skill class by name, loading on-demand if needed
- [`list_all_skill_sources`](/reference/python/signalwire/skills/registry/skill-registry/list-all-skill-sources) — List all skill sources and the skills available from each
- [`list_skills`](/reference/python/signalwire/skills/registry/skill-registry/list-skills) — List all available skills by scanning directories (only when explicitly requested)
- [`register_skill`](/reference/python/signalwire/skills/registry/skill-registry/register-skill) — Register a skill class directly

## Source

[`/src/signalwire/signalwire/skills/registry.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/registry.py)

Line 22.
