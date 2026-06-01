---
slug: "/reference/typescript/relay/deferred/with-timeout"
title: "withTimeout"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "relay.Deferred.withTimeout"
  parent: "relay.Deferred"
  module: "relay.Deferred"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Deferred.ts"
---
# `withTimeout`

Race a promise against a timeout.

## Signature

```typescript
withTimeout<T>(
  promise: Promise<T>,
  ms: number,
  label: string = 'Operation'
): Promise<T>
```

## Type Parameters

| Name | Type | Required | Default | Description                                 |
| ---- | ---- | -------- | ------- | ------------------------------------------- |
| `T`  | —    | yes      | —       | Resolution value type of the input promise. |

## Parameters

| Name      | Type         | Required | Default       | Description                                                         |
| --------- | ------------ | -------- | ------------- | ------------------------------------------------------------------- |
| `promise` | `Promise<T>` | yes      | —             | Promise to race against the timeout.                                |
| `ms`      | `number`     | yes      | —             | Timeout in milliseconds.                                            |
| `label`   | `string`     | yes      | `'Operation'` | Label used in the timeout error message. Defaults to `"Operation"`. |

## Returns

`Promise<T>` — A new promise that resolves with `promise`'s value if it settles before the timeout, and rejects with a timeout `Error` otherwise.

## Source

[`src/relay/Deferred.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Deferred.ts)

Line 73.
