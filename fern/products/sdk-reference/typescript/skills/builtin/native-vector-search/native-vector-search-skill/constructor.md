---
slug: "/reference/typescript/skills/builtin/native-vector-search/native-vector-search-skill/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.native_vector_search.NativeVectorSearchSkill.constructor"
  parent: "skills.builtin.native_vector_search.NativeVectorSearchSkill"
  module: "skills.builtin.native_vector_search"
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
constructor(config?: SkillConfig): NativeVectorSearchSkill
```

## Parameters

| Name     | Type          | Required | Default | Description                                                |
| -------- | ------------- | -------- | ------- | ---------------------------------------------------------- |
| `config` | `SkillConfig` | no       | —       | Optional configuration key-value pairs (Python: `params`). |

## Returns

`NativeVectorSearchSkill`

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 282.
