---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/set-function-includes"
title: "setFunctionIncludes"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.setFunctionIncludes"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setFunctionIncludes`

Replace the entire list of function includes.
Each include must have a `url` and `functions` array.

## Signature

```typescript
setFunctionIncludes(includes: FunctionInclude[]): this
```

## Parameters

| Name       | Type                | Required | Default | Description                        |
| ---------- | ------------------- | -------- | ------- | ---------------------------------- |
| `includes` | `FunctionInclude[]` | yes      | —       | Array of function include objects. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 978.
