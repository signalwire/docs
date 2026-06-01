---
slug: "/reference/typescript/data-map/data-map/global-error-keys"
title: "globalErrorKeys"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.globalErrorKeys"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `globalErrorKeys`

Set error keys at the top-level data map scope, regardless of webhook context.

## Signature

```typescript
globalErrorKeys(keys: string[]): this
```

## Parameters

| Name   | Type       | Required | Default | Description                                    |
| ------ | ---------- | -------- | ------- | ---------------------------------------------- |
| `keys` | `string[]` | yes      | —       | Response keys that indicate an error occurred. |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 365.
