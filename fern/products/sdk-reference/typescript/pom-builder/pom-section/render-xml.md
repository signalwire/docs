---
slug: "/reference/typescript/pom-builder/pom-section/render-xml"
title: "renderXml"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomSection.renderXml"
  parent: "PomBuilder.PomSection"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `renderXml`

Renders this section and its subsections as an XML string.

## Signature

```typescript
renderXml(indent: number = 0, sectionNumber: number[] = []): string
```

## Parameters

| Name            | Type       | Required | Default | Description                                          |
| --------------- | ---------- | -------- | ------- | ---------------------------------------------------- |
| `indent`        | `number`   | yes      | `0`     | The indentation depth (default 0).                   |
| `sectionNumber` | `number[]` | yes      | `[]`    | Hierarchical numbering prefix for numbered sections. |

## Returns

`string` — The rendered XML string.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 154.
