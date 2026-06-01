---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/prompt-add-section"
title: "promptAddSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.promptAddSection"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `promptAddSection`

Add a new section to the prompt with optional body, bullets, and subsections.

## Signature

```typescript
promptAddSection(title: string, opts?: { ...5 fields }): this
```

## Parameters

| Name                   | Type                                                                                                                                                         | Required | Default | Description                                                                   |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------------------------------------------------------------------------- |
| `title`                | `string`                                                                                                                                                     | yes      | —       | Section heading.                                                              |
| `opts`                 | `{ body?: string; bullets?: string[]; numbered?: boolean; numberedBullets?: boolean; subsections?: { body?: string; bullets?: string[]; title: string }[] }` | no       | —       | Optional section content including body text, bullet points, and subsections. |
| `opts.body`            | `string`                                                                                                                                                     | no       | —       | —                                                                             |
| `opts.bullets`         | `string[]`                                                                                                                                                   | no       | —       | —                                                                             |
| `opts.numbered`        | `boolean`                                                                                                                                                    | no       | —       | —                                                                             |
| `opts.numberedBullets` | `boolean`                                                                                                                                                    | no       | —       | —                                                                             |
| `opts.subsections`     | `{ body?: string; bullets?: string[]; title: string }[]`                                                                                                     | no       | —       | —                                                                             |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 466.
