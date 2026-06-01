---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/set-global-data"
title: "setGlobalData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.setGlobalData"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setGlobalData`

Merge data into the global\_data object passed into the AI configuration.

Matches Python `set_global_data` which calls `.update()` on the internal dict —
existing keys are preserved; incoming keys overwrite on collision. Skills and
other callers can each contribute keys without clobbering one another.

If you need to replace the entire object, assign a new agent instance or use
`Object.assign(agent.globalData, {})` to clear first.

## Signature

```typescript
setGlobalData(data: Record<string, unknown>): this
```

## Parameters

| Name   | Type                      | Required | Default | Description                                |
| ------ | ------------------------- | -------- | ------- | ------------------------------------------ |
| `data` | `Record<string, unknown>` | yes      | —       | Key-value pairs to merge into global data. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 827.
