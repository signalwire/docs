---
slug: "/reference/typescript/function-result/function-result/hold"
title: "hold"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.hold"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `hold`

Place the call on hold for a specified duration.

## Signature

```typescript
hold(timeout: number = 300): this
```

## Parameters

| Name      | Type     | Required | Default | Description                                 |
| --------- | -------- | -------- | ------- | ------------------------------------------- |
| `timeout` | `number` | yes      | `300`   | Hold duration in seconds, clamped to 0-900. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 197.
