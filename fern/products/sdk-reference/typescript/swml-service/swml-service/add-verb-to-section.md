---
slug: "/reference/typescript/swml-service/swml-service/add-verb-to-section"
title: "addVerbToSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.addVerbToSection"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `addVerbToSection`

Add a verb to a specific named section.
Mirrors Python's `add_verb_to_section()`.

## Signature

```typescript
addVerbToSection(sectionName: string, verbName: string, config: unknown): this
```

## Parameters

| Name          | Type      | Required | Default | Description                                    |
| ------------- | --------- | -------- | ------- | ---------------------------------------------- |
| `sectionName` | `string`  | yes      | —       | Target section name (auto-created if missing). |
| `verbName`    | `string`  | yes      | —       | Verb name.                                     |
| `config`      | `unknown` | yes      | —       | Verb configuration.                            |

## Returns

`this` — This service for chaining.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 669.
