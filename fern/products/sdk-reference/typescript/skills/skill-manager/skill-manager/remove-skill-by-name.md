---
slug: "/reference/typescript/skills/skill-manager/skill-manager/remove-skill-by-name"
title: "removeSkillByName"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillManager.SkillManager.removeSkillByName"
  parent: "skills.SkillManager.SkillManager"
  module: "skills.SkillManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts"
---
# `removeSkillByName`

Remove all skill instances matching a given skill name.

## Signature

```typescript
removeSkillByName(skillName: string): Promise<number>
```

## Parameters

| Name        | Type     | Required | Default | Description                      |
| ----------- | -------- | -------- | ------- | -------------------------------- |
| `skillName` | `string` | yes      | —       | The skill name to match against. |

## Returns

`Promise<number>` — The number of skill instances removed.

## Source

[`src/skills/SkillManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillManager.ts)

Line 178.
