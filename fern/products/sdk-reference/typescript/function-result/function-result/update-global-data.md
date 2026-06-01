---
slug: "/reference/typescript/function-result/function-result/update-global-data"
title: "updateGlobalData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.updateGlobalData"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `updateGlobalData`

Merge key-value pairs into the global data store shared across functions.

## Signature

```typescript
updateGlobalData(data: Record<string, unknown>): this
```

## Parameters

| Name   | Type                      | Required | Default | Description                       |
| ------ | ------------------------- | -------- | ------- | --------------------------------- |
| `data` | `Record<string, unknown>` | yes      | —       | Key-value pairs to set or update. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 303.
