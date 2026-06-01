---
slug: "/reference/typescript/relay/relay-client/relay-client/async-dispose"
title: "[asyncDispose]"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient.[asyncDispose]"
  parent: "relay.RelayClient.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `[asyncDispose]`

Async disposable support — equivalent to Python's `__aexit__`.

Enables usage with `await using`:

```ts
await using client = new RelayClient({ ... });
await client.connect();
// ... automatically disconnects when scope exits
```

For environments without `await using`, use try/finally:

```ts
const client = new RelayClient({ ... });
try { await client.connect(); ... }
finally { await client.disconnect(); }
```

## Signature

```typescript
[asyncDispose](): Promise<void>
```

## Returns

`Promise<void>`

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 266.
