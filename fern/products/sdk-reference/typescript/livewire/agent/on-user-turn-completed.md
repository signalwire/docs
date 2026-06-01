---
slug: "/reference/typescript/livewire/agent/on-user-turn-completed"
title: "onUserTurnCompleted"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.Agent.onUserTurnCompleted"
  parent: "livewire.Agent"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `onUserTurnCompleted`

Lifecycle hook called when the user finishes speaking.
Override in a subclass to inspect / mutate the turn context before the
LLM responds — the default is a no-op.

## Signature

```typescript
onUserTurnCompleted(_turnCtx?: unknown, _newMessage?: unknown): Promise<void>
```

## Parameters

| Name          | Type      | Required | Default | Description                                            |
| ------------- | --------- | -------- | ------- | ------------------------------------------------------ |
| `_turnCtx`    | `unknown` | no       | —       | Turn context (LiveKit shape; passed through opaquely). |
| `_newMessage` | `unknown` | no       | —       | Newly-captured user message.                           |

## Returns

`Promise<void>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 287.
