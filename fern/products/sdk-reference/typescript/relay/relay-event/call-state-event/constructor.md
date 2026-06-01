---
slug: "/reference/typescript/relay/relay-event/call-state-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.CallStateEvent.constructor"
  parent: "relay.RelayEvent.CallStateEvent"
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
  callState: string,
  endReason: string,
  direction: string,
  device: Record<string, any>
): CallStateEvent
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `eventType` | `string`              | yes      | —       | —           |
| `params`    | `Record<string, any>` | yes      | —       | —           |
| `callId`    | `string`              | yes      | —       | —           |
| `timestamp` | `number`              | yes      | —       | —           |
| `callState` | `string`              | yes      | —       | —           |
| `endReason` | `string`              | yes      | —       | —           |
| `direction` | `string`              | yes      | —       | —           |
| `device`    | `Record<string, any>` | yes      | —       | —           |

## Returns

`CallStateEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 88.
