---
slug: "/reference/typescript/schema-utils/verb-definition"
title: "VerbDefinition"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SchemaUtils.VerbDefinition"
  parent: "SchemaUtils"
  module: "SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts"
---
# `VerbDefinition`

A verb definition extracted from the schema.

## Signature

```typescript
interface VerbDefinition
```

## Properties

| Name         | Type                      | Required | Default | Description                                                                  |
| ------------ | ------------------------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `definition` | `Record<string, unknown>` | yes      | —       | The raw JSON Schema definition object for this verb.                         |
| `name`       | `string`                  | yes      | —       | The verb name as used in SWML (e.g. "answer", "hangup", "sip\_refer").       |
| `schemaName` | `string`                  | yes      | —       | The PascalCase schema definition name (e.g. "Answer", "Hangup", "SIPRefer"). |

## Source

[`src/SchemaUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts)

Line 20.
