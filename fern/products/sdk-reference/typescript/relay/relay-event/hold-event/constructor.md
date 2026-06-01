---
slug: "/reference/typescript/relay/relay-event/hold-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.HoldEvent.constructor"
  parent: "relay.RelayEvent.HoldEvent"
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
  state: string
): HoldEvent
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `eventType` | `string`              | yes      | —       | —           |
| `params`    | `Record<string, any>` | yes      | —       | —           |
| `callId`    | `string`              | yes      | —       | —           |
| `timestamp` | `number`              | yes      | —       | —           |
| `state`     | `string`              | yes      | —       | —           |

## Returns

`HoldEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 698.
