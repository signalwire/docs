---
slug: "/reference/typescript/context-builder/context/add-bullets"
title: "addBullets"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.addBullets"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addBullets`

Adds a POM section with bullets to the context prompt, mutually exclusive with raw prompt text.

## Signature

```typescript
addBullets(title: string, bullets: string[]): this
```

## Parameters

| Name      | Type       | Required | Default | Description                       |
| --------- | ---------- | -------- | ------- | --------------------------------- |
| `title`   | `string`   | yes      | —       | The section heading.              |
| `bullets` | `string[]` | yes      | —       | The list of bullet point strings. |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 757.
