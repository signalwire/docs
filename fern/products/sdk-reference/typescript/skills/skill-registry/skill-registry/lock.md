---
slug: "/reference/typescript/skills/skill-registry/skill-registry/lock"
title: "lock"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillRegistry.SkillRegistry.lock"
  parent: "skills.SkillRegistry.SkillRegistry"
  module: "skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts"
---
# `lock`

Lock one or more skill names to prevent overwriting.
If called with no arguments, locks all currently registered skills.

## Signature

```typescript
lock(names?: string[]): void
```

## Parameters

| Name    | Type       | Required | Default | Description                                                    |
| ------- | ---------- | -------- | ------- | -------------------------------------------------------------- |
| `names` | `string[]` | no       | —       | Skill names to lock; if omitted, all current names are locked. |

## Returns

`void`

## Source

[`src/skills/SkillRegistry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts)

Line 138.
