---
slug: "/reference/typescript/skills/skill-registry/skill-registry/unregister"
title: "unregister"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillRegistry.SkillRegistry.unregister"
  parent: "skills.SkillRegistry.SkillRegistry"
  module: "skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts"
---
# `unregister`

Unregister a skill by name, removing it from the registry.

## Signature

```typescript
unregister(name: string): boolean
```

## Parameters

| Name   | Type     | Required | Default | Description                   |
| ------ | -------- | -------- | ------- | ----------------------------- |
| `name` | `string` | yes      | —       | The skill name to unregister. |

## Returns

`boolean` — True if the skill was found and removed.

## Source

[`src/skills/SkillRegistry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts)

Line 150.
