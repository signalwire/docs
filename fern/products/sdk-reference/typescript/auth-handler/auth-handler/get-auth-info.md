---
slug: "/reference/typescript/auth-handler/auth-handler/get-auth-info"
title: "getAuthInfo"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AuthHandler.AuthHandler.getAuthInfo"
  parent: "AuthHandler.AuthHandler"
  module: "AuthHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts"
---
# `getAuthInfo`

Get information about configured authentication methods.

Returns structured metadata describing each enabled auth method,
including usernames, header names, and usage hints.

## Signature

```typescript
getAuthInfo(): { apiKey?: { enabled: true; header: string; hint: string }; basic?: { enabled: true; username: string }; bearer?: { enabled: true; hint: string } }
```

## Returns

`{ apiKey?: { enabled: true; header: string; hint: string }; basic?: { enabled: true; username: string }; bearer?: { enabled: true; hint: string } }` — An object describing the enabled auth methods and their configuration.

## Source

[`src/AuthHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts)

Line 206.
