---
slug: "/reference/typescript/function-result/function-result/replace-in-history"
title: "replaceInHistory"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.replaceInHistory"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `replaceInHistory`

Replace the function call output in conversation history.

## Signature

```typescript
replaceInHistory(text: string | boolean = true): this
```

## Parameters

| Name   | Type                | Required | Default | Description                                             |
| ------ | ------------------- | -------- | ------- | ------------------------------------------------------- |
| `text` | `string \| boolean` | yes      | `true`  | Replacement text, or true to replace with the response. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 472.
