---
slug: "/reference/typescript/swml-builder/swml-builder/tap"
title: "tap"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.tap"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `tap`

Start background call tap. Media is streamed over Websocket or RTP to customer controlled URI.

## Signature

```typescript
tap(config: { ...6 fields }): this
```

## Parameters

| Name                | Type                                                                                                                                                 | Required | Default | Description |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`            | `{ codec?: "PCMU" \| "PCMA"; control_id?: string; direction?: "speak" \| "listen" \| "both"; rtp_ptime?: number; status_url?: string; uri: string }` | yes      | —       | —           |
| `config.codec`      | `"PCMU" \| "PCMA"`                                                                                                                                   | no       | —       | —           |
| `config.control_id` | `string`                                                                                                                                             | no       | —       | —           |
| `config.direction`  | `"speak" \| "listen" \| "both"`                                                                                                                      | no       | —       | —           |
| `config.rtp_ptime`  | `number`                                                                                                                                             | no       | —       | —           |
| `config.status_url` | `string`                                                                                                                                             | no       | —       | —           |
| `config.uri`        | `string`                                                                                                                                             | yes      | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 182.
