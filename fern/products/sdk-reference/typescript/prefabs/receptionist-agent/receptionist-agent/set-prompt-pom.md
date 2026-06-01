---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/set-prompt-pom"
title: "setPromptPom"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.setPromptPom"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setPromptPom`

Set the prompt as a POM (Prompt Object Model) dictionary.

Replaces the current POM sections with the provided structured data.
Each entry should have `title`, and optionally `body`, `bullets`,
`numbered`, `numberedBullets`, and `subsections`.

## Signature

```typescript
setPromptPom(pom: Record<string, unknown>[]): this
```

## Parameters

| Name  | Type                        | Required | Default | Description                        |
| ----- | --------------------------- | -------- | ------- | ---------------------------------- |
| `pom` | `Record<string, unknown>[]` | yes      | —       | Array of POM section dictionaries. |

## Returns

`this` — This agent instance for chaining.

## Throws

- Error if POM mode is not enabled (`usePom: false`).

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 576.
