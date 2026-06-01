---
slug: "/reference/typescript/session-manager/session-manager/delete-session-metadata"
title: "deleteSessionMetadata"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.deleteSessionMetadata"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `deleteSessionMetadata`

Delete all metadata for a session.

## Signature

```typescript
deleteSessionMetadata(sessionId: string): boolean
```

## Parameters

| Name        | Type     | Required | Default | Description             |
| ----------- | -------- | -------- | ------- | ----------------------- |
| `sessionId` | `string` | yes      | —       | The session identifier. |

## Returns

`boolean` — True if the session existed and was deleted.

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 308.
