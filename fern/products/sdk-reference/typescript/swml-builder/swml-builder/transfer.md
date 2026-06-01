---
slug: "/reference/typescript/swml-builder/swml-builder/transfer"
title: "transfer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.transfer"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `transfer`

Transfer the execution of the script to a different SWML section, URL, or Relay application. Once the transfer is complete, the script will continue executing SWML from the new location.

## Signature

```typescript
transfer(config: { ...3 fields }): this
```

## Parameters

| Name            | Type                                                                                 | Required | Default | Description |
| --------------- | ------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `config`        | `{ dest: string; meta?: Record<string, unknown>; params?: Record<string, unknown> }` | yes      | —       | —           |
| `config.dest`   | `string`                                                                             | yes      | —       | —           |
| `config.meta`   | `Record<string, unknown>`                                                            | no       | —       | —           |
| `config.params` | `Record<string, unknown>`                                                            | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 190.
