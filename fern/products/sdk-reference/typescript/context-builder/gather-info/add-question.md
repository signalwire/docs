---
slug: "/reference/typescript/context-builder/gather-info/add-question"
title: "addQuestion"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.GatherInfo.addQuestion"
  parent: "ContextBuilder.GatherInfo"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addQuestion`

Adds a question to this gather operation.

## Signature

```typescript
addQuestion(opts: { ...6 fields }): this
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

`this` — This GatherInfo for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 105.
