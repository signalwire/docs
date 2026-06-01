---
slug: "/reference/typescript/relay/call/call/queue-leave"
title: "queueLeave"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.queueLeave"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `queueLeave`

Remove the call from a queue.

## Signature

```typescript
queueLeave(
  queueName: string,
  options: { ...3 fields } = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name                | Type                                                           | Required | Default | Description                                            |
| ------------------- | -------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------ |
| `queueName`         | `string`                                                       | yes      | —       | Name of the queue to leave.                            |
| `options`           | `{ controlId?: string; queueId?: string; statusUrl?: string }` | yes      | `{}`    | Queue-exit behaviour.                                  |
| `options.controlId` | `string`                                                       | no       | —       | Explicit control ID. Auto-generated when omitted.      |
| `options.queueId`   | `string`                                                       | no       | —       | Queue ID override (when multiple queues share a name). |
| `options.statusUrl` | `string`                                                       | no       | —       | Webhook URL for queue status events.                   |

## Returns

`Promise<Record<string, unknown>>` — The platform's queue.leave response.

## Throws

- When the queue.leave command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1258.
