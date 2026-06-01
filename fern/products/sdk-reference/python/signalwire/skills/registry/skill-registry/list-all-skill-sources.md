---
slug: "/reference/python/signalwire/skills/registry/skill-registry/list-all-skill-sources"
title: "list_all_skill_sources"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.registry.SkillRegistry.list_all_skill_sources"
  parent: "signalwire.skills.registry.SkillRegistry"
  module: "signalwire.skills.registry"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/registry.py"
---
# `list_all_skill_sources`

List all skill sources and the skills available from each

Returns a dictionary mapping source types to lists of skill names:
{
'built-in': \['datetime', 'math', ...],
'external\_paths': \['custom\_skill1', ...],
'entry\_points': \['weather', ...],
'registered': \['my\_skill', ...]
}

## Signature

```python
list_all_skill_sources() -> Dict[str, List[str]]
```

## Returns

`Dict[str, List[str]]`

## Source

[`/src/signalwire/signalwire/skills/registry.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/registry.py)

Line 436.
