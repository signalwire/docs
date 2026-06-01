---
slug: "/reference/typescript/function-result/function-result/execute-rpc"
title: "executeRpc"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.executeRpc"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `executeRpc`

Execute a SignalWire RPC method via SWML.

## Signature

```typescript
executeRpc(opts: { ...4 fields }): this
```

## Parameters

| Name          | Type                                                                                     | Required | Default | Description                                                      |
| ------------- | ---------------------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `opts`        | `{ callId?: string; method: string; nodeId?: string; params?: Record<string, unknown> }` | yes      | —       | RPC parameters including method name and optional call/node IDs. |
| `opts.callId` | `string`                                                                                 | no       | —       | —                                                                |
| `opts.method` | `string`                                                                                 | yes      | —       | —                                                                |
| `opts.nodeId` | `string`                                                                                 | no       | —       | —                                                                |
| `opts.params` | `Record<string, unknown>`                                                                | no       | —       | —                                                                |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 708.
