---
slug: "/reference/typescript/pom/prompt-object-model/section/add-subsection"
title: "addSubsection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.Section.addSubsection"
  parent: "POM.PromptObjectModel.Section"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `addSubsection`

Add a subsection to this section.

## Signature

```typescript
addSubsection(title: string, opts: { ...4 fields } = {}): Section
```

## Parameters

| Name                   | Type                                                                                           | Required | Default | Description                                                             |
| ---------------------- | ---------------------------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------- |
| `title`                | `string`                                                                                       | yes      | —       | The title of the subsection (required — subsections must have a title). |
| `opts`                 | `{ body?: string; bullets?: string[] \| null; numbered?: boolean; numberedBullets?: boolean }` | yes      | `{}`    | Optional body / bullets / numbering for the subsection.                 |
| `opts.body`            | `string`                                                                                       | no       | —       | —                                                                       |
| `opts.bullets`         | `string[] \| null`                                                                             | no       | —       | —                                                                       |
| `opts.numbered`        | `boolean`                                                                                      | no       | —       | —                                                                       |
| `opts.numberedBullets` | `boolean`                                                                                      | no       | —       | —                                                                       |

## Returns

`Section` — The newly created Section.

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 106.
