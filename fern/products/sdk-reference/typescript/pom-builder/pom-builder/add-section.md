---
slug: "/reference/typescript/pom-builder/pom-builder/add-section"
title: "addSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomBuilder.addSection"
  parent: "PomBuilder.PomBuilder"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `addSection`

Adds a new top-level section to the prompt.

## Signature

```typescript
addSection(title: string, opts?: { ...5 fields }): this
```

## Parameters

| Name                   | Type                                                                                                                                                         | Required | Default | Description                                                      |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ---------------------------------------------------------------- |
| `title`                | `string`                                                                                                                                                     | yes      | —       | The section heading.                                             |
| `opts`                 | `{ body?: string; bullets?: string[]; numbered?: boolean; numberedBullets?: boolean; subsections?: { body?: string; bullets?: string[]; title: string }[] }` | no       | —       | Optional body, bullets, numbering, and subsection configuration. |
| `opts.body`            | `string`                                                                                                                                                     | no       | —       | —                                                                |
| `opts.bullets`         | `string[]`                                                                                                                                                   | no       | —       | —                                                                |
| `opts.numbered`        | `boolean`                                                                                                                                                    | no       | —       | —                                                                |
| `opts.numberedBullets` | `boolean`                                                                                                                                                    | no       | —       | —                                                                |
| `opts.subsections`     | `{ body?: string; bullets?: string[]; title: string }[]`                                                                                                     | no       | —       | —                                                                |

## Returns

`this` — This builder for chaining.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 255.
