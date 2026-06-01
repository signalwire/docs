---
slug: "/reference/typescript/context-builder/context/get-step"
title: "getStep"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.getStep"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `getStep`

Returns a step by name.

## Signature

```typescript
getStep(name: string): Step | undefined
```

## Parameters

| Name   | Type     | Required | Default | Description                |
| ------ | -------- | -------- | ------- | -------------------------- |
| `name` | `string` | yes      | —       | The step name to retrieve. |

## Returns

`Step | undefined` — The matching Step, or undefined if not found.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 562.
