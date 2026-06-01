---
slug: "/reference/typescript/function-result/payment-action"
title: "PaymentAction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "FunctionResult.PaymentAction"
  parent: "FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `PaymentAction`

A single action within a payment prompt (e.g., say or play).

## Signature

```typescript
interface PaymentAction
```

## Properties

| Name     | Type     | Required | Default | Description                               |
| -------- | -------- | -------- | ------- | ----------------------------------------- |
| `phrase` | `string` | yes      | —       | The phrase or URL to use for this action. |
| `type`   | `string` | yes      | —       | The action type (e.g., "say", "play").    |

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 21.
