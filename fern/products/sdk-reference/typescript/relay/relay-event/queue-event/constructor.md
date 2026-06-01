---
slug: "/reference/typescript/relay/relay-event/queue-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.QueueEvent.constructor"
  parent: "relay.RelayEvent.QueueEvent"
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
  controlId: string,
  status: string,
  queueId: string,
  queueName: string,
  position: number,
  size: number
): QueueEvent
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `eventType` | `string`              | yes      | —       | —           |
| `params`    | `Record<string, any>` | yes      | —       | —           |
| `callId`    | `string`              | yes      | —       | —           |
| `timestamp` | `number`              | yes      | —       | —           |
| `controlId` | `string`              | yes      | —       | —           |
| `status`    | `string`              | yes      | —       | —           |
| `queueId`   | `string`              | yes      | —       | —           |
| `queueName` | `string`              | yes      | —       | —           |
| `position`  | `number`              | yes      | —       | —           |
| `size`      | `number`              | yes      | —       | —           |

## Returns

`QueueEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 591.
