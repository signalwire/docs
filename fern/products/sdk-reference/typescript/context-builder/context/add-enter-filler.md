---
slug: "/reference/typescript/context-builder/context/add-enter-filler"
title: "addEnterFiller"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "ContextBuilder.Context.addEnterFiller"
  parent: "ContextBuilder.Context"
  module: "ContextBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts"
---
# `addEnterFiller`

Adds enter filler phrases for a specific language.

## Signature

```typescript
addEnterFiller(languageCode: string, fillers: string[]): this
```

## Parameters

| Name           | Type       | Required | Default | Description                        |
| -------------- | ---------- | -------- | ------- | ---------------------------------- |
| `languageCode` | `string`   | yes      | —       | The language code (e.g., "en-US"). |
| `fillers`      | `string[]` | yes      | —       | Array of filler phrases.           |

## Returns

`this` — This context for chaining.

## Source

[`src/ContextBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/ContextBuilder.ts)

Line 789.
