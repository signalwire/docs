---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/set-function-includes"
title: "setFunctionIncludes"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.setFunctionIncludes"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setFunctionIncludes`

Replace the entire list of function includes.
Each include must have a `url` and `functions` array.

## Signature

```typescript
setFunctionIncludes(includes: FunctionInclude[]): this
```

## Parameters

| Name       | Type                | Required | Default | Description                        |
| ---------- | ------------------- | -------- | ------- | ---------------------------------- |
| `includes` | `FunctionInclude[]` | yes      | —       | Array of function include objects. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 978.
