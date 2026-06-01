---
slug: "/reference/typescript/livewire/handoff"
title: "handoff"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "livewire.handoff"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `handoff`

Create an [AgentHandoff](/reference/typescript/livewire/agent-handoff) descriptor for multi-agent scenarios.

## Signature

```typescript
handoff(options: { ...2 fields }): AgentHandoff
```

## Parameters

| Name              | Type                                 | Required | Default | Description                                                               |
| ----------------- | ------------------------------------ | -------- | ------- | ------------------------------------------------------------------------- |
| `options`         | `{ agent: Agent; returns?: string }` | yes      | —       | Handoff parameters.                                                       |
| `options.agent`   | `Agent`                              | yes      | —       | Agent to transfer control to.                                             |
| `options.returns` | `string`                             | no       | —       | Optional string returned to the current agent when the handoff completes. |

## Returns

`AgentHandoff` — A handoff descriptor that can be returned from a tool handler.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 729.
