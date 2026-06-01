---
slug: "/reference/typescript/pom-builder/pom-builder/add-subsection"
title: "addSubsection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomBuilder.addSubsection"
  parent: "PomBuilder.PomBuilder"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `addSubsection`

Adds a subsection under an existing parent section, creating the parent if absent.

## Signature

```typescript
addSubsection(parentTitle: string, title: string, opts?: { ...2 fields }): this
```

## Parameters

| Name           | Type                                    | Required | Default | Description                                        |
| -------------- | --------------------------------------- | -------- | ------- | -------------------------------------------------- |
| `parentTitle`  | `string`                                | yes      | —       | The heading of the parent section.                 |
| `title`        | `string`                                | yes      | —       | The subsection heading.                            |
| `opts`         | `{ body?: string; bullets?: string[] }` | no       | —       | Optional body text and bullets for the subsection. |
| `opts.body`    | `string`                                | no       | —       | —                                                  |
| `opts.bullets` | `string[]`                              | no       | —       | —                                                  |

## Returns

`this` — This builder for chaining.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 316.
