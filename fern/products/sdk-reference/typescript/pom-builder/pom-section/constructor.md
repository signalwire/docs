---
slug: "/reference/typescript/pom-builder/pom-section/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "PomBuilder.PomSection.constructor"
  parent: "PomBuilder.PomSection"
  module: "PomBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts"
---
# `constructor`

Creates a new PomSection.

## Signature

```typescript
constructor(opts?: { ...5 fields }): PomSection
```

## Parameters

| Name                   | Type                                                                                                                   | Required | Default | Description                     |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------- |
| `opts`                 | `{ body?: string; bullets?: string[]; numbered?: boolean \| null; numberedBullets?: boolean; title?: string \| null }` | no       | —       | Optional section configuration. |
| `opts.body`            | `string`                                                                                                               | no       | —       | —                               |
| `opts.bullets`         | `string[]`                                                                                                             | no       | —       | —                               |
| `opts.numbered`        | `boolean \| null`                                                                                                      | no       | —       | —                               |
| `opts.numberedBullets` | `boolean`                                                                                                              | no       | —       | —                               |
| `opts.title`           | `string \| null`                                                                                                       | no       | —       | —                               |

## Returns

`PomSection`

## Source

[`src/PomBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/PomBuilder.ts)

Line 46.
