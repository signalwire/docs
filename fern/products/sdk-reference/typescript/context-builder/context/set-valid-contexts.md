---
slug: "/reference/typescript/context-builder/context/set-valid-contexts"
title: "setValidContexts"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.setValidContexts"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setValidContexts`

Sets which contexts the AI may navigate to from this context.

## Signature

```typescript
setValidContexts(contexts: string[]): this
```

## Parameters

| Name       | Type       | Required | Default | Description                    |
| ---------- | ---------- | -------- | ------- | ------------------------------ |
| `contexts` | `string[]` | yes      | —       | List of allowed context names. |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 595.
