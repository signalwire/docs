---
slug: "/reference/typescript/data-map/data-map/fallback-output"
title: "fallbackOutput"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.fallbackOutput"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `fallbackOutput`

Set a fallback output used when no webhook or expression matches.

## Signature

```typescript
fallbackOutput(result: FunctionResult): this
```

## Parameters

| Name     | Type             | Required | Default | Description                                |
| -------- | ---------------- | -------- | ------- | ------------------------------------------ |
| `result` | `FunctionResult` | yes      | —       | The FunctionResult to use as the fallback. |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 341.
