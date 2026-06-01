---
slug: "/reference/typescript/relay/types/send-message-options"
title: "SendMessageOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.SendMessageOptions"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `SendMessageOptions`

Options for the sendMessage() method.

## Signature

```typescript
interface SendMessageOptions
```

## Properties

| Name         | Type       | Required | Default | Description                               |
| ------------ | ---------- | -------- | ------- | ----------------------------------------- |
| `body`       | `string`   | no       | —       | Message body text.                        |
| `context`    | `string`   | no       | —       | Context for the message.                  |
| `fromNumber` | `string`   | yes      | —       | Sender phone number in E.164 format.      |
| `media`      | `string[]` | no       | —       | Media URLs for MMS.                       |
| `tags`       | `string[]` | no       | —       | Tags for the message.                     |
| `toNumber`   | `string`   | yes      | —       | Destination phone number in E.164 format. |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 107.
