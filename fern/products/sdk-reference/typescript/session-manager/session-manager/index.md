---
slug: "/reference/typescript/session-manager/session-manager"
title: "SessionManager"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SessionManager.SessionManager"
  parent: "SessionManager"
  module: "SessionManager"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts"
---
# `SessionManager`

Stateless HMAC-SHA256 token manager for SWAIG function call authentication and per-session metadata storage.

## Signature

```typescript
class SessionManager
```

## Properties

| Name              | Type      | Required | Default | Description                                                                                                                                                                                 |
| ----------------- | --------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `debugMode`       | `boolean` | yes      | —       | When true, [debugToken](/reference/typescript/session-manager/session-manager/debug-token) decodes token internals. When false (default), it returns `{ error: "debug mode not enabled" }`. |
| `secretKey`       | `string`  | yes      | —       | HMAC signing secret.                                                                                                                                                                        |
| `tokenExpirySecs` | `number`  | yes      | —       | Token validity duration in seconds.                                                                                                                                                         |

## Methods

- [`activateSession`](/reference/typescript/session-manager/session-manager/activate-session) — Legacy method retained for API compatibility with the Python SDK. Does nothing and returns `true`.
- [`cleanup`](/reference/typescript/session-manager/session-manager/cleanup) — Remove session metadata entries older than `maxAgeMs`.
- [`constructor`](/reference/typescript/session-manager/session-manager/constructor) — Create a new SessionManager.
- [`createSession`](/reference/typescript/session-manager/session-manager/create-session) — Return the given callId or generate a new random session identifier.
- [`createToolToken`](/reference/typescript/session-manager/session-manager/create-tool-token) — Alias for [generateToken](/reference/typescript/session-manager/session-manager/generate-token).
- [`debugToken`](/reference/typescript/session-manager/session-manager/debug-token) — Debug a token without validating it.
- [`deleteSessionMetadata`](/reference/typescript/session-manager/session-manager/delete-session-metadata) — Delete all metadata for a session.
- [`endSession`](/reference/typescript/session-manager/session-manager/end-session) — Legacy method retained for API compatibility with the Python SDK. Does nothing and returns `true`.
- [`generateToken`](/reference/typescript/session-manager/session-manager/generate-token) — Generate a signed, base64url-encoded token binding a function name to a call ID.
- [`getSessionMetadata`](/reference/typescript/session-manager/session-manager/get-session-metadata) — Retrieve metadata associated with a session.
- [`setSessionMetadata`](/reference/typescript/session-manager/session-manager/set-session-metadata) — Merge metadata into a session, creating the entry if it does not exist.
- [`validateToken`](/reference/typescript/session-manager/session-manager/validate-token) — Validate a token against the expected call ID and function name.
- [`validateToolToken`](/reference/typescript/session-manager/session-manager/validate-tool-token) — Alias for [validateToken](/reference/typescript/session-manager/session-manager/validate-token) with reordered parameters.

## Source

[`src/SessionManager.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SessionManager.ts)

Line 33.
