---
slug: "/reference/typescript/relay/message/message/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Message.Message.constructor"
  parent: "relay.Message.Message"
  module: "relay.Message"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Message.ts"
---
# `constructor`

## Signature

```typescript
constructor(options: { ...11 fields } = {}): Message
```

## Parameters

| Name                 | Type                                                                                                                                                                                                         | Required | Default | Description |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `options`            | `{ body?: string; context?: string; direction?: string; fromNumber?: string; media?: string[]; messageId?: string; reason?: string; segments?: number; state?: string; tags?: string[]; toNumber?: string }` | yes      | `{}`    | —           |
| `options.body`       | `string`                                                                                                                                                                                                     | no       | —       | —           |
| `options.context`    | `string`                                                                                                                                                                                                     | no       | —       | —           |
| `options.direction`  | `string`                                                                                                                                                                                                     | no       | —       | —           |
| `options.fromNumber` | `string`                                                                                                                                                                                                     | no       | —       | —           |
| `options.media`      | `string[]`                                                                                                                                                                                                   | no       | —       | —           |
| `options.messageId`  | `string`                                                                                                                                                                                                     | no       | —       | —           |
| `options.reason`     | `string`                                                                                                                                                                                                     | no       | —       | —           |
| `options.segments`   | `number`                                                                                                                                                                                                     | no       | —       | —           |
| `options.state`      | `string`                                                                                                                                                                                                     | no       | —       | —           |
| `options.tags`       | `string[]`                                                                                                                                                                                                   | no       | —       | —           |
| `options.toNumber`   | `string`                                                                                                                                                                                                     | no       | —       | —           |

## Returns

`Message`

## Source

[`src/relay/Message.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Message.ts)

Line 64.
