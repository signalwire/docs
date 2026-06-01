---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/prompt-add-to-section"
title: "promptAddToSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.promptAddToSection"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `promptAddToSection`

Append content to an existing prompt section.

## Signature

```typescript
promptAddToSection(title: string, opts?: { ...3 fields }): this
```

## Parameters

| Name           | Type                                                     | Required | Default | Description                                                      |
| -------------- | -------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `title`        | `string`                                                 | yes      | —       | Title of the section to append to.                               |
| `opts`         | `{ body?: string; bullet?: string; bullets?: string[] }` | no       | —       | Content to add: body text, a single bullet, or multiple bullets. |
| `opts.body`    | `string`                                                 | no       | —       | —                                                                |
| `opts.bullet`  | `string`                                                 | no       | —       | —                                                                |
| `opts.bullets` | `string[]`                                               | no       | —       | —                                                                |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 486.
