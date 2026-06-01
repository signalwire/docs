---
slug: "/reference/typescript/data-map/set-allowed-env-prefixes"
title: "setAllowedEnvPrefixes"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "DataMap.setAllowedEnvPrefixes"
  parent: "DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `setAllowedEnvPrefixes`

Set the global allowed env var prefixes for `${ENV.*}` expansion.

Only environment variables whose names start with one of these prefixes
will be expanded. An empty array allows all variables (escape hatch).

## Signature

```typescript
setAllowedEnvPrefixes(prefixes: string[]): void
```

## Parameters

| Name       | Type       | Required | Default | Description                       |
| ---------- | ---------- | -------- | ------- | --------------------------------- |
| `prefixes` | `string[]` | yes      | —       | Array of prefix strings to allow. |

## Returns

`void`

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 23.
