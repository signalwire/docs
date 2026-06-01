---
slug: "/reference/typescript/skills/skill-manager/skill-manager/add-skill"
title: "addSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillManager.SkillManager.addSkill"
  parent: "skills.SkillManager.SkillManager"
  module: "skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts"
---
# `addSkill`

Add a skill to the manager, validating env vars and calling setup().
Uses the skill's instance key for deduplication.

[loadSkill](/reference/typescript/skills/skill-manager/skill-manager/load-skill) / [loadSkillByName](/reference/typescript/skills/skill-manager/skill-manager/load-skill-by-name) wrap this and catch to return
`[false, msg]`, matching Python `load_skill`'s return contract
(`skill_manager.py` lines 114-118).

## Signature

```typescript
addSkill(skill: SkillBase): Promise<void>
```

## Parameters

| Name    | Type        | Required | Default | Description                |
| ------- | ----------- | -------- | ------- | -------------------------- |
| `skill` | `SkillBase` | yes      | —       | The skill instance to add. |

## Returns

`Promise<void>` — Resolves once the skill is registered.

## Throws

- When a single-instance skill is already loaded, its required environment variables are missing, its parameter schema is empty, its required packages cannot be imported, or `setup()` returns `false`.

## Source

[`src/skills/SkillManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts)

Line 74.
