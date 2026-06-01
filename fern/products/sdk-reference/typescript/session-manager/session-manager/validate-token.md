---
slug: "/reference/typescript/session-manager/session-manager/validate-token"
title: "validateToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.validateToken"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `validateToken`

Validate a token against the expected call ID and function name.

## Signature

```typescript
validateToken(callId: string, functionName: string, token: string): boolean
```

## Parameters

| Name           | Type     | Required | Default | Description                              |
| -------------- | -------- | -------- | ------- | ---------------------------------------- |
| `callId`       | `string` | yes      | —       | The expected call ID.                    |
| `functionName` | `string` | yes      | —       | The expected function name.              |
| `token`        | `string` | yes      | —       | The base64url-encoded token to validate. |

## Returns

`boolean` — True if the token is valid and not expired.

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 103.
