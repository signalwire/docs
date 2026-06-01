---
slug: "/reference/typescript/swml-builder/swml-builder/add-verb"
title: "addVerb"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.addVerb"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts"
---
# `addVerb`

Appends a verb to the main section.
Validates the verb config against the schema when validation is enabled.

## Signature

```typescript
addVerb(verbName: string, config: unknown): void
```

## Parameters

| Name       | Type      | Required | Default | Description                                |
| ---------- | --------- | -------- | ------- | ------------------------------------------ |
| `verbName` | `string`  | yes      | —       | The SWML verb name (e.g., "answer", "ai"). |
| `config`   | `unknown` | yes      | —       | The verb's configuration payload.          |

## Returns

`void`

## Source

[`src/SwmlBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts)

Line 186.
