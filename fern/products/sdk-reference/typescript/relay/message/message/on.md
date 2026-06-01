---
slug: "/reference/typescript/relay/message/message/on"
title: "on"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Message.Message.on"
  parent: "relay.Message.Message"
  module: "relay.Message"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Message.ts"
---
# `on`

Register an event listener for state changes on this message.

The handler fires every time the server emits a `messaging.state` event
for this message (multiple listeners are supported). Listener errors are
logged but do not disrupt dispatch.

## Signature

```typescript
on(handler: EventHandler): void
```

## Parameters

| Name      | Type           | Required | Default | Description                                   |
| --------- | -------------- | -------- | ------- | --------------------------------------------- |
| `handler` | `EventHandler` | yes      | —       | Callback invoked for each state-change event. |

## Returns

`void`

## Source

[`src/relay/Message.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Message.ts)

Line 113.
