---
slug: "/reference/typescript/relay/relay-client/relay-client/on-message"
title: "onMessage"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient.onMessage"
  parent: "relay.RelayClient.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `onMessage`

Register the inbound message handler.

The handler is invoked once per inbound SMS/MMS delivered to a subscribed
context, with a [Message](/reference/typescript/relay/message) already in state `"received"`.

## Signature

```typescript
onMessage(handler: MessageHandler): MessageHandler
```

## Parameters

| Name      | Type             | Required | Default | Description                                                                                                         |
| --------- | ---------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------- |
| `handler` | `MessageHandler` | yes      | —       | Callback invoked for each inbound message. May return a promise; errors are logged but do not tear down the client. |

## Returns

`MessageHandler` — The same handler, to support decorator-style usage.

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 298.
