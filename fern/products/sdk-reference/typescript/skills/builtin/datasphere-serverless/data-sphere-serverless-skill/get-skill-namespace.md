---
slug: "/reference/typescript/skills/builtin/datasphere-serverless/data-sphere-serverless-skill/get-skill-namespace"
title: "getSkillNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill.getSkillNamespace"
  parent: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill"
  module: "skills.builtin.datasphere_serverless"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts"
---
# `getSkillNamespace`

Get the namespaced key for storing per-skill data in global\_data.

## Signature

```typescript
getSkillNamespace(): string
```

## Returns

`string` — A string like "skill:datetime" or "skill:my\_prefix".

## Source

[`src/skills/SkillBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/SkillBase.ts)

Line 440.
