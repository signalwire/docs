---
slug: "/reference/typescript/relay/relay-event/connect-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.ConnectEvent.constructor"
  parent: "relay.RelayEvent.ConnectEvent"
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
  connectState: string,
  peer: Record<string, any>
): ConnectEvent
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `eventType`    | `string`              | yes      | —       | —           |
| `params`       | `Record<string, any>` | yes      | —       | —           |
| `callId`       | `string`              | yes      | —       | —           |
| `timestamp`    | `number`              | yes      | —       | —           |
| `connectState` | `string`              | yes      | —       | —           |
| `peer`         | `Record<string, any>` | yes      | —       | —           |

## Returns

`ConnectEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 283.
