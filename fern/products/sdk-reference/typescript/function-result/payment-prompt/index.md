---
slug: "/reference/typescript/function-result/payment-prompt"
title: "PaymentPrompt"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "FunctionResult.PaymentPrompt"
  parent: "FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `PaymentPrompt`

Prompt configuration for a payment collection flow.

## Signature

```typescript
interface PaymentPrompt
```

## Properties

| Name         | Type              | Required | Default | Description                                                         |
| ------------ | ----------------- | -------- | ------- | ------------------------------------------------------------------- |
| `actions`    | `PaymentAction[]` | yes      | —       | Actions to perform for this prompt.                                 |
| `card_type`  | `string`          | no       | —       | Optional card type filter for this prompt.                          |
| `error_type` | `string`          | no       | —       | Optional error type this prompt handles.                            |
| `for`        | `string`          | yes      | —       | The situation this prompt applies to (e.g., "payment-card-number"). |

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 9.
