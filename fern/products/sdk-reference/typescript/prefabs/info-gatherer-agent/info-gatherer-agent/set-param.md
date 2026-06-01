---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/set-param"
title: "setParam"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.setParam"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setParam`

Set a single AI parameter (e.g. "temperature", "top\_p").

## Signature

```typescript
setParam(key: string, value: unknown): this
```

## Parameters

| Name    | Type      | Required | Default | Description      |
| ------- | --------- | -------- | ------- | ---------------- |
| `key`   | `string`  | yes      | —       | Parameter name.  |
| `value` | `unknown` | yes      | —       | Parameter value. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 799.
