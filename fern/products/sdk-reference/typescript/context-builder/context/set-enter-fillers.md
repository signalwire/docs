---
slug: "/reference/typescript/context-builder/context/set-enter-fillers"
title: "setEnterFillers"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.setEnterFillers"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setEnterFillers`

Sets filler phrases spoken when entering this context, keyed by language code.

## Signature

```typescript
setEnterFillers(fillers: Record<string, string[]>): this
```

## Parameters

| Name      | Type                       | Required | Default | Description                                        |
| --------- | -------------------------- | -------- | ------- | -------------------------------------------------- |
| `fillers` | `Record<string, string[]>` | yes      | —       | Map of language codes to arrays of filler phrases. |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 768.
