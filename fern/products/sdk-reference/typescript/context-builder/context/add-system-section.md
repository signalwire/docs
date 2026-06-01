---
slug: "/reference/typescript/context-builder/context/add-system-section"
title: "addSystemSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.addSystemSection"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addSystemSection`

Adds a POM section to the system prompt, mutually exclusive with raw system prompt text.

## Signature

```typescript
addSystemSection(title: string, body: string): this
```

## Parameters

| Name    | Type     | Required | Default | Description            |
| ------- | -------- | -------- | ------- | ---------------------- |
| `title` | `string` | yes      | —       | The section heading.   |
| `body`  | `string` | yes      | —       | The section body text. |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 710.
