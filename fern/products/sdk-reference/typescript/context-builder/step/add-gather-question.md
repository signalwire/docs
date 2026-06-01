---
slug: "/reference/typescript/context-builder/step/add-gather-question"
title: "addGatherQuestion"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.addGatherQuestion"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addGatherQuestion`

Add a question to this step's gather\_info configuration.
setGatherInfo() must be called before this method.

IMPORTANT — gather mode locks function access:
While the model is asking gather questions, the runtime forcibly
deactivates ALL of the step's other functions. The only callable
tools during a gather question are:

- `gather_submit` (the native answer-submission tool)
- Whatever names you list in this question's `functions` option

`next_step` and `change_context` are also filtered out — the model
cannot navigate away until the gather completes. This is by design:
it forces a tight ask → submit → next-question loop.

If a question needs to call out to a tool (e.g. validate an email,
geocode a ZIP), list that tool name in this question's `functions`.
Functions listed here are active ONLY for this question.

## Signature

```typescript
addGatherQuestion(opts: { ...6 fields }): this
```

## Parameters

| Name             | Type                                                                                                         | Required | Default | Description                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------ |
| `opts`           | `{ confirm?: boolean; functions?: string[]; key: string; prompt?: string; question: string; type?: string }` | yes      | —       | Question configuration including key, question text, and optional type/confirm/prompt/functions. |
| `opts.confirm`   | `boolean`                                                                                                    | no       | —       | —                                                                                                |
| `opts.functions` | `string[]`                                                                                                   | no       | —       | —                                                                                                |
| `opts.key`       | `string`                                                                                                     | yes      | —       | —                                                                                                |
| `opts.prompt`    | `string`                                                                                                     | no       | —       | —                                                                                                |
| `opts.question`  | `string`                                                                                                     | yes      | —       | —                                                                                                |
| `opts.type`      | `string`                                                                                                     | no       | —       | —                                                                                                |

## Returns

`this` — This step for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 366.
