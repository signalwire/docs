---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/set-native-functions"
title: "setNativeFunctions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.setNativeFunctions"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setNativeFunctions`

Set the list of native SWAIG function names (built-in platform functions).

## Signature

```typescript
setNativeFunctions(funcs: string[]): this
```

## Parameters

| Name    | Type       | Required | Default | Description                     |
| ------- | ---------- | -------- | ------- | ------------------------------- |
| `funcs` | `string[]` | yes      | —       | Array of native function names. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 847.
