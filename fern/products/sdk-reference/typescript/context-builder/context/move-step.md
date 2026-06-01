---
slug: "/reference/typescript/context-builder/context/move-step"
title: "moveStep"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.moveStep"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `moveStep`

Moves a step to a new position in the step order.

## Signature

```typescript
moveStep(name: string, position: number): this
```

## Parameters

| Name       | Type     | Required | Default | Description                        |
| ---------- | -------- | -------- | ------- | ---------------------------------- |
| `name`     | `string` | yes      | —       | The step name to move.             |
| `position` | `number` | yes      | —       | The zero-based index to insert at. |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 583.
