---
slug: "/reference/typescript/pom/prompt-object-model/prompt-object-model/add-section"
title: "addSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.PromptObjectModel.addSection"
  parent: "POM.PromptObjectModel.PromptObjectModel"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `addSection`

Add a top-level section to the model.

## Signature

```typescript
addSection(title: string | null = null, opts: { ...4 fields } = {}): Section
```

## Parameters

| Name                   | Type                                                                                                             | Required | Default | Description |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `title`                | `string \| null`                                                                                                 | yes      | `null`  | —           |
| `opts`                 | `{ body?: string; bullets?: string \| string[] \| null; numbered?: boolean \| null; numberedBullets?: boolean }` | yes      | `{}`    | —           |
| `opts.body`            | `string`                                                                                                         | no       | —       | —           |
| `opts.bullets`         | `string \| string[] \| null`                                                                                     | no       | —       | —           |
| `opts.numbered`        | `boolean \| null`                                                                                                | no       | —       | —           |
| `opts.numberedBullets` | `boolean`                                                                                                        | no       | —       | —           |

## Returns

`Section`

## Throws

- Error if a section without a title is added after the first section.

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 269.
