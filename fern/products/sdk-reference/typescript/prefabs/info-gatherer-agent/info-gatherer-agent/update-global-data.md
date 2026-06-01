---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/update-global-data"
title: "updateGlobalData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.updateGlobalData"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `updateGlobalData`

Merge additional entries into the existing global\_data object.

## Signature

```typescript
updateGlobalData(data: Record<string, unknown>): this
```

## Parameters

| Name   | Type                      | Required | Default | Description                                |
| ------ | ------------------------- | -------- | ------- | ------------------------------------------ |
| `data` | `Record<string, unknown>` | yes      | —       | Key-value pairs to merge into global data. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 837.
