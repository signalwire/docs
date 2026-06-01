---
slug: "/reference/python/signalwire/core/skill-base/skill-base/get-instance-key"
title: "get_instance_key"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.skill_base.SkillBase.get_instance_key"
  parent: "signalwire.core.skill_base.SkillBase"
  module: "signalwire.core.skill_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_base.py"
---
# `get_instance_key`

Get the key used to track this skill instance

For skills that support multiple instances (SUPPORTS\_MULTIPLE\_INSTANCES = True),
this method can be overridden to provide a unique key for each instance.

Default implementation:

- If SUPPORTS\_MULTIPLE\_INSTANCES is False: returns SKILL\_NAME
- If SUPPORTS\_MULTIPLE\_INSTANCES is True: returns SKILL\_NAME + "\_" + tool\_name
  (where tool\_name comes from params\['tool\_name'] or defaults to the skill name)

## Signature

```python
get_instance_key() -> str
```

## Returns

`str` — Unique key for this skill instance

## Source

[`/src/signalwire/signalwire/core/skill_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_base.py)

Line 126.
