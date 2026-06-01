---
slug: "/reference/typescript/auth-handler/auth-config"
title: "AuthConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "AuthHandler.AuthConfig"
  parent: "AuthHandler"
  module: "AuthHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts"
---
# `AuthConfig`

Configuration for one or more authentication methods checked by [AuthHandler](/reference/typescript/auth-handler).

## Signature

```typescript
interface AuthConfig
```

## Properties

| Name                   | Type                                                                                                         | Required | Default | Description                                                                    |
| ---------------------- | ------------------------------------------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------ |
| `allowUnauthenticated` | `boolean`                                                                                                    | no       | —       | When explicitly set to false, deny requests if no auth methods are configured. |
| `apiKey`               | `string`                                                                                                     | no       | —       | API key matched against the X-Api-Key header.                                  |
| `apiKeyHeader`         | `string`                                                                                                     | no       | —       | Custom header name for API key lookup (default: 'X-Api-Key').                  |
| `basicAuth`            | `[string, string]`                                                                                           | no       | —       | Basic auth credentials as a \[username, password] tuple.                       |
| `bearerToken`          | `string`                                                                                                     | no       | —       | Bearer token matched against the Authorization header.                         |
| `customValidator`      | `(request: { headers: Record<string, string>; method: string; url: string }) => boolean \| Promise<boolean>` | no       | —       | Custom validator function; return true to allow the request.                   |

## Source

[`src/AuthHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts)

Line 14.
