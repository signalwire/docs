---
slug: "/reference/typescript/session-manager/session-manager/set-session-metadata"
title: "setSessionMetadata"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager.setSessionMetadata"
  parent: "SessionManager.SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `setSessionMetadata`

Merge metadata into a session, creating the entry if it does not exist.

Supports two call signatures for Python SDK compatibility:

- `setSessionMetadata(sessionId, metadata)` — bulk merge (TS-native)
- `setSessionMetadata(sessionId, key, value)` — single key/value (Python-compatible)

## Signature

**Overload 1**

```typescript
setSessionMetadata(
  sessionId: string,
  metadataOrKey: Record<string, unknown>
): void
```

**Overload 2**

```typescript
setSessionMetadata(sessionId: string, key: string, value: unknown): boolean
```

## Parameters (Overload 1)

| Name            | Type                      | Required | Default | Description                                                                   |
| --------------- | ------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `sessionId`     | `string`                  | yes      | —       | The session identifier.                                                       |
| `metadataOrKey` | `Record<string, unknown>` | yes      | —       | A metadata record to merge, or a string key when called with three arguments. |

## Parameters (Overload 2)

| Name        | Type      | Required | Default | Description                                     |
| ----------- | --------- | -------- | ------- | ----------------------------------------------- |
| `sessionId` | `string`  | yes      | —       | The session identifier.                         |
| `key`       | `string`  | yes      | —       | —                                               |
| `value`     | `unknown` | yes      | —       | The value to set when called with a string key. |

## Returns (Overload 1)

`void`

## Returns (Overload 2)

`boolean`

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 248.
