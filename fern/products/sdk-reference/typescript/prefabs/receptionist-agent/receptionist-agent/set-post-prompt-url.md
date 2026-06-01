---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/set-post-prompt-url"
title: "setPostPromptUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.setPostPromptUrl"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
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
