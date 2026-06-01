---
slug: "/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/on-request"
title: "onRequest"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.FAQBotAgent.FAQBotAgent.onRequest"
  parent: "prefabs.FAQBotAgent.FAQBotAgent"
  module: "prefabs.FAQBotAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `onRequest`

Lifecycle hook called when SWML is requested. Default delegates to
[onSwmlRequest](/reference/typescript/prefabs/faq-bot-agent/faq-bot-agent/on-swml-request) and returns its result. Subclasses typically
override `onSwmlRequest` rather than this method.

Matches Python `WebMixin.on_request(request_data, callback_path)`. The
cross-language API is the two-arg form; the Hono `context` argument is
a TypeScript-side extra preserved for callers that already have it but
is not part of the audited surface.

## Signature

```typescript
onRequest(
  requestData?: Record<string, unknown> | null,
  callbackPath?: string | null
): void | Record<string, unknown> | Promise<void | Record<string, unknown>>
```

## Parameters

| Name           | Type                              | Required | Default | Description                              |
| -------------- | --------------------------------- | -------- | ------- | ---------------------------------------- |
| `requestData`  | `Record<string, unknown> \| null` | no       | —       | The parsed request body.                 |
| `callbackPath` | `string \| null`                  | no       | —       | Optional callback path from the request. |

## Returns

`void | Record<string, unknown> | Promise<void | Record<string, unknown>>` — Optionally a dict of SWML modifications, or undefined for default rendering.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 1916.
