---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/add-hint"
title: "addHint"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.addHint"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addHint`

Add a single speech-recognition hint.

## Signature

```typescript
addHint(hint: string): this
```

## Parameters

| Name   | Type     | Required | Default | Description                                    |
| ------ | -------- | -------- | ------- | ---------------------------------------------- |
| `hint` | `string` | yes      | —       | Word or phrase to boost in speech recognition. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 652.
