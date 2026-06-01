---
slug: "/reference/typescript/skills/builtin/custom-skills/create-skill"
title: "createSkill"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "skills.builtin.custom_skills.createSkill"
  parent: "skills.builtin.custom_skills"
  module: "skills.builtin.custom_skills"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/custom_skills.ts"
---
# `createSkill`

Factory function for creating CustomSkillsSkill instances.

## Signature

```typescript
createSkill(config?: SkillConfig): CustomSkillsSkill
```

## Parameters

| Name     | Type          | Required | Default | Description                                                          |
| -------- | ------------- | -------- | ------- | -------------------------------------------------------------------- |
| `config` | `SkillConfig` | no       | —       | Configuration containing a `tools` array of custom tool definitions. |

## Returns

`CustomSkillsSkill` — A new CustomSkillsSkill instance.

## Source

[`src/skills/builtin/custom_skills.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/custom_skills.ts)

Line 325.
