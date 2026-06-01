---
slug: "/reference/typescript/prefabs/survey-agent/survey-agent/add-pattern-hint"
title: "addPatternHint"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyAgent.addPatternHint"
  parent: "prefabs.SurveyAgent.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addPatternHint`

Add a pattern-based speech-recognition hint with find-and-replace behavior.

## Signature

```typescript
addPatternHint(opts: { ...4 fields }): this
```

## Parameters

| Name              | Type                                                                       | Required | Default | Description                                                                                                                      |
| ----------------- | -------------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `opts`            | `{ hint: string; ignoreCase?: boolean; pattern: string; replace: string }` | yes      | —       | Pattern hint configuration with a descriptive hint label, regex pattern, replacement string, and optional case-insensitive flag. |
| `opts.hint`       | `string`                                                                   | yes      | —       | —                                                                                                                                |
| `opts.ignoreCase` | `boolean`                                                                  | no       | —       | —                                                                                                                                |
| `opts.pattern`    | `string`                                                                   | yes      | —       | —                                                                                                                                |
| `opts.replace`    | `string`                                                                   | yes      | —       | —                                                                                                                                |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 673.
