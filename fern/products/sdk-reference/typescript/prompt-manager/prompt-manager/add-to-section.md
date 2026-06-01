---
slug: "/reference/typescript/prompt-manager/prompt-manager/add-to-section"
title: "addToSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PromptManager.PromptManager.addToSection"
  parent: "PromptManager.PromptManager"
  module: "PromptManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts"
---
# `addToSection`

Appends body text or bullets to an existing POM section, creating it if absent.

## Signature

```typescript
addToSection(title: string, opts?: { ...3 fields }): void
```

## Parameters

| Name           | Type                                                     | Required | Default | Description                       |
| -------------- | -------------------------------------------------------- | -------- | ------- | --------------------------------- |
| `title`        | `string`                                                 | yes      | —       | The section heading to append to. |
| `opts`         | `{ body?: string; bullet?: string; bullets?: string[] }` | no       | —       | Body text and/or bullets to add.  |
| `opts.body`    | `string`                                                 | no       | —       | —                                 |
| `opts.bullet`  | `string`                                                 | no       | —       | —                                 |
| `opts.bullets` | `string[]`                                               | no       | —       | —                                 |

## Returns

`void`

## Source

[`src/PromptManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PromptManager.ts)

Line 70.
