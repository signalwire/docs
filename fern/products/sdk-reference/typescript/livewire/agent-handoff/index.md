---
slug: "/reference/typescript/livewire/agent-handoff"
title: "AgentHandoff"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.AgentHandoff"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `AgentHandoff`

Signals a handoff to another agent in multi-agent scenarios.

## Signature

```typescript
class AgentHandoff
```

## Properties

| Name      | Type     | Required | Default | Description                                                |
| --------- | -------- | -------- | ------- | ---------------------------------------------------------- |
| `agent`   | `Agent`  | yes      | —       | Target agent that should take over the conversation.       |
| `returns` | `string` | no       | —       | Optional return value surfaced when the handoff completes. |

## Methods

- [`constructor`](/reference/typescript/livewire/agent-handoff/constructor)

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 741.
