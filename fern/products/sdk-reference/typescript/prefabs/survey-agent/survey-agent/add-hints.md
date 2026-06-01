---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/add-hints"
title: "addHints"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.addHints"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addHints`

Add multiple speech-recognition hints at once.

## Signature

```typescript
addHints(hints: string[]): this
```

## Parameters

| Name    | Type       | Required | Default | Description                         |
| ------- | ---------- | -------- | ------- | ----------------------------------- |
| `hints` | `string[]` | yes      | —       | Array of words or phrases to boost. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 662.
