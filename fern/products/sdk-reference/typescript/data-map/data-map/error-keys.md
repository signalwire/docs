---
slug: "/reference/typescript/data-map/data-map/error-keys"
title: "errorKeys"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.errorKeys"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `errorKeys`

Set error keys on the most recently added webhook, or globally if no webhook exists.

## Signature

```typescript
errorKeys(keys: string[]): this
```

## Parameters

| Name   | Type       | Required | Default | Description                                    |
| ------ | ---------- | -------- | ------- | ---------------------------------------------- |
| `keys` | `string[]` | yes      | —       | Response keys that indicate an error occurred. |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 351.
