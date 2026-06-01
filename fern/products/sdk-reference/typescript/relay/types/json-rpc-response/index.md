---
slug: "/reference/typescript/relay/types/json-rpc-response"
title: "JsonRpcResponse"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.JsonRpcResponse"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `JsonRpcResponse`

JSON-RPC 2.0 response (success).

## Signature

```typescript
interface JsonRpcResponse
```

## Properties

| Name      | Type                      | Required | Default | Description |
| --------- | ------------------------- | -------- | ------- | ----------- |
| `error`   | `JsonRpcError`            | no       | —       | —           |
| `id`      | `string`                  | yes      | —       | —           |
| `jsonrpc` | `"2.0"`                   | yes      | —       | —           |
| `result`  | `Record<string, unknown>` | no       | —       | —           |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 45.
