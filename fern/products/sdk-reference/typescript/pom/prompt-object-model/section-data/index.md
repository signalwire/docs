---
slug: "/reference/typescript/pom/prompt-object-model/section-data"
title: "SectionData"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.SectionData"
  parent: "POM.PromptObjectModel"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `SectionData`

Plain serializable representation of a section, used for JSON/YAML and `to_dict()` exchange.

## Signature

```typescript
interface SectionData
```

## Properties

| Name              | Type            | Required | Default | Description |
| ----------------- | --------------- | -------- | ------- | ----------- |
| `body`            | `string`        | no       | —       | —           |
| `bullets`         | `string[]`      | no       | —       | —           |
| `numbered`        | `boolean`       | no       | —       | —           |
| `numberedBullets` | `boolean`       | no       | —       | —           |
| `subsections`     | `SectionData[]` | no       | —       | —           |
| `title`           | `string`        | no       | —       | —           |

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 19.
