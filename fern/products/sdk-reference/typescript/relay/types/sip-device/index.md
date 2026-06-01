---
slug: "/reference/typescript/relay/types/sip-device"
title: "SipDevice"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.SipDevice"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `SipDevice`

SIP device specification for dial/connect.

## Signature

```typescript
interface SipDevice
```

## Properties

| Name           | Type                       | Required | Default | Description |
| -------------- | -------------------------- | -------- | ------- | ----------- |
| `codecs`       | `string[]`                 | no       | —       | —           |
| `from`         | `string`                   | yes      | —       | —           |
| `headers`      | `Record<string, string>[]` | no       | —       | —           |
| `max_duration` | `number`                   | no       | —       | —           |
| `timeout`      | `number`                   | no       | —       | —           |
| `to`           | `string`                   | yes      | —       | —           |
| `type`         | `"sip"`                    | yes      | —       | —           |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 83.
