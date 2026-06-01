---
slug: "/reference/typescript/relay/relay-client/relay-client/on-call"
title: "onCall"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient.onCall"
  parent: "relay.RelayClient.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `onCall`

Register the inbound call handler.

The handler is invoked once per inbound call, with a fully-formed
[Call](/reference/typescript/relay/call) already in state `"created"`. Answer, reject, or forward
the call from inside the handler.

## Signature

```typescript
onCall(handler: CallHandler): CallHandler
```

## Parameters

| Name      | Type          | Required | Default | Description                                                                                                      |
| --------- | ------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------- |
| `handler` | `CallHandler` | yes      | —       | Callback invoked for each inbound call. May return a promise; errors are logged but do not tear down the client. |

## Returns

`CallHandler` — The same handler, to support decorator-style usage.

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 283.
