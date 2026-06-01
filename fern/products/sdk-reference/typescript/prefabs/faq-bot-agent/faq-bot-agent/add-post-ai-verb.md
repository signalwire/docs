---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/add-post-ai-verb"
title: "addPostAiVerb"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.addPostAiVerb"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addPostAiVerb`

Add a SWML verb to execute after the AI verb (phase 5).

## Signature

```typescript
addPostAiVerb(verbName: string, config: Record<string, unknown>): this
```

## Parameters

| Name       | Type                      | Required | Default | Description                |
| ---------- | ------------------------- | -------- | ------- | -------------------------- |
| `verbName` | `string`                  | yes      | —       | Name of the SWML verb.     |
| `config`   | `Record<string, unknown>` | yes      | —       | Verb configuration object. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1515.
