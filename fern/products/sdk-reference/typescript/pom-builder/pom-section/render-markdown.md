---
slug: "/reference/typescript/pom-builder/pom-section/render-markdown"
title: "renderMarkdown"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomSection.renderMarkdown"
  parent: "PomBuilder.PomSection"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `renderMarkdown`

Renders this section and its subsections as a Markdown string.

## Signature

```typescript
renderMarkdown(level: number = 2, sectionNumber: number[] = []): string
```

## Parameters

| Name            | Type       | Required | Default | Description                                          |
| --------------- | ---------- | -------- | ------- | ---------------------------------------------------- |
| `level`         | `number`   | yes      | `2`     | The heading level to start at (default 2 for ##).    |
| `sectionNumber` | `number[]` | yes      | `[]`    | Hierarchical numbering prefix for numbered sections. |

## Returns

`string` — The rendered Markdown string.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 105.
