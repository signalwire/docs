---
slug: "/reference/typescript/livewire/agent/update-tools"
title: "updateTools"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.Agent.updateTools"
  parent: "livewire.Agent"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `updateTools`

Update the agent's tool list mid-session.

Replaces the current tool record with one built from the given array,
keyed by `tool.name`. Useful for dynamic tool injection based on
conversation state.

## Signature

```typescript
updateTools(tools: FunctionTool[]): Promise<void>
```

## Parameters

| Name    | Type             | Required | Default | Description                                                                                                                           |
| ------- | ---------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `tools` | `FunctionTool[]` | yes      | —       | Ordered array of [FunctionTool](/reference/typescript/livewire/function-tool) definitions. Each tool's `name` is used as its map key. |

## Returns

`Promise<void>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 359.
