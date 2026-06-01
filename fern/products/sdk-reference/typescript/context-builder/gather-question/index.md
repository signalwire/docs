---
slug: "/reference/typescript/context-builder/gather-question"
title: "GatherQuestion"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "ContextBuilder.GatherQuestion"
  parent: "ContextBuilder"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `GatherQuestion`

Represents a single question within a gather operation.

## Signature

```typescript
class GatherQuestion
```

## Properties

| Name        | Type       | Required | Default | Description                                                           |
| ----------- | ---------- | -------- | ------- | --------------------------------------------------------------------- |
| `confirm`   | `boolean`  | yes      | —       | Whether the answer requires user confirmation.                        |
| `functions` | `string[]` | no       | —       | Optional list of SWAIG function names available during this question. |
| `key`       | `string`   | yes      | —       | Unique key used to store the answer.                                  |
| `prompt`    | `string`   | no       | —       | Optional additional prompt context for this question.                 |
| `question`  | `string`   | yes      | —       | The question text presented to the user.                              |
| `type`      | `string`   | yes      | —       | Expected answer type (e.g., "string", "number").                      |

## Methods

- [`constructor`](/reference/typescript/context-builder/gather-question/constructor) — Creates a new GatherQuestion.
- [`toDict`](/reference/typescript/context-builder/gather-question/to-dict) — Serializes this question to a plain object for SWML output.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 33.
