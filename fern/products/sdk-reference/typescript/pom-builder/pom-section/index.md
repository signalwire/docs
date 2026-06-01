---
slug: "/reference/typescript/pom-builder/pom-section"
title: "PomSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "PomBuilder.PomSection"
  parent: "PomBuilder"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `PomSection`

A single section in a Prompt Object Model, with optional title, body, bullets, and nested subsections.

## Signature

```typescript
class PomSection
```

## Properties

| Name              | Type              | Required | Default | Description                                                                             |
| ----------------- | ----------------- | -------- | ------- | --------------------------------------------------------------------------------------- |
| `body`            | `string`          | yes      | —       | Section body paragraph text.                                                            |
| `bullets`         | `string[]`        | yes      | —       | List of bullet point strings.                                                           |
| `numbered`        | `boolean \| null` | yes      | —       | Whether this section is numbered when rendered; null means inherit from parent context. |
| `numberedBullets` | `boolean`         | yes      | —       | Whether bullet points are rendered as a numbered list.                                  |
| `subsections`     | `PomSection[]`    | yes      | —       | Nested child sections.                                                                  |
| `title`           | `string \| null`  | yes      | —       | Section heading text, or null if untitled.                                              |

## Methods

- [`addSubsection`](/reference/typescript/pom-builder/pom-section/add-subsection) — Adds a nested subsection to this section.
- [`constructor`](/reference/typescript/pom-builder/pom-section/constructor) — Creates a new PomSection.
- [`renderMarkdown`](/reference/typescript/pom-builder/pom-section/render-markdown) — Renders this section and its subsections as a Markdown string.
- [`renderXml`](/reference/typescript/pom-builder/pom-section/render-xml) — Renders this section and its subsections as an XML string.
- [`toDict`](/reference/typescript/pom-builder/pom-section/to-dict) — Serializes this section to a plain data object.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 28.
