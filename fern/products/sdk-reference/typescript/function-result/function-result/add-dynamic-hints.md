---
slug: "/reference/typescript/function-result/function-result/add-dynamic-hints"
title: "addDynamicHints"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.addDynamicHints"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `addDynamicHints`

Add dynamic speech recognition hints to improve transcription accuracy.

## Signature

```typescript
addDynamicHints(
  hints: string | { ignore_case?: boolean; pattern: string; replace: string }[]
): this
```

## Parameters

| Name    | Type                                                                      | Required | Default | Description                                           |
| ------- | ------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------- |
| `hints` | `string \| { ignore_case?: boolean; pattern: string; replace: string }[]` | yes      | —       | Array of hint strings or pattern-replacement objects. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 265.
