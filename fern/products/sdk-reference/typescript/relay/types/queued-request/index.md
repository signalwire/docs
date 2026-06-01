---
slug: "/reference/typescript/relay/types/queued-request"
title: "QueuedRequest"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.QueuedRequest"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `QueuedRequest`

Queued request waiting for reconnection.

## Signature

```typescript
interface QueuedRequest
```

## Properties

| Name      | Type                                       | Required | Default | Description |
| --------- | ------------------------------------------ | -------- | ------- | ----------- |
| `method`  | `string`                                   | yes      | —       | —           |
| `params`  | `Record<string, unknown>`                  | yes      | —       | —           |
| `reject`  | `(reason?: unknown) => void`               | yes      | —       | —           |
| `resolve` | `(value: Record<string, unknown>) => void` | yes      | —       | —           |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 155.
