---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/set-post-prompt-llm-params"
title: "setPostPromptLlmParams"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.setPostPromptLlmParams"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setPostPromptLlmParams`

Merge LLM-specific parameters into the post-prompt configuration.

## Signature

```typescript
setPostPromptLlmParams(params: Record<string, unknown>): this
```

## Parameters

| Name     | Type                      | Required | Default | Description                        |
| -------- | ------------------------- | -------- | ------- | ---------------------------------- |
| `params` | `Record<string, unknown>` | yes      | —       | Key-value LLM parameters to merge. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1000.
