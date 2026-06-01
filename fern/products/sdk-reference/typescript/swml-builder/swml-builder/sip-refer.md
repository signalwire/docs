---
slug: "/reference/typescript/swml-builder/swml-builder/sip-refer"
title: "sip_refer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.sip_refer"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `sip_refer`

Send SIP REFER to a SIP call.

## Signature

```typescript
sip_refer(config: { ...4 fields }): this
```

## Parameters

| Name                | Type                                                                            | Required | Default | Description |
| ------------------- | ------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`            | `{ password?: string; status_url?: string; to_uri: string; username?: string }` | yes      | —       | —           |
| `config.password`   | `string`                                                                        | no       | —       | —           |
| `config.status_url` | `string`                                                                        | no       | —       | —           |
| `config.to_uri`     | `string`                                                                        | yes      | —       | —           |
| `config.username`   | `string`                                                                        | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 163.
