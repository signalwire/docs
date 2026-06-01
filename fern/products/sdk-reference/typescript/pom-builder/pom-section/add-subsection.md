---
slug: "/reference/typescript/pom-builder/pom-section/add-subsection"
title: "addSubsection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomSection.addSubsection"
  parent: "PomBuilder.PomSection"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `addSubsection`

Adds a nested subsection to this section.

## Signature

```typescript
addSubsection(opts: { ...5 fields }): PomSection
```

## Parameters

| Name                   | Type                                                                                                  | Required | Default | Description                                                         |
| ---------------------- | ----------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------- |
| `opts`                 | `{ body?: string; bullets?: string[]; numbered?: boolean; numberedBullets?: boolean; title: string }` | yes      | —       | Subsection configuration including title and optional body/bullets. |
| `opts.body`            | `string`                                                                                              | no       | —       | —                                                                   |
| `opts.bullets`         | `string[]`                                                                                            | no       | —       | —                                                                   |
| `opts.numbered`        | `boolean`                                                                                             | no       | —       | —                                                                   |
| `opts.numberedBullets` | `boolean`                                                                                             | no       | —       | —                                                                   |
| `opts.title`           | `string`                                                                                              | yes      | —       | —                                                                   |

## Returns

`PomSection` — The newly created child PomSection.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 66.
