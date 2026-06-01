---
slug: "/reference/python/signalwire/core/skill-manager/skill-manager/has-skill"
title: "has_skill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.skill_manager.SkillManager.has_skill"
  parent: "signalwire.core.skill_manager.SkillManager"
  module: "signalwire.core.skill_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_manager.py"
---
# `has_skill`

Check if skill is currently loaded

## Signature

```python
has_skill(skill_identifier: str) -> bool
```

## Parameters

| Name               | Type  | Required | Default | Description                            |
| ------------------ | ----- | -------- | ------- | -------------------------------------- |
| `skill_identifier` | `str` | yes      | —       | Either a skill name or an instance key |

## Returns

`bool` — True if loaded, False otherwise

## Source

[`/src/signalwire/signalwire/core/skill_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_manager.py)

Line 212.
