---
slug: "/reference/typescript/agent-base/agent-base/create-tool-token"
title: "createToolToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.createToolToken"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `createToolToken`

Mint a per-call SWAIG-function token via the agent's SessionManager.

Mirrors Python reference `core/mixins/state_mixin.py _create_tool_token`:
delegates to `SessionManager.createToolToken` and returns an empty
string on any failure (Python catches all exceptions and returns "").

## Signature

```typescript
createToolToken(toolName: string, callId: string): string
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `toolName` | `string` | yes      | —       | —           |
| `callId`   | `string` | yes      | —       | —           |

## Returns

`string`

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1467.
