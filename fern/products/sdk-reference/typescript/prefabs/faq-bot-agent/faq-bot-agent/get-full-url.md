---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/get-full-url"
title: "getFullUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.getFullUrl"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `getFullUrl`

Get the full external URL of this agent, using the proxy base URL if available.

## Signature

```typescript
getFullUrl(includeAuth: boolean = false): string
```

## Parameters

| Name          | Type      | Required | Default | Description                                                             |
| ------------- | --------- | -------- | ------- | ----------------------------------------------------------------------- |
| `includeAuth` | `boolean` | yes      | `false` | Whether to embed basic-auth credentials in the URL (defaults to false). |

## Returns

`string` — The fully-qualified URL string.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1838.
