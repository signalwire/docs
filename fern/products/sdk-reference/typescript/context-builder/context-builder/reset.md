---
slug: "/reference/typescript/context-builder/context-builder/reset"
title: "reset"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.ContextBuilder.reset"
  parent: "ContextBuilder.ContextBuilder"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `reset`

Removes all contexts, returning the builder to its initial state.
Use this in a dynamic config callback when you need to rebuild
contexts from scratch for a specific request.

## Signature

```typescript
reset(): this
```

## Returns

`this` — This builder for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 979.
