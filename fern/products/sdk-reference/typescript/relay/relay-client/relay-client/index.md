---
slug: "/reference/typescript/relay/relay-client/relay-client"
title: "RelayClient"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient"
  parent: "relay.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `RelayClient`

Real-time WebSocket client for SignalWire RELAY.

One instance = one persistent JSON-RPC 2.0 WebSocket connection. Lets you
place / receive calls and SMS, play/record media, run TTS, conference calls
together, and subscribe to platform events — all without HTTP polling.

Authentication supports either a project/token pair or a JWT.

## Signature

```typescript
class RelayClient
```

## Examples

**Example 1**

```typescript
import { RelayClient } from '@signalwire/sdk';

const client = new RelayClient({
  project: process.env.SIGNALWIRE_PROJECT_ID!,
  token: process.env.SIGNALWIRE_API_TOKEN!,
  host: 'example.signalwire.com',
  contexts: ['office'],
});

client.onCall(async (call) => {
  await call.answer();
  await call.playTTS({ text: 'Thanks for calling!' });
  await call.hangup();
});

await client.connect();
```

**Example 2**

```typescript
await client.connect();
const call = await client.dial({
  devices: [[{ type: 'phone', to: '+15551234567', from: '+15557654321' }]],
});
await client.sendMessage({ to: '+15551234567', from: '+15557654321', body: 'Hi!' });
```

## See Also

- \- \[Call]\(/reference/typescript/relay/call)
  \- \[Message]\(/reference/typescript/relay/message)

## Properties

| Name            | Type                          | Required | Default | Description                                                                                                                                                                                 |
| --------------- | ----------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `contexts`      | `string[]`                    | yes      | —       | Contexts this client subscribes to for inbound events.                                                                                                                                      |
| `host`          | `string`                      | yes      | —       | Hostname of the RELAY endpoint (e.g. `example.signalwire.com`).                                                                                                                             |
| `jwtToken`      | `string`                      | yes      | —       | JWT used instead of project/token if provided.                                                                                                                                              |
| `project`       | `string`                      | yes      | —       | Project ID used for Basic Auth.                                                                                                                                                             |
| `relayProtocol` | `get relayProtocol(): string` | yes      | —       | The protocol name the server assigned to this client after `connect()`.                                                                                                                     |
| `scheme`        | `"ws" \| "wss"`               | yes      | —       | WebSocket scheme — `'wss'` (production) or `'ws'` (loopback audits). See [RelayClientOptions.scheme](/reference/typescript/relay/types/relay-client-options#scheme) for the full rationale. |
| `token`         | `string`                      | yes      | —       | API token used for Basic Auth.                                                                                                                                                              |

## Methods

- [`[asyncDispose]`](/reference/typescript/relay/relay-client/relay-client/async-dispose) — Async disposable support — equivalent to Python's `__aexit__`.
- [`connect`](/reference/typescript/relay/relay-client/relay-client/connect) — Connect to RELAY and authenticate.
- [`constructor`](/reference/typescript/relay/relay-client/relay-client/constructor) — Create a new RELAY client. Credentials fall back to the `SIGNALWIRE_PROJECT_ID`, `SIGNALWIRE_API_TOKEN`, `SIGNALWIRE_JWT_TOKEN`, and `SIGNALWIRE_SPACE` env vars when omitted.
- [`dial`](/reference/typescript/relay/relay-client/relay-client/dial) — Initiate an outbound call.
- [`disconnect`](/reference/typescript/relay/relay-client/relay-client/disconnect) — Cleanly close the connection.
- [`execute`](/reference/typescript/relay/relay-client/relay-client/execute) — Send a JSON-RPC request and await the response.
- [`notify`](/reference/typescript/relay/relay-client/relay-client/notify) — Fire-and-forget JSON-RPC notification (no response awaited).
- [`onCall`](/reference/typescript/relay/relay-client/relay-client/on-call) — Register the inbound call handler.
- [`onEvent`](/reference/typescript/relay/relay-client/relay-client/on-event) — Register a low-level observer that fires for every inbound `signalwire.event`, regardless of event type or whether a typed Call / Message could be matched.
- [`onMessage`](/reference/typescript/relay/relay-client/relay-client/on-message) — Register the inbound message handler.
- [`receive`](/reference/typescript/relay/relay-client/relay-client/receive) — Subscribe to additional RELAY contexts on an already-connected client.
- [`run`](/reference/typescript/relay/relay-client/relay-client/run) — Blocking entry point — connects and maintains the connection with auto-reconnect, returning only after a clean shutdown (Ctrl+C, SIGTERM, or [disconnect](/reference/typescript/relay/relay-client/relay-client/disconnect) from another scope).
- [`sendMessage`](/reference/typescript/relay/relay-client/relay-client/send-message) — Send an outbound SMS / MMS message.
- [`unreceive`](/reference/typescript/relay/relay-client/relay-client/unreceive) — Unsubscribe from contexts previously passed to [receive](/reference/typescript/relay/relay-client/relay-client/receive) (or the constructor). A no-op when `contexts` is empty.

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 129.
