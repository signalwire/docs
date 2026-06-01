---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/run"
title: "run"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.run"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `run`

Alias for [serve](/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/serve). Starts the HTTP server.

## Signature

```typescript
run(opts?: { ...2 fields }): Promise<void>
```

## Parameters

| Name        | Type                               | Required | Default | Description                       |
| ----------- | ---------------------------------- | -------- | ------- | --------------------------------- |
| `opts`      | `{ host?: string; port?: number }` | no       | —       | Optional host and port overrides. |
| `opts.host` | `string`                           | no       | —       | —                                 |
| `opts.port` | `number`                           | no       | —       | —                                 |

## Returns

`Promise<void>` — A promise that resolves once the server is running.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 2683.
