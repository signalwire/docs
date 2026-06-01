---
slug: "/reference/typescript/skills/builtin/datasphere/data-sphere-skill/get-global-data"
title: "getGlobalData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "skills.builtin.datasphere.DataSphereSkill.getGlobalData"
  parent: "skills.builtin.datasphere.DataSphereSkill"
  module: "skills.builtin.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere.ts"
---
# `getGlobalData`

Global data injected into the agent's SWML context. Matches Python's
`get_global_data()` so downstream consumers can detect DataSphere
availability, the configured `document_id`, and the knowledge provider.

## Signature

```typescript
getGlobalData(): Record<string, unknown>
```

## Returns

`Record<string, unknown>`

## Source

[`src/skills/builtin/datasphere.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/skills/builtin/datasphere.ts)

Line 179.
