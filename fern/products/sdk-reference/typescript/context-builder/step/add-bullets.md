---
slug: "/reference/typescript/context-builder/step/add-bullets"
title: "addBullets"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Step.addBullets"
  parent: "ContextBuilder.Step"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addBullets`

Adds a POM section with bullet points, mutually exclusive with raw text.

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

`this` — This step for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 215.
