---
slug: "/reference/typescript/pom/prompt-object-model/section/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "POM.PromptObjectModel.Section.constructor"
  parent: "POM.PromptObjectModel.Section"
  module: "POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts"
---
# `constructor`

## Signature

```typescript
constructor(title: string | null = null, opts: { ...4 fields } = {}): Section
```

## Parameters

| Name                   | Type                                                                                                   | Required | Default | Description                                                                                |
| ---------------------- | ------------------------------------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------ |
| `title`                | `string \| null`                                                                                       | yes      | `null`  | Section title (null permitted only on the very first top-level section).                   |
| `opts`                 | `{ body?: string; bullets?: string[] \| null; numbered?: boolean \| null; numberedBullets?: boolean }` | yes      | `{}`    | Keyword-style options matching Python's `body=`/`bullets=`/`numbered=`/`numberedBullets=`. |
| `opts.body`            | `string`                                                                                               | no       | —       | —                                                                                          |
| `opts.bullets`         | `string[] \| null`                                                                                     | no       | —       | —                                                                                          |
| `opts.numbered`        | `boolean \| null`                                                                                      | no       | —       | —                                                                                          |
| `opts.numberedBullets` | `boolean`                                                                                              | no       | —       | —                                                                                          |

## Returns

`Section`

## Source

[`src/POM/PromptObjectModel.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/POM/PromptObjectModel.ts)

Line 52.
