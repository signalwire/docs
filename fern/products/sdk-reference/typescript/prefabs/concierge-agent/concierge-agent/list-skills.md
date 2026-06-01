---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/list-skills"
title: "listSkills"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.listSkills"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `listSkills`

List all registered skills with their names, instance IDs, and initialization status.

## Signature

```typescript
listSkills(): { initialized: boolean; instanceId: string; name: string }[]
```

## Returns

`{ initialized: boolean; instanceId: string; name: string }[]` — Array of skill descriptors.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1648.
