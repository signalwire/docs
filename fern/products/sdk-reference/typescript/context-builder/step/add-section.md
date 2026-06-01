---
slug: "/reference/typescript/context-builder/step/add-section"
title: "addSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.addSection"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addSection`

Adds a POM section with a body, mutually exclusive with raw text.

## Signature

```typescript
addSection(title: string, body: string): this
```

## Parameters

| Name    | Type     | Required | Default | Description            |
| ------- | -------- | -------- | ------- | ---------------------- |
| `title` | `string` | yes      | —       | The section heading.   |
| `body`  | `string` | yes      | —       | The section body text. |

## Returns

`this` — This step for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 203.
