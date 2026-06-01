---
slug: "/reference/typescript/relay/relay-error/relay-error"
title: "RelayError"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.RelayError.RelayError"
  parent: "relay.RelayError"
  module: "relay.RelayError"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayError.ts"
---
# `RelayError`

Custom error class for RELAY protocol errors.

Thrown when the server returns a non-2xx JSON-RPC result code. Mirrors the
Python SDK signature: `RelayError(code, message)`.

## Signature

```typescript
class RelayError extends Error
```

## Inheritance

**Extends:** `Error`

## Properties

| Name   | Type     | Required | Default | Description                                       |
| ------ | -------- | -------- | ------- | ------------------------------------------------- |
| `code` | `number` | yes      | —       | Numeric RELAY result code returned by the server. |

## Methods

- [`constructor`](/reference/typescript/relay/relay-error/relay-error/constructor)

## Source

[`src/relay/RelayError.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayError.ts)

Line 7.
