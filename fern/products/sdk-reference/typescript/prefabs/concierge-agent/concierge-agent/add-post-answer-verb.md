---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/add-post-answer-verb"
title: "addPostAnswerVerb"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.addPostAnswerVerb"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addPostAnswerVerb`

Add a SWML verb to execute after the answer phase but before the AI verb (phase 3).

## Signature

```typescript
addPostAnswerVerb(
  verbName: string,
  config: number | Record<string, unknown>
): this
```

## Parameters

| Name       | Type                                | Required | Default | Description                |
| ---------- | ----------------------------------- | -------- | ------- | -------------------------- |
| `verbName` | `string`                            | yes      | —       | Name of the SWML verb.     |
| `config`   | `number \| Record<string, unknown>` | yes      | —       | Verb configuration object. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1504.
