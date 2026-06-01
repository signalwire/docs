---
slug: "/reference/typescript/swml-service/swml-service/validate-basic-auth"
title: "validateBasicAuth"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLService.SWMLService.validateBasicAuth"
  parent: "SWMLService.SWMLService"
  module: "SWMLService"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `validateBasicAuth`

Validate provided basic-auth credentials against the configured ones
using a constant-time comparison. (Python parity:
`AuthMixin.validate_basic_auth(username, password)`.)

## Signature

```typescript
validateBasicAuth(
  username: string,
  password: string
): boolean | Promise<boolean>
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `username` | `string` | yes      | —       | —           |
| `password` | `string` | yes      | —       | —           |

## Returns

`boolean | Promise<boolean>`

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 241.
