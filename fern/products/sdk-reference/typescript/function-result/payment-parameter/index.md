---
slug: "/reference/typescript/function-result/payment-parameter"
title: "PaymentParameter"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "FunctionResult.PaymentParameter"
  parent: "FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `PaymentParameter`

A custom key-value parameter passed to the payment connector.

## Signature

```typescript
interface PaymentParameter
```

## Properties

| Name    | Type     | Required | Default | Description          |
| ------- | -------- | -------- | ------- | -------------------- |
| `name`  | `string` | yes      | —       | The parameter name.  |
| `value` | `string` | yes      | —       | The parameter value. |

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 29.
