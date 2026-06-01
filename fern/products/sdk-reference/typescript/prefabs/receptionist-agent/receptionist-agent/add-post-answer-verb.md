---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/add-post-answer-verb"
title: "addPostAnswerVerb"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.addPostAnswerVerb"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
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
