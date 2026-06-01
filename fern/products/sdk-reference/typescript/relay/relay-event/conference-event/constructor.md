---
slug: "/reference/typescript/relay/relay-event/conference-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.ConferenceEvent.constructor"
  parent: "relay.RelayEvent.ConferenceEvent"
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
  conferenceId: string,
  name: string,
  status: string
): ConferenceEvent
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `eventType`    | `string`              | yes      | —       | —           |
| `params`       | `Record<string, any>` | yes      | —       | —           |
| `callId`       | `string`              | yes      | —       | —           |
| `timestamp`    | `number`              | yes      | —       | —           |
| `conferenceId` | `string`              | yes      | —       | —           |
| `name`         | `string`              | yes      | —       | —           |
| `status`       | `string`              | yes      | —       | —           |

## Returns

`ConferenceEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 724.
