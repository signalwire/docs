---
slug: "/reference/typescript/context-builder/context/add-system-bullets"
title: "addSystemBullets"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.addSystemBullets"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addSystemBullets`

Adds a POM section with bullets to the system prompt, mutually exclusive with raw system prompt text.

## Signature

```typescript
addSystemBullets(title: string, bullets: string[]): this
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

Line 722.
