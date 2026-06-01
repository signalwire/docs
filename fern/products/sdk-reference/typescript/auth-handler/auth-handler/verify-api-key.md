---
slug: "/reference/typescript/auth-handler/auth-handler/verify-api-key"
title: "verifyApiKey"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AuthHandler.AuthHandler.verifyApiKey"
  parent: "AuthHandler.AuthHandler"
  module: "AuthHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts"
---
# `verifyApiKey`

Verify an API key against the configured key.

Returns false immediately if API key auth is not configured.
Uses constant-time comparison to prevent timing attacks.

## Signature

```typescript
verifyApiKey(key: string): boolean
```

## Parameters

| Name  | Type     | Required | Default | Description                   |
| ----- | -------- | -------- | ------- | ----------------------------- |
| `key` | `string` | yes      | —       | The API key string to verify. |

## Returns

`boolean` — True if the key matches the configured API key.

## Source

[`src/AuthHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts)

Line 153.
