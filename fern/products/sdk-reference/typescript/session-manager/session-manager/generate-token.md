---
slug: "/reference/typescript/session-manager/session-manager/generate-token"
title: "generateToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.generateToken"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `generateToken`

Generate a signed, base64url-encoded token binding a function name to a call ID.

## Signature

```typescript
generateToken(functionName: string, callId: string): string
```

## Parameters

| Name           | Type     | Required | Default | Description                      |
| -------------- | -------- | -------- | ------- | -------------------------------- |
| `functionName` | `string` | yes      | —       | The SWAIG function name to bind. |
| `callId`       | `string` | yes      | —       | The call ID to bind.             |

## Returns

`string` — A base64url-encoded token string.

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 73.
