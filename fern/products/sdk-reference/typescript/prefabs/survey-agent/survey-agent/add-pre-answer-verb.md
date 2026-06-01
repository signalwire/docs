---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/add-pre-answer-verb"
title: "addPreAnswerVerb"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.addPreAnswerVerb"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addPreAnswerVerb`

Add a SWML verb to execute before the answer phase (phase 1).

## Signature

```typescript
addPreAnswerVerb(
  verbName: string,
  config: number | Record<string, unknown>
): this
```

## Parameters

| Name       | Type                                | Required | Default | Description                                    |
| ---------- | ----------------------------------- | -------- | ------- | ---------------------------------------------- |
| `verbName` | `string`                            | yes      | —       | Name of the SWML verb (e.g. "play", "record"). |
| `config`   | `number \| Record<string, unknown>` | yes      | —       | Verb configuration object.                     |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1483.
