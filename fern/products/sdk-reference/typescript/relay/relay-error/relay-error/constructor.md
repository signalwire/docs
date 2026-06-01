---
slug: "/reference/typescript/relay/relay-error/relay-error/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayError.RelayError.constructor"
  parent: "relay.RelayError.RelayError"
  module: "relay.RelayError"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayError.ts"
---
# `constructor`

## Signature

```typescript
constructor(code: number, message: string): RelayError
```

## Parameters

| Name      | Type     | Required | Default | Description                                    |
| --------- | -------- | -------- | ------- | ---------------------------------------------- |
| `code`    | `number` | yes      | —       | Numeric RELAY result code (e.g. `404`, `503`). |
| `message` | `string` | yes      | —       | Human-readable error message from the server.  |

## Returns

`RelayError`

## Source

[`src/relay/RelayError.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayError.ts)

Line 15.
