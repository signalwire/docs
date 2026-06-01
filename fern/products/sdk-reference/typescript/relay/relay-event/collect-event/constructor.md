---
slug: "/reference/typescript/relay/relay-event/collect-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.CollectEvent.constructor"
  parent: "relay.RelayEvent.CollectEvent"
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
  controlId: string = '',
  state: string = '',
  result: Record<string, any> = {},
  final_: boolean | undefined = undefined
): CollectEvent
```

## Parameters

| Name        | Type                   | Required | Default     | Description |
| ----------- | ---------------------- | -------- | ----------- | ----------- |
| `eventType` | `string`               | yes      | —           | —           |
| `params`    | `Record<string, any>`  | yes      | —           | —           |
| `callId`    | `string`               | yes      | —           | —           |
| `timestamp` | `number`               | yes      | —           | —           |
| `controlId` | `string`               | yes      | `''`        | —           |
| `state`     | `string`               | yes      | `''`        | —           |
| `result`    | `Record<string, any>`  | yes      | `{}`        | —           |
| `final_`    | `boolean \| undefined` | yes      | `undefined` | —           |

## Returns

`CollectEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 249.
