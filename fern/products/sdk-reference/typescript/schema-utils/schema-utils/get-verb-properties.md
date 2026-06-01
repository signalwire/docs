---
slug: "/reference/typescript/schema-utils/schema-utils/get-verb-properties"
title: "getVerbProperties"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SchemaUtils.SchemaUtils.getVerbProperties"
  parent: "SchemaUtils.SchemaUtils"
  module: "SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts"
---
# `getVerbProperties`

Get the inner properties schema for a specific verb.
For example, for "hangup" this returns `{ type: "object", properties: { reason: ... }, ... }`.

## Signature

```typescript
getVerbProperties(verbName: string): Record<string, unknown>
```

## Parameters

| Name       | Type     | Required | Default | Description                           |
| ---------- | -------- | -------- | ------- | ------------------------------------- |
| `verbName` | `string` | yes      | —       | The verb name (e.g. "answer", "tap"). |

## Returns

`Record<string, unknown>` — The inner schema definition or an empty object if not found.

## Source

[`src/SchemaUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts)

Line 134.
