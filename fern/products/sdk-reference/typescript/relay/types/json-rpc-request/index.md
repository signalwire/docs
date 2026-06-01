---
slug: "/reference/typescript/relay/types/json-rpc-request"
title: "JsonRpcRequest"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.JsonRpcRequest"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `JsonRpcRequest`

JSON-RPC 2.0 request.

## Signature

```typescript
interface JsonRpcRequest
```

## Properties

| Name      | Type                      | Required | Default | Description |
| --------- | ------------------------- | -------- | ------- | ----------- |
| `id`      | `string`                  | yes      | —       | —           |
| `jsonrpc` | `"2.0"`                   | yes      | —       | —           |
| `method`  | `string`                  | yes      | —       | —           |
| `params`  | `Record<string, unknown>` | yes      | —       | —           |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 37.
