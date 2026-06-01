---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/extract-sip-username"
title: "extractSipUsername"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.extractSipUsername"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `extractSipUsername`

Extract the SIP username from a request body's call.to field.

**Modifiers:** `static`

## Signature

```typescript
extractSipUsername(requestBody: Record<string, unknown>): string | null
```

## Parameters

| Name          | Type                      | Required | Default | Description                                          |
| ------------- | ------------------------- | -------- | ------- | ---------------------------------------------------- |
| `requestBody` | `Record<string, unknown>` | yes      | —       | The parsed request body containing call information. |

## Returns

`string | null` — The extracted SIP username, or null if not found.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1121.
