---
slug: "/reference/typescript/data-map/data-map/enable-env-expansion"
title: "enableEnvExpansion"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.enableEnvExpansion"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `enableEnvExpansion`

Enable `${ENV.*}` variable expansion in URLs, bodies, and outputs.

## Signature

```typescript
enableEnvExpansion(enabled: boolean = true): this
```

## Parameters

| Name      | Type      | Required | Default | Description                                     |
| --------- | --------- | -------- | ------- | ----------------------------------------------- |
| `enabled` | `boolean` | yes      | `true`  | Whether to enable expansion (defaults to true). |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 118.
