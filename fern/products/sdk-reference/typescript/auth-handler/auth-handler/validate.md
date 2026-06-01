---
slug: "/reference/typescript/auth-handler/auth-handler/validate"
title: "validate"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AuthHandler.AuthHandler.validate"
  parent: "AuthHandler.AuthHandler"
  module: "AuthHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts"
---
# `validate`

Validate request headers against configured auth methods (Bearer, API Key, Basic, Custom) in order.

## Signature

```typescript
validate(headers: Record<string, string>): Promise<boolean>
```

## Parameters

| Name      | Type                     | Required | Default | Description                                   |
| --------- | ------------------------ | -------- | ------- | --------------------------------------------- |
| `headers` | `Record<string, string>` | yes      | —       | The request headers as a string-keyed record. |

## Returns

`Promise<boolean>` — True if any configured method accepts the request, or if no methods are configured.

## Source

[`src/AuthHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AuthHandler.ts)

Line 59.
