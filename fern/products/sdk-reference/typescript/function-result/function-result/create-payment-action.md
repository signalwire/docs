---
slug: "/reference/typescript/function-result/function-result/create-payment-action"
title: "createPaymentAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.createPaymentAction"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `createPaymentAction`

Create a payment action for use within a payment prompt.

**Modifiers:** `static`

## Signature

```typescript
createPaymentAction(actionType: string, phrase: string): PaymentAction
```

## Parameters

| Name         | Type     | Required | Default | Description                            |
| ------------ | -------- | -------- | ------- | -------------------------------------- |
| `actionType` | `string` | yes      | —       | The action type (e.g., "say", "play"). |
| `phrase`     | `string` | yes      | —       | The phrase or URL for this action.     |

## Returns

`PaymentAction` — A new PaymentAction object.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 867.
