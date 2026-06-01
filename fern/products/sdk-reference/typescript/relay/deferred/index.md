---
slug: "/reference/typescript/relay/deferred"
title: "Deferred"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "relay.Deferred"
  module: "relay"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Deferred.ts"
---
# `Deferred`

## Signature

```typescript
module Deferred
```

## Functions

- [`createDeferred`](/reference/typescript/relay/deferred/create-deferred) — Create a [Deferred](/reference/typescript/relay/deferred/deferred) with externalised `resolve` / `reject` and a `settled` flag.
- [`withTimeout`](/reference/typescript/relay/deferred/with-timeout) — Race a promise against a timeout.

## Interfaces

- [`Deferred`](/reference/typescript/relay/deferred/deferred) — A promise with externalised `resolve`/`reject` and a `settled` flag, used by the RELAY client to bridge server-push events back to in-flight JSON-RPC request callers.

## Source

[`src/relay/Deferred.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Deferred.ts)

Line 1.
