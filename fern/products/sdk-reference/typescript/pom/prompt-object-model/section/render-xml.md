---
slug: "/reference/typescript/pom/prompt-object-model/section/render-xml"
title: "renderXml"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.Section.renderXml"
  parent: "POM.PromptObjectModel.Section"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `renderXml`

Render this section and all its subsections as XML.

## Signature

```typescript
renderXml(indent: number = 0, sectionNumber: number[] | null = null): string
```

## Parameters

| Name            | Type               | Required | Default | Description                                       |
| --------------- | ------------------ | -------- | ------- | ------------------------------------------------- |
| `indent`        | `number`           | yes      | `0`     | The indentation level to start with (default 0).  |
| `sectionNumber` | `number[] \| null` | yes      | `null`  | The current section number for numbered sections. |

## Returns

`string`

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 194.
