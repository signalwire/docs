---
slug: "/reference/typescript/swml-builder/swml-builder/send-fax"
title: "send_fax"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.send_fax"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `send_fax`

Send a fax.

## Signature

```typescript
send_fax(config: { ...4 fields }): this
```

## Parameters

| Name                 | Type                                                                                 | Required | Default | Description |
| -------------------- | ------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `config`             | `{ document: string; header_info?: string; identity?: string; status_url?: string }` | yes      | —       | —           |
| `config.document`    | `string`                                                                             | yes      | —       | —           |
| `config.header_info` | `string`                                                                             | no       | —       | —           |
| `config.identity`    | `string`                                                                             | no       | —       | —           |
| `config.status_url`  | `string`                                                                             | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 151.
