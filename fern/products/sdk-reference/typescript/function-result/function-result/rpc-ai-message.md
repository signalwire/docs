---
slug: "/reference/typescript/function-result/function-result/rpc-ai-message"
title: "rpcAiMessage"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.rpcAiMessage"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `rpcAiMessage`

Send an AI message to another call via RPC.

## Signature

```typescript
rpcAiMessage(callId: string, messageText: string, role: string = 'system'): this
```

## Parameters

| Name          | Type     | Required | Default    | Description                              |
| ------------- | -------- | -------- | ---------- | ---------------------------------------- |
| `callId`      | `string` | yes      | —          | The target call ID.                      |
| `messageText` | `string` | yes      | —          | The message text to inject.              |
| `role`        | `string` | yes      | `'system'` | The message role (defaults to "system"). |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 752.
