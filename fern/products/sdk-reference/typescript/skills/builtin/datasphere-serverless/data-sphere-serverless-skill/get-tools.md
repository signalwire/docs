---
slug: "/reference/typescript/skills/builtin/datasphere-serverless/data-sphere-serverless-skill/get-tools"
title: "getTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill.getTools"
  parent: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill"
  module: "skills.builtin.datasphere_serverless"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere_serverless.ts"
---
# `getTools`

Return a stub tool definition since this skill uses DataMap-based execution.
The actual DataMap function is provided by getDataMapTools().

## Signature

```typescript
getTools(): SkillToolDefinition[]
```

## Returns

`SkillToolDefinition[]` — A single stub tool (named via `tool_name`) that explains its DataMap nature.

## Source

[`src/skills/builtin/datasphere_serverless.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere_serverless.ts)

Line 287.
