---
slug: "/reference/typescript/relay/relay-client/relay-client/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient.constructor"
  parent: "relay.RelayClient.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `constructor`

Create a new RELAY client.
Credentials fall back to the `SIGNALWIRE_PROJECT_ID`, `SIGNALWIRE_API_TOKEN`,
`SIGNALWIRE_JWT_TOKEN`, and `SIGNALWIRE_SPACE` env vars when omitted.

## Signature

```typescript
constructor(options: RelayClientOptions = {}): RelayClient
```

## Parameters

| Name      | Type                 | Required | Default | Description                    |
| --------- | -------------------- | -------- | ------- | ------------------------------ |
| `options` | `RelayClientOptions` | yes      | `{}`    | Optional client configuration. |

## Returns

`RelayClient`

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 196.
