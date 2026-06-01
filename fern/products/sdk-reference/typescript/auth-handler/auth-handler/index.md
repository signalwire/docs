---
slug: "/reference/typescript/auth-handler/auth-handler"
title: "AuthHandler"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "AuthHandler.AuthHandler"
  parent: "AuthHandler"
  module: "AuthHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts"
---
# `AuthHandler`

Multi-method authentication handler with timing-safe credential comparison.

## Signature

```typescript
class AuthHandler
```

## Properties

| Name     | Type         | Required | Default | Description                                        |
| -------- | ------------ | -------- | ------- | -------------------------------------------------- |
| `config` | `AuthConfig` | yes      | —       | The authentication configuration for this handler. |

## Methods

- [`constructor`](/reference/typescript/auth-handler/auth-handler/constructor) — Create a new AuthHandler.
- [`expressMiddleware`](/reference/typescript/auth-handler/auth-handler/express-middleware) — Create an Express/Connect-compatible middleware adapter.
- [`getAuthInfo`](/reference/typescript/auth-handler/auth-handler/get-auth-info) — Get information about configured authentication methods.
- [`hasApiKeyAuth`](/reference/typescript/auth-handler/auth-handler/has-api-key-auth) — Check whether API key authentication is configured.
- [`hasBasicAuth`](/reference/typescript/auth-handler/auth-handler/has-basic-auth) — Check whether Basic authentication is configured.
- [`hasBearerAuth`](/reference/typescript/auth-handler/auth-handler/has-bearer-auth) — Check whether Bearer token authentication is configured.
- [`middleware`](/reference/typescript/auth-handler/auth-handler/middleware) — Create a Hono-compatible middleware that rejects unauthorized requests with a 401 response.
- [`validate`](/reference/typescript/auth-handler/auth-handler/validate) — Validate request headers against configured auth methods (Bearer, API Key, Basic, Custom) in order.
- [`verifyApiKey`](/reference/typescript/auth-handler/auth-handler/verify-api-key) — Verify an API key against the configured key.
- [`verifyBasicAuth`](/reference/typescript/auth-handler/auth-handler/verify-basic-auth) — Verify a Basic Auth username/password pair against the configured credentials.
- [`verifyBearerToken`](/reference/typescript/auth-handler/auth-handler/verify-bearer-token) — Verify a Bearer token against the configured token.

## Source

[`src/AuthHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts)

Line 42.
