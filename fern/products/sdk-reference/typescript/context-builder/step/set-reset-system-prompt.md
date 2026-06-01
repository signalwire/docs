---
slug: "/reference/typescript/context-builder/step/set-reset-system-prompt"
title: "setResetSystemPrompt"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.setResetSystemPrompt"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setResetSystemPrompt`

Sets the system prompt to use when resetting context at this step.

## Signature

```typescript
setResetSystemPrompt(systemPrompt: string): this
```

## Parameters

| Name           | Type     | Required | Default | Description                         |
| -------------- | -------- | -------- | ------- | ----------------------------------- |
| `systemPrompt` | `string` | yes      | —       | The replacement system prompt text. |

## Returns

`this` — This step for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 418.
