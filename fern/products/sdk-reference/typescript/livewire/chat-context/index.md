---
slug: "/reference/typescript/livewire/chat-context"
title: "ChatContext"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.ChatContext"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `ChatContext`

Minimal `ChatContext` matching LiveKit's `ChatContext`.

## Signature

```typescript
class ChatContext
```

## Properties

| Name       | Type                       | Required | Default | Description                                      |
| ---------- | -------------------------- | -------- | ------- | ------------------------------------------------ |
| `messages` | `Record<string, string>[]` | yes      | —       | Ordered chat messages, each `{ role, content }`. |

## Methods

- [`append`](/reference/typescript/livewire/chat-context/append) — Append a chat message.
- [`constructor`](/reference/typescript/livewire/chat-context/constructor)

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 1219.
