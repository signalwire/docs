---
slug: "/reference/typescript/relay/normalize/normalize-device-plan"
title: "normalizeDevicePlan"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "relay.normalize.normalizeDevicePlan"
  parent: "relay.normalize"
  module: "relay.normalize"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/normalize.ts"
---
# `normalizeDevicePlan`

Normalize a 2D dial plan (outer = serial groups, inner = parallel devices).

## Signature

```typescript
normalizeDevicePlan(
  plan: Record<string, unknown>[][]
): Record<string, unknown>[][]
```

## Parameters

| Name   | Type                          | Required | Default | Description |
| ------ | ----------------------------- | -------- | ------- | ----------- |
| `plan` | `Record<string, unknown>[][]` | yes      | —       | —           |

## Returns

`Record<string, unknown>[][]`

## Source

[`src/relay/normalize.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/normalize.ts)

Line 58.
