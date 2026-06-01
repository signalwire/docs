---
slug: "/reference/typescript/relay/types/relay-client-options"
title: "RelayClientOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.RelayClientOptions"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `RelayClientOptions`

Options for constructing a RelayClient.

## Signature

```typescript
interface RelayClientOptions
```

## Properties

| Name             | Type            | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ---------------- | --------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `contexts`       | `string[]`      | no       | —       | Contexts (topics) to receive inbound calls/messages on.                                                                                                                                                                                                                                                                                                                                                                     |
| `host`           | `string`        | no       | —       | RELAY host. Defaults to relay.signalwire.com.                                                                                                                                                                                                                                                                                                                                                                               |
| `jwtToken`       | `string`        | no       | —       | JWT token for authentication. Defaults to env SIGNALWIRE\_JWT\_TOKEN.                                                                                                                                                                                                                                                                                                                                                       |
| `maxActiveCalls` | `number`        | no       | —       | Maximum number of concurrent active calls. Defaults to env RELAY\_MAX\_ACTIVE\_CALLS or 1000.                                                                                                                                                                                                                                                                                                                               |
| `project`        | `string`        | no       | —       | SignalWire project ID. Defaults to env SIGNALWIRE\_PROJECT\_ID.                                                                                                                                                                                                                                                                                                                                                             |
| `scheme`         | `"ws" \| "wss"` | no       | —       | WebSocket scheme — `'wss'` (production, the default) or `'ws'` (loopback fixtures and local audit harnesses). Reads from `SIGNALWIRE_RELAY_SCHEME` if not explicitly set; defaults to `'wss'`. Production deployments should never pass `'ws'` — the value exists solely so the porting-sdk's `audit_relay_handshake.py` can drive the real client against a plain-WS loopback fixture without standing up TLS termination. |
| `token`          | `string`        | no       | —       | SignalWire API token. Defaults to env SIGNALWIRE\_API\_TOKEN.                                                                                                                                                                                                                                                                                                                                                               |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 10.
