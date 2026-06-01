---
slug: "/reference/typescript/relay/relay-event/tap-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.TapEvent.constructor"
  parent: "relay.RelayEvent.TapEvent"
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
  state: string,
  tap: Record<string, any>,
  device: Record<string, any>
): TapEvent
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `eventType` | `string`              | yes      | —       | —           |
| `params`    | `Record<string, any>` | yes      | —       | —           |
| `callId`    | `string`              | yes      | —       | —           |
| `timestamp` | `number`              | yes      | —       | —           |
| `controlId` | `string`              | yes      | —       | —           |
| `state`     | `string`              | yes      | —       | —           |
| `tap`       | `Record<string, any>` | yes      | —       | —           |
| `device`    | `Record<string, any>` | yes      | —       | —           |

## Returns

`TapEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 369.
