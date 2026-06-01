---
slug: "/reference/typescript/prompt-manager/prompt-manager/add-subsection"
title: "addSubsection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PromptManager.PromptManager.addSubsection"
  parent: "PromptManager.PromptManager"
  module: "PromptManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts"
---
# `addSubsection`

Adds a subsection under a parent POM section, creating the parent if absent.

## Signature

```typescript
addSubsection(parentTitle: string, title: string, opts?: { ...2 fields }): void
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

`void`

## Source

[`src/PromptManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts)

Line 87.
