---
slug: "/reference/typescript/session-manager/session-manager/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.constructor"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `constructor`

Create a new SessionManager.

## Signature

```typescript
constructor(tokenExpirySecs: number = 900, secretKey?: string): SessionManager
```

## Parameters

| Name              | Type     | Required | Default | Description                                                |
| ----------------- | -------- | -------- | ------- | ---------------------------------------------------------- |
| `tokenExpirySecs` | `number` | yes      | `900`   | Token validity duration in seconds (default 900).          |
| `secretKey`       | `string` | no       | —       | HMAC signing secret; a random key is generated if omitted. |

## Returns

`SessionManager`

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 52.
