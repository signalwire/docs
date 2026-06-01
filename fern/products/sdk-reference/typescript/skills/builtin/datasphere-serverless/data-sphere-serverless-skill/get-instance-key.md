---
slug: "/reference/typescript/skills/builtin/datasphere-serverless/data-sphere-serverless-skill/get-instance-key"
title: "getInstanceKey"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill.getInstanceKey"
  parent: "skills.builtin.datasphere_serverless.DataSphereServerlessSkill"
  module: "skills.builtin.datasphere_serverless"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere_serverless.ts"
---
# `getInstanceKey`

Instance key for the SkillManager. Defaults to
`datasphere_serverless_search_knowledge`, matching the Python SDK default.
When `tool_name` is set, uses `datasphere_serverless_<tool_name>`.

## Signature

```typescript
getInstanceKey(): string
```

## Returns

`string`

## Source

[`src/skills/builtin/datasphere_serverless.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere_serverless.ts)

Line 135.
