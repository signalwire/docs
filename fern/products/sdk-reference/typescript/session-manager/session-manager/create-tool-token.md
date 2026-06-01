---
slug: "/reference/typescript/session-manager/session-manager/create-tool-token"
title: "createToolToken"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.createToolToken"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `createToolToken`

Alias for [generateToken](/reference/typescript/session-manager/session-manager/generate-token).

## Signature

```typescript
createToolToken(functionName: string, callId: string): string
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

Line 92.
