---
slug: "/reference/typescript/rest/namespaces/calling/calling-namespace/ai-message"
title: "aiMessage"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.calling.CallingNamespace.aiMessage"
  parent: "rest.namespaces.calling.CallingNamespace"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts"
---
# `aiMessage`

Send a message into an active AI agent session.

## Signature

```typescript
aiMessage(callId: string, params: any = {}): Promise<any>
```

## Parameters

| Name     | Type     | Required | Default | Description                           |
| -------- | -------- | -------- | ------- | ------------------------------------- |
| `callId` | `string` | yes      | —       | Target call's ID.                     |
| `params` | `any`    | yes      | `{}`    | AI message payload. Defaults to `{}`. |

## Returns

`Promise<any>` — The platform's response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/calling.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/calling.ts)

Line 412.
