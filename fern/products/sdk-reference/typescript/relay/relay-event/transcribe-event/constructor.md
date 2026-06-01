---
slug: "/reference/typescript/relay/relay-event/transcribe-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.TranscribeEvent.constructor"
  parent: "relay.RelayEvent.TranscribeEvent"
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
  url: string,
  recordingId: string,
  duration: number,
  size: number
): TranscribeEvent
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `eventType`   | `string`              | yes      | —       | —           |
| `params`      | `Record<string, any>` | yes      | —       | —           |
| `callId`      | `string`              | yes      | —       | —           |
| `timestamp`   | `number`              | yes      | —       | —           |
| `controlId`   | `string`              | yes      | —       | —           |
| `state`       | `string`              | yes      | —       | —           |
| `url`         | `string`              | yes      | —       | —           |
| `recordingId` | `string`              | yes      | —       | —           |
| `duration`    | `number`              | yes      | —       | —           |
| `size`        | `number`              | yes      | —       | —           |

## Returns

`TranscribeEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 659.
