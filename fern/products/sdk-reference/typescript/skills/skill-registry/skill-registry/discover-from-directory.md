---
slug: "/reference/typescript/skills/skill-registry/skill-registry/discover-from-directory"
title: "discoverFromDirectory"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.SkillRegistry.SkillRegistry.discoverFromDirectory"
  parent: "skills.SkillRegistry.SkillRegistry"
  module: "skills.SkillRegistry"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts"
---
# `discoverFromDirectory`

Discover and register skills from a directory by importing each file.
Looks for SkillBase subclass exports and registers them.

## Signature

```typescript
discoverFromDirectory(dirPath: string): Promise<string[]>
```

## Parameters

| Name      | Type     | Required | Default | Description                             |
| --------- | -------- | -------- | ------- | --------------------------------------- |
| `dirPath` | `string` | yes      | —       | Absolute path to the directory to scan. |

## Returns

`Promise<string[]>` — Array of newly discovered skill names.

## Source

[`src/skills/SkillRegistry.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillRegistry.ts)

Line 282.
