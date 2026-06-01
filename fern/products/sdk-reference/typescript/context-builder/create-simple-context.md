---
slug: "/reference/typescript/context-builder/create-simple-context"
title: "createSimpleContext"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "ContextBuilder.createSimpleContext"
  parent: "ContextBuilder"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `createSimpleContext`

Creates a standalone Context instance without a ContextBuilder.

## Signature

```typescript
createSimpleContext(name: string = 'default'): Context
```

## Parameters

| Name   | Type     | Required | Default     | Description                               |
| ------ | -------- | -------- | ----------- | ----------------------------------------- |
| `name` | `string` | yes      | `'default'` | The context name (defaults to "default"). |

## Returns

`Context` — A new Context instance.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 1179.
