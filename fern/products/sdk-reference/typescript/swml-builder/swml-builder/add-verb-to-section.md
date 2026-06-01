---
slug: "/reference/typescript/swml-builder/swml-builder/add-verb-to-section"
title: "addVerbToSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.addVerbToSection"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts"
---
# `addVerbToSection`

Appends a verb to a named section, creating the section if it does not exist.

## Signature

```typescript
addVerbToSection(sectionName: string, verbName: string, config: unknown): void
```

## Parameters

| Name          | Type      | Required | Default | Description                       |
| ------------- | --------- | -------- | ------- | --------------------------------- |
| `sectionName` | `string`  | yes      | —       | The target section name.          |
| `verbName`    | `string`  | yes      | —       | The SWML verb name.               |
| `config`      | `unknown` | yes      | —       | The verb's configuration payload. |

## Returns

`void`

## Source

[`src/SwmlBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts)

Line 205.
