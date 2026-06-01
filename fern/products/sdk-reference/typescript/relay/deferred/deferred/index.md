---
slug: "/reference/typescript/relay/deferred/deferred"
title: "Deferred"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.Deferred.Deferred"
  parent: "relay.Deferred"
  module: "relay.Deferred"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Deferred.ts"
---
# `Deferred`

A promise with externalised `resolve`/`reject` and a `settled` flag,
used by the RELAY client to bridge server-push events back to in-flight
JSON-RPC request callers.

## Signature

```typescript
interface Deferred<T>
```

## Type Parameters

| Name | Type | Required | Default | Description |
| ---- | ---- | -------- | ------- | ----------- |
| `T`  | —    | yes      | —       | —           |

## Properties

| Name      | Type                                   | Required | Default | Description                                                 |
| --------- | -------------------------------------- | -------- | ------- | ----------------------------------------------------------- |
| `promise` | `Promise<T>`                           | yes      | —       | The wrapped promise.                                        |
| `reject`  | `(reason?: unknown) => void`           | yes      | —       | Reject the promise idempotently (later calls are ignored).  |
| `resolve` | `(value: T \| PromiseLike<T>) => void` | yes      | —       | Resolve the promise idempotently (later calls are ignored). |
| `settled` | `boolean`                              | yes      | —       | True once either `resolve` or `reject` has been called.     |

## Source

[`src/relay/Deferred.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Deferred.ts)

Line 12.
