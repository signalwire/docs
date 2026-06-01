---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/get-registered-tools"
title: "getRegisteredTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.getRegisteredTools"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `getRegisteredTools`

Get a summary of all registered tools with their names, descriptions, and
parameter schemas. Lifted from AgentBase so the swaig-test CLI can list
tools on a non-AgentBase SWMLService target (sidecar / standalone SWAIG
host).

## Signature

```typescript
getRegisteredTools(): { description: string; name: string; parameters: Record<string, unknown> }[]
```

## Returns

`{ description: string; name: string; parameters: Record<string, unknown> }[]` — Array of tool descriptors.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 557.
