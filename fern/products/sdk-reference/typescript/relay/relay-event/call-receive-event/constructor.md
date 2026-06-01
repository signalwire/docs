---
slug: "/reference/typescript/relay/relay-event/call-receive-event/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.CallReceiveEvent.constructor"
  parent: "relay.RelayEvent.CallReceiveEvent"
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
  direction: string,
  device: Record<string, any>,
  nodeId: string,
  projectId: string,
  context: string,
  segmentId: string,
  tag: string
): CallReceiveEvent
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `eventType` | `string`              | yes      | —       | —           |
| `params`    | `Record<string, any>` | yes      | —       | —           |
| `callId`    | `string`              | yes      | —       | —           |
| `timestamp` | `number`              | yes      | —       | —           |
| `callState` | `string`              | yes      | —       | —           |
| `direction` | `string`              | yes      | —       | —           |
| `device`    | `Record<string, any>` | yes      | —       | —           |
| `nodeId`    | `string`              | yes      | —       | —           |
| `projectId` | `string`              | yes      | —       | —           |
| `context`   | `string`              | yes      | —       | —           |
| `segmentId` | `string`              | yes      | —       | —           |
| `tag`       | `string`              | yes      | —       | —           |

## Returns

`CallReceiveEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 128.
