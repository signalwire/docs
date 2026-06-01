---
slug: "/reference/typescript/function-result/function-result/create-payment-prompt"
title: "createPaymentPrompt"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.createPaymentPrompt"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `createPaymentPrompt`

Create a payment prompt configuration object.

**Modifiers:** `static`

## Signature

```typescript
createPaymentPrompt(
  forSituation: string,
  actions: PaymentAction[],
  cardType?: string,
  errorType?: string
): PaymentPrompt
```

## Parameters

| Name           | Type              | Required | Default | Description                              |
| -------------- | ----------------- | -------- | ------- | ---------------------------------------- |
| `forSituation` | `string`          | yes      | —       | The situation this prompt applies to.    |
| `actions`      | `PaymentAction[]` | yes      | —       | Actions to perform for this prompt.      |
| `cardType`     | `string`          | no       | —       | Optional card type filter.               |
| `errorType`    | `string`          | no       | —       | Optional error type this prompt handles. |

## Returns

`PaymentPrompt` — A new PaymentPrompt object.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 849.
