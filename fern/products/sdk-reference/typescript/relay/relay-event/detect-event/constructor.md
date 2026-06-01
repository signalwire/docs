---
slug: "/reference/typescript/relay/relay-event/detect-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.DetectEvent.constructor"
  parent: "relay.RelayEvent.DetectEvent"
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
  detect: Record<string, any>
): DetectEvent
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `eventType` | `string`              | yes      | —       | —           |
| `params`    | `Record<string, any>` | yes      | —       | —           |
| `callId`    | `string`              | yes      | —       | —           |
| `timestamp` | `number`              | yes      | —       | —           |
| `controlId` | `string`              | yes      | —       | —           |
| `detect`    | `Record<string, any>` | yes      | —       | —           |

## Returns

`DetectEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 311.
