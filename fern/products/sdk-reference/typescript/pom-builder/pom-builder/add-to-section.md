---
slug: "/reference/typescript/pom-builder/pom-builder/add-to-section"
title: "addToSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomBuilder.addToSection"
  parent: "PomBuilder.PomBuilder"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `addToSection`

Appends body text or bullets to an existing section, creating it if absent.

## Signature

```typescript
addToSection(title: string, opts?: { ...3 fields }): this
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

`this` — This builder for chaining.

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 293.
