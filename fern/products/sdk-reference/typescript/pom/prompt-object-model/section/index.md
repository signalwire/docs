---
slug: "/reference/typescript/pom/prompt-object-model/section"
title: "Section"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.Section"
  parent: "POM.PromptObjectModel"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `Section`

A section in the Prompt Object Model.

Each section contains a title, optional body text, optional bullet points,
and can have any number of nested subsections.

## Signature

```typescript
class Section
```

## Properties

| Name              | Type              | Required | Default | Description                                                        |
| ----------------- | ----------------- | -------- | ------- | ------------------------------------------------------------------ |
| `body`            | `string`          | yes      | —       | A paragraph of text associated with the section.                   |
| `bullets`         | `string[]`        | yes      | —       | Bullet-pointed items.                                              |
| `numbered`        | `boolean \| null` | yes      | —       | Whether this section should be numbered.                           |
| `numberedBullets` | `boolean`         | yes      | —       | Whether bullets should be numbered instead of using bullet points. |
| `subsections`     | `Section[]`       | yes      | —       | Nested sections with the same structure.                           |
| `title`           | `string \| null`  | yes      | —       | The name of the section.                                           |

## Methods

- [`addBody`](/reference/typescript/pom/prompt-object-model/section/add-body) — Add or replace the body text for this section.
- [`addBullets`](/reference/typescript/pom/prompt-object-model/section/add-bullets) — Add bullet points to this section (extends the existing list).
- [`addSubsection`](/reference/typescript/pom/prompt-object-model/section/add-subsection) — Add a subsection to this section.
- [`constructor`](/reference/typescript/pom/prompt-object-model/section/constructor)
- [`renderMarkdown`](/reference/typescript/pom/prompt-object-model/section/render-markdown) — Render this section and all its subsections as markdown.
- [`renderXml`](/reference/typescript/pom/prompt-object-model/section/render-xml) — Render this section and all its subsections as XML.
- [`toDict`](/reference/typescript/pom/prompt-object-model/section/to-dict) — Convert the section to a dictionary representation.

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 34.
