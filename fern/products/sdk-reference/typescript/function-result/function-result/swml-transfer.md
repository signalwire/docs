---
slug: "/reference/typescript/function-result/function-result/swml-transfer"
title: "swmlTransfer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.swmlTransfer"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `swmlTransfer`

Transfer the call to a SWML destination with a custom AI response.

## Signature

```typescript
swmlTransfer(dest: string, aiResponse: string, final: boolean = true): this
```

## Parameters

| Name         | Type      | Required | Default | Description                                      |
| ------------ | --------- | -------- | ------- | ------------------------------------------------ |
| `dest`       | `string`  | yes      | —       | The transfer destination.                        |
| `aiResponse` | `string`  | yes      | —       | The AI response text to set before transferring. |
| `final`      | `boolean` | yes      | `true`  | Whether this is a final transfer.                |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 168.
