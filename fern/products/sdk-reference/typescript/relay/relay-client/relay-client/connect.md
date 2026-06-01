---
slug: "/reference/typescript/relay/relay-client/relay-client/connect"
title: "connect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient.connect"
  parent: "relay.RelayClient.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `connect`

Connect to RELAY and authenticate.

Opens the WebSocket, runs the JSON-RPC `signalwire.connect` handshake,
and starts the client-side ping loop. Safe to call again after a
`disconnect()` to reconnect; the process-wide concurrent-connection limit
is enforced here.

## Signature

```typescript
connect(): Promise<void>
```

## Returns

`Promise<void>` — Resolves once the client is connected and authenticated.

## Throws

- When the process-wide connection limit is reached, authentication fails, or the WebSocket cannot be opened.

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 340.
