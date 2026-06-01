---
slug: "/reference/typescript/pom-builder/pom-section-data"
title: "PomSectionData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "PomBuilder.PomSectionData"
  parent: "PomBuilder"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `PomSectionData`

Serializable representation of a POM section, used for JSON export.

## Signature

```typescript
interface PomSectionData
```

## Properties

| Name              | Type               | Required | Default | Description                                            |
| ----------------- | ------------------ | -------- | ------- | ------------------------------------------------------ |
| `body`            | `string`           | no       | —       | Section body paragraph text.                           |
| `bullets`         | `string[]`         | no       | —       | List of bullet point strings.                          |
| `numbered`        | `boolean`          | no       | —       | Whether subsections are numbered.                      |
| `numberedBullets` | `boolean`          | no       | —       | Whether bullet points are rendered as a numbered list. |
| `subsections`     | `PomSectionData[]` | no       | —       | Nested child sections.                                 |
| `title`           | `string`           | no       | —       | Section heading text.                                  |

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 12.
