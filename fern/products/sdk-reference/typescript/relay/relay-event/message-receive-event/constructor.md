---
slug: "/reference/typescript/relay/relay-event/message-receive-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.MessageReceiveEvent.constructor"
  parent: "relay.RelayEvent.MessageReceiveEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `constructor`

## Signature

```typescript
constructor(
  eventType: string,
  params: Record<string, any>,
  callId: string,
  timestamp: number,
  messageId: string,
  context: string,
  direction: string,
  fromNumber: string,
  toNumber: string,
  body: string,
  media: string[],
  segments: number,
  messageState: string,
  tags: string[]
): MessageReceiveEvent
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `eventType`    | `string`              | yes      | —       | —           |
| `params`       | `Record<string, any>` | yes      | —       | —           |
| `callId`       | `string`              | yes      | —       | —           |
| `timestamp`    | `number`              | yes      | —       | —           |
| `messageId`    | `string`              | yes      | —       | —           |
| `context`      | `string`              | yes      | —       | —           |
| `direction`    | `string`              | yes      | —       | —           |
| `fromNumber`   | `string`              | yes      | —       | —           |
| `toNumber`     | `string`              | yes      | —       | —           |
| `body`         | `string`              | yes      | —       | —           |
| `media`        | `string[]`            | yes      | —       | —           |
| `segments`     | `number`              | yes      | —       | —           |
| `messageState` | `string`              | yes      | —       | —           |
| `tags`         | `string[]`            | yes      | —       | —           |

## Returns

`MessageReceiveEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 793.
