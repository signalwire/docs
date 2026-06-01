---
slug: "/reference/typescript/skills/builtin/api-ninjas-trivia/api-ninjas-trivia-skill/get-instance-key"
title: "getInstanceKey"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.api_ninjas_trivia.ApiNinjasTriviaSkill.getInstanceKey"
  parent: "skills.builtin.api_ninjas_trivia.ApiNinjasTriviaSkill"
  module: "skills.builtin.api_ninjas_trivia"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/api_ninjas_trivia.ts"
---
# `getInstanceKey`

Produce a compound instance key matching Python `get_instance_key`
(skill.py:139-146): `f"{SKILL_NAME}_{self.tool_name}"` with
`tool_name` defaulting to `'get_trivia'` (skill.py:95). The base
`SkillBase.getInstanceKey` uses `this.skillName` as the fallback,
so we override to match Python's `'get_trivia'` default.

## Signature

```typescript
getInstanceKey(): string
```

## Returns

`string`

## Source

[`src/skills/builtin/api_ninjas_trivia.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/api_ninjas_trivia.ts)

Line 114.
