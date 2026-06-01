---
slug: "/reference/python/signalwire/core/skill-base/skill-base/update-skill-data"
title: "update_skill_data"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.skill_base.SkillBase.update_skill_data"
  parent: "signalwire.core.skill_base.SkillBase"
  module: "signalwire.core.skill_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_base.py"
---
# `update_skill_data`

Write this skill instance's namespaced data into a FunctionResult.

Wraps the data under the skill's namespace key and calls
result.update\_global\_data().

## Signature

```python
update_skill_data(
    result: FunctionResult,
    data: Dict[str, Any]
) -> FunctionResult
```

## Parameters

| Name     | Type             | Required | Default | Description                                           |
| -------- | ---------------- | -------- | ------- | ----------------------------------------------------- |
| `result` | `FunctionResult` | yes      | —       | The FunctionResult to add the global\_data update to. |
| `data`   | `Dict[str, Any]` | yes      | —       | The skill state dict to store under the namespace.    |

## Returns

`FunctionResult` — The result, for method chaining.

## Source

[`/src/signalwire/signalwire/core/skill_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_base.py)

Line 179.
