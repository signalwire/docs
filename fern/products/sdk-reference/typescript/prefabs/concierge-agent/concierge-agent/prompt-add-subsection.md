---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/prompt-add-subsection"
title: "promptAddSubsection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.promptAddSubsection"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `promptAddSubsection`

Add a subsection under an existing prompt section.

## Signature

```typescript
promptAddSubsection(
  parentTitle: string,
  title: string,
  opts?: { ...2 fields }
): this
```

## Parameters

| Name           | Type                                    | Required | Default | Description                                              |
| -------------- | --------------------------------------- | -------- | ------- | -------------------------------------------------------- |
| `parentTitle`  | `string`                                | yes      | —       | Title of the parent section.                             |
| `title`        | `string`                                | yes      | —       | Title of the new subsection.                             |
| `opts`         | `{ body?: string; bullets?: string[] }` | no       | —       | Optional body text and bullet points for the subsection. |
| `opts.body`    | `string`                                | no       | —       | —                                                        |
| `opts.bullets` | `string[]`                              | no       | —       | —                                                        |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 501.
