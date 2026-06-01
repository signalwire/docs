---
slug: "/reference/typescript/session-manager/session-manager/validate-tool-token"
title: "validateToolToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.validateToolToken"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `validateToolToken`

Alias for [validateToken](/reference/typescript/session-manager/session-manager/validate-token) with reordered parameters.

## Signature

```typescript
validateToolToken(functionName: string, token: string, callId: string): boolean
```

## Parameters

| Name           | Type     | Required | Default | Description                              |
| -------------- | -------- | -------- | ------- | ---------------------------------------- |
| `functionName` | `string` | yes      | —       | The expected function name.              |
| `token`        | `string` | yes      | —       | The base64url-encoded token to validate. |
| `callId`       | `string` | yes      | —       | The expected call ID.                    |

## Returns

`boolean` — True if the token is valid and not expired.

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 156.
