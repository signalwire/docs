---
slug: "/reference/typescript/function-result/function-result/create-payment-parameter"
title: "createPaymentParameter"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.createPaymentParameter"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `createPaymentParameter`

Create a custom payment parameter for the payment connector.

**Modifiers:** `static`

## Signature

```typescript
createPaymentParameter(name: string, value: string): PaymentParameter
```

## Parameters

| Name    | Type     | Required | Default | Description          |
| ------- | -------- | -------- | ------- | -------------------- |
| `name`  | `string` | yes      | —       | The parameter name.  |
| `value` | `string` | yes      | —       | The parameter value. |

## Returns

`PaymentParameter` — A new PaymentParameter object.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 877.
