---
slug: "/reference/typescript/livewire/chat-context/append"
title: "append"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.ChatContext.append"
  parent: "livewire.ChatContext"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `append`

Append a chat message.

## Signature

```typescript
append(options: { ...2 fields }): this
```

## Parameters

| Name           | Type                               | Required | Default | Description                                                                  |
| -------------- | ---------------------------------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `options`      | `{ role?: string; text?: string }` | yes      | —       | Message content.                                                             |
| `options.role` | `string`                           | no       | —       | Speaker role (`"user"`, `"assistant"`, or `"system"`). Defaults to `"user"`. |
| `options.text` | `string`                           | no       | —       | Message text. Defaults to `""`.                                              |

## Returns

`this` — This instance for chaining.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 1232.
