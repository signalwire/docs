---
slug: "/reference/typescript/context-builder/gather-question/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.GatherQuestion.constructor"
  parent: "ContextBuilder.GatherQuestion"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `constructor`

Creates a new GatherQuestion.

## Signature

```typescript
constructor(opts: { ...6 fields }): GatherQuestion
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

`GatherQuestion`

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 51.
