---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/get-registered-tools"
title: "getRegisteredTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.getRegisteredTools"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
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
