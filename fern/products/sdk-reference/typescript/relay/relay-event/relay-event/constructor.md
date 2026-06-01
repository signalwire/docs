---
slug: "/reference/typescript/relay/relay-event/relay-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.RelayEvent.constructor"
  parent: "relay.RelayEvent.RelayEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `constructor`

## Signature

```typescript
constructor(
  eventType: string,
  params: Record<string, any>,
  callId: string = '',
  timestamp: number = 0
): RelayEvent
```

## Parameters

| Name        | Type                  | Required | Default | Description                  |
| ----------- | --------------------- | -------- | ------- | ---------------------------- |
| `eventType` | `string`              | yes      | —       | Fully-qualified event type.  |
| `params`    | `Record<string, any>` | yes      | —       | Raw event params dict.       |
| `callId`    | `string`              | yes      | `''`    | Call ID (if applicable).     |
| `timestamp` | `number`              | yes      | `0`     | Server-side event timestamp. |

## Returns

`RelayEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 36.
