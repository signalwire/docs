---
slug: "/reference/typescript/data-map/data-map/foreach"
title: "foreach"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "DataMap.DataMap.foreach"
  parent: "DataMap.DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `foreach`

Configure iteration over an array in the webhook response.

## Signature

```typescript
foreach(config: { ...4 fields }): this
```

## Parameters

| Name                | Type                                                                      | Required | Default | Description                                                                      |
| ------------------- | ------------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------- |
| `config`            | `{ append: string; input_key: string; max?: number; output_key: string }` | yes      | —       | Foreach configuration with input/output keys, append template, and optional max. |
| `config.append`     | `string`                                                                  | yes      | —       | —                                                                                |
| `config.input_key`  | `string`                                                                  | yes      | —       | —                                                                                |
| `config.max`        | `number`                                                                  | no       | —       | —                                                                                |
| `config.output_key` | `string`                                                                  | yes      | —       | —                                                                                |

## Returns

`this` — This instance for chaining.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 314.
