---
slug: "/reference/typescript/session-manager/debug-token-result"
title: "DebugTokenResult"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SessionManager.DebugTokenResult"
  parent: "SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `DebugTokenResult`

Decoded token debug info matching the Python SDK's nested return structure.

## Signature

```typescript
interface DebugTokenResult
```

## Properties

| Name           | Type                                                                                                                   | Required | Default | Description |
| -------------- | ---------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `components`   | `{ call_id: string; expiry: string; expiry_date: string \| null; function: string; nonce: string; signature: string }` | no       | —       | —           |
| `error`        | `string`                                                                                                               | no       | —       | —           |
| `parts_count`  | `number`                                                                                                               | no       | —       | —           |
| `status`       | `{ current_time: number; expires_in_seconds: number \| null; is_expired: boolean \| null }`                            | no       | —       | —           |
| `token_length` | `number`                                                                                                               | no       | —       | —           |
| `valid_format` | `boolean`                                                                                                              | yes      | —       | —           |

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 12.
