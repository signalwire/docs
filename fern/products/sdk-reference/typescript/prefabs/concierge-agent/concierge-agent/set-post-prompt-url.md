---
slug: "/reference/typescript/prefabs/concierge-agent/concierge-agent/set-post-prompt-url"
title: "setPostPromptUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ConciergeAgent.ConciergeAgent.setPostPromptUrl"
  parent: "prefabs.ConciergeAgent.ConciergeAgent"
  module: "prefabs.ConciergeAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setPostPromptUrl`

Override the default post-prompt webhook URL with a custom one.

## Signature

```typescript
setPostPromptUrl(url: string): this
```

## Parameters

| Name  | Type     | Required | Default | Description                 |
| ----- | -------- | -------- | ------- | --------------------------- |
| `url` | `string` | yes      | —       | The custom post-prompt URL. |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1828.
