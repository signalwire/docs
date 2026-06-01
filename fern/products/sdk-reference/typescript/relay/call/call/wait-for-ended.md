---
slug: "/reference/typescript/relay/call/call/wait-for-ended"
title: "waitForEnded"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.waitForEnded"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `waitForEnded`

Wait for the call to reach the `ended` state.

## Signature

```typescript
waitForEnded(timeout?: number): Promise<RelayEvent>
```

## Parameters

| Name      | Type     | Required | Default | Description                       |
| --------- | -------- | -------- | ------- | --------------------------------- |
| `timeout` | `number` | no       | —       | Optional timeout in milliseconds. |

## Returns

`Promise<RelayEvent>` — The terminating `calling.call.state` [RelayEvent](/reference/typescript/relay/relay-event).

## Throws

- When the optional timeout elapses before the call ends.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 254.
