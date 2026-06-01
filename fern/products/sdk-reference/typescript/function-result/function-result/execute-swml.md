---
slug: "/reference/typescript/function-result/function-result/execute-swml"
title: "executeSwml"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.executeSwml"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `executeSwml`

Execute arbitrary SWML content as an action.

## Signature

```typescript
executeSwml(
  swmlContent: string | Record<string, unknown> | { toDict: unknown },
  transfer: boolean = false
): this
```

## Parameters

| Name          | Type                                                       | Required | Default | Description                                           |
| ------------- | ---------------------------------------------------------- | -------- | ------- | ----------------------------------------------------- |
| `swmlContent` | `string \| Record<string, unknown> \| { toDict: unknown }` | yes      | —       | SWML as a JSON string or object.                      |
| `transfer`    | `boolean`                                                  | yes      | `false` | Whether this SWML execution should transfer the call. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 342.
