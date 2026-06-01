---
slug: "/reference/typescript/rest/namespaces/chat/chat-resource/create-token"
title: "createToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.chat.ChatResource.createToken"
  parent: "rest.namespaces.chat.ChatResource"
  module: "rest.namespaces.chat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/chat.ts"
---
# `createToken`

Generate a short-lived Chat token.

## Signature

```typescript
createToken(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                   |
| ------ | ----- | -------- | ------- | ------------------------------------------------------------- |
| `body` | `any` | yes      | —       | Token payload (e.g. `{ room_name, user_name, permissions }`). |

## Returns

`Promise<any>` — The token record, typically `{ token: "eyJ..." }`.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/chat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/chat.ts)

Line 28.
