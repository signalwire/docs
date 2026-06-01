---
slug: "/reference/typescript/context-builder/context/set-system-prompt"
title: "setSystemPrompt"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.setSystemPrompt"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setSystemPrompt`

Sets raw system prompt text, mutually exclusive with system POM sections.

## Signature

```typescript
setSystemPrompt(systemPrompt: string): this
```

## Parameters

| Name           | Type     | Required | Default | Description               |
| -------------- | -------- | -------- | ------- | ------------------------- |
| `systemPrompt` | `string` | yes      | —       | The system prompt string. |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 625.
