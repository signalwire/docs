---
slug: "/reference/typescript/relay/relay-event/refer-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.ReferEvent.constructor"
  parent: "relay.RelayEvent.ReferEvent"
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
  state: string,
  sipReferTo: string,
  sipReferResponseCode: string,
  sipNotifyResponseCode: string
): ReferEvent
```

## Parameters

| Name                    | Type                  | Required | Default | Description |
| ----------------------- | --------------------- | -------- | ------- | ----------- |
| `eventType`             | `string`              | yes      | —       | —           |
| `params`                | `Record<string, any>` | yes      | —       | —           |
| `callId`                | `string`              | yes      | —       | —           |
| `timestamp`             | `number`              | yes      | —       | —           |
| `state`                 | `string`              | yes      | —       | —           |
| `sipReferTo`            | `string`              | yes      | —       | —           |
| `sipReferResponseCode`  | `string`              | yes      | —       | —           |
| `sipNotifyResponseCode` | `string`              | yes      | —       | —           |

## Returns

`ReferEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 501.
