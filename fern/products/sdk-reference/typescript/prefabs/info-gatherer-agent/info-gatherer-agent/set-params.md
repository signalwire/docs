---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/set-params"
title: "setParams"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.setParams"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setParams`

Merge multiple AI parameters into the existing params object.

## Signature

```typescript
setParams(params: Record<string, unknown>): this
```

## Parameters

| Name     | Type                      | Required | Default | Description               |
| -------- | ------------------------- | -------- | ------- | ------------------------- |
| `params` | `Record<string, unknown>` | yes      | —       | Key-value pairs to merge. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 809.
