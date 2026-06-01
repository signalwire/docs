---
slug: "/reference/typescript/relay/call/call/queue-enter"
title: "queueEnter"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.queueEnter"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `queueEnter`

Place the call into a named queue.

## Signature

```typescript
queueEnter(
  queueName: string,
  options: { ...2 fields } = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name                | Type                                         | Required | Default | Description                                       |
| ------------------- | -------------------------------------------- | -------- | ------- | ------------------------------------------------- |
| `queueName`         | `string`                                     | yes      | —       | Name of the queue to enter.                       |
| `options`           | `{ controlId?: string; statusUrl?: string }` | yes      | `{}`    | Queue-entry behaviour.                            |
| `options.controlId` | `string`                                     | no       | —       | Explicit control ID. Auto-generated when omitted. |
| `options.statusUrl` | `string`                                     | no       | —       | Webhook URL for queue status events.              |

## Returns

`Promise<Record<string, unknown>>` — The platform's queue.enter response.

## Throws

- When the queue.enter command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 1234.
