---
slug: "/reference/typescript/session-manager/session-manager/end-session"
title: "endSession"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.endSession"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `endSession`

Legacy method retained for API compatibility with the Python SDK.
Does nothing and returns `true`.

## Signature

```typescript
endSession(_callId: string): boolean
```

## Parameters

| Name      | Type     | Required | Default | Description                           |
| --------- | -------- | -------- | ------- | ------------------------------------- |
| `_callId` | `string` | yes      | —       | The call/session identifier (unused). |

## Returns

`boolean` — Always `true`.

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 299.
