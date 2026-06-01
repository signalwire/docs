---
slug: "/reference/typescript/relay/call/call/on"
title: "on"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.on"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `on`

Register an event listener for this call.

Multiple listeners for the same event type are supported. Listener errors
are logged but do not disrupt dispatch to other listeners.

## Signature

```typescript
on(eventType: string, handler: EventHandler): void
```

## Parameters

| Name        | Type           | Required | Default | Description                                                                      |
| ----------- | -------------- | -------- | ------- | -------------------------------------------------------------------------------- |
| `eventType` | `string`       | yes      | —       | Fully-qualified event type (e.g. `"calling.call.state"`, `"calling.call.play"`). |
| `handler`   | `EventHandler` | yes      | —       | Callback invoked for each matching event.                                        |

## Returns

`void`

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 153.
