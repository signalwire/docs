---
slug: "/reference/typescript/prompt-manager/prompt-manager/add-section"
title: "addSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PromptManager.PromptManager.addSection"
  parent: "PromptManager.PromptManager"
  module: "PromptManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts"
---
# `addSection`

Adds a POM section to the prompt, initializing the PomBuilder if needed.

## Signature

```typescript
addSection(title: string, opts?: { ...5 fields }): void
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

`void`

## Source

[`src/PromptManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts)

Line 48.
