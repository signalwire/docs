---
title: "refresh"
---

# refresh

> **refresh**(): `Promise`\<\{ `expiry_at`: `number`; `token`: `string`; \}\>

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:58](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L58)

Obtains fresh credentials before the current ones expire. Optional.

Implementor responsibilities:
- Resolve with a new [SDKCredential](../../interfaces/SDKCredential.md) containing an updated `token` (or `authorizationState`) and `expiry_at`.
- Reject (throw) if refresh is not possible — the SDK will stop the refresh schedule.

SDK behavior:
- Only called when `expiry_at` was set on the previous credential.
- Scheduled automatically before expiry; implementors do not need to manage timing.
- On rejection, the refresh schedule stops and the session continues with the
  current credentials until they expire.
- When not provided and the SAT includes a `sat:refresh` scope, the SDK
  automatically refreshes via Client Bound SAT (DPoP) without developer intervention.
- When not provided and no refresh scope is present, the SDK uses the initial
  credentials for the entire session lifetime.

#### Returns

`Promise`\<\{ `expiry_at`: `number`; `token`: `string`; \}\>

#### Implementation of

[`CredentialProvider`](../../interfaces/CredentialProvider.md).[`refresh`](../../interfaces/CredentialProvider.md#refresh)
