---
slug: "/reference/typescript/context-builder/step/set-skip-to-next-step"
title: "setSkipToNextStep"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.setSkipToNextStep"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `setSkipToNextStep`

Sets whether to automatically advance to the next step after this one completes.

## Signature

```typescript
setSkipToNextStep(skip: boolean): this
```

## Parameters

| Name   | Type      | Required | Default | Description                       |
| ------ | --------- | -------- | ------- | --------------------------------- |
| `skip` | `boolean` | yes      | —       | Whether to skip to the next step. |

## Returns

`this` — This step for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 328.
