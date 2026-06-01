---
slug: "/reference/typescript/pom-builder/pom-builder/find-section"
title: "findSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomBuilder.findSection"
  parent: "PomBuilder.PomBuilder"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `findSection`

Recursively searches all sections and subsections for one matching the given title.

## Signature

```typescript
findSection(title: string): PomSection | undefined
```

## Parameters

| Name    | Type     | Required | Default | Description                        |
| ------- | -------- | -------- | ------- | ---------------------------------- |
| `title` | `string` | yes      | —       | The section heading to search for. |

## Returns

`PomSection | undefined` — The matching PomSection, or undefined if not found.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 355.
