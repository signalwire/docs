---
slug: "/reference/typescript/skills/builtin/math/math-skill/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.math.MathSkill.constructor"
  parent: "skills.builtin.math.MathSkill"
  module: "skills.builtin.math"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `constructor`

Create a new skill instance.

Python parity: `core/skill_base.py:32-43`.
Python `__init__` raises `ValueError` if `SKILL_NAME` or `SKILL_DESCRIPTION`
is left as `None` on the subclass. TS throws the equivalent when the static
defaults haven't been overridden.

## Signature

```typescript
constructor(config?: SkillConfig): MathSkill
```

## Parameters

| Name     | Type          | Required | Default | Description                                                |
| -------- | ------------- | -------- | ------- | ---------------------------------------------------------- |
| `config` | `SkillConfig` | no       | —       | Optional configuration key-value pairs (Python: `params`). |

## Returns

`MathSkill`

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 282.
