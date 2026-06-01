---
slug: "/reference/typescript/pom/prompt-object-model/section/render-markdown"
title: "renderMarkdown"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.Section.renderMarkdown"
  parent: "POM.PromptObjectModel.Section"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `renderMarkdown`

Render this section and all its subsections as markdown.

## Signature

```typescript
renderMarkdown(level: number = 2, sectionNumber: number[] | null = null): string
```

## Parameters

| Name            | Type               | Required | Default | Description                                         |
| --------------- | ------------------ | -------- | ------- | --------------------------------------------------- |
| `level`         | `number`           | yes      | `2`     | The heading level to start with (default 2 = `##`). |
| `sectionNumber` | `number[] \| null` | yes      | `null`  | The current section number for numbered sections.   |

## Returns

`string`

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 147.
