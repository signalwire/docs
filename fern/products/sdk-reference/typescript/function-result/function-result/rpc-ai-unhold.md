---
slug: "/reference/typescript/function-result/function-result/rpc-ai-unhold"
title: "rpcAiUnhold"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.rpcAiUnhold"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `rpcAiUnhold`

Unhold a call that was previously placed on hold via RPC.

## Signature

```typescript
rpcAiUnhold(callId: string): this
```

## Parameters

| Name     | Type     | Required | Default | Description                   |
| -------- | -------- | -------- | ------- | ----------------------------- |
| `callId` | `string` | yes      | —       | The target call ID to unhold. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 765.
