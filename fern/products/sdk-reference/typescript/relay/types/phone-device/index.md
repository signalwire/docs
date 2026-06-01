---
slug: "/reference/typescript/relay/types/phone-device"
title: "PhoneDevice"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.PhoneDevice"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `PhoneDevice`

Phone device specification for dial/connect.

## Signature

```typescript
interface PhoneDevice
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
| `type`         | `"phone"`                  | yes      | —       | —           |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 72.
