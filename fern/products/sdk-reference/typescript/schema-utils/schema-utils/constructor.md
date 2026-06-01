---
slug: "/reference/typescript/schema-utils/schema-utils/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SchemaUtils.SchemaUtils.constructor"
  parent: "SchemaUtils.SchemaUtils"
  module: "SchemaUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts"
---
# `constructor`

Create a SchemaUtils instance.

## Signature

```typescript
constructor(opts?: { ...3 fields }): SchemaUtils
```

## Parameters

| Name                  | Type                                                                       | Required | Default | Description                                                                                         |
| --------------------- | -------------------------------------------------------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------- |
| `opts`                | `{ maxCacheSize?: number; schemaPath?: string; skipValidation?: boolean }` | no       | —       | Optional settings for skipping validation, limiting cache size, or overriding the schema file path. |
| `opts.maxCacheSize`   | `number`                                                                   | no       | —       | —                                                                                                   |
| `opts.schemaPath`     | `string`                                                                   | no       | —       | —                                                                                                   |
| `opts.skipValidation` | `boolean`                                                                  | no       | —       | —                                                                                                   |

## Returns

`SchemaUtils`

## Source

[`src/SchemaUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SchemaUtils.ts)

Line 47.
