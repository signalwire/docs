# Class: EmbedTokenCredentialProvider

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:9](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L9)

Credential provider that exchanges an embed token for a SAT via the host's token endpoint.

## Implements

- [`CredentialProvider`](../interfaces/CredentialProvider.md)

## Constructors

### Constructor

> **new EmbedTokenCredentialProvider**(`host`, `embedToken`): `EmbedTokenCredentialProvider`

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:10](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L10)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `host` | `string` |
| `embedToken` | `string` |

#### Returns

`EmbedTokenCredentialProvider`

## Methods

### authenticate()

> **authenticate**(): `Promise`\<\{ `expiry_at`: `number`; `token`: `string`; \}\>

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:52](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L52)

Obtains the initial credentials. Called once during client initialization.

Implementor responsibilities:
- Resolve with a valid [SDKCredential](../interfaces/SDKCredential.md) on success.
- Reject (throw) on failure — this will cause client initialization to fail.
- When `context.fingerprint` is provided, forward it to the server-side token
  endpoint with `scope: "sat:refresh"` to enable automatic token refresh.

SDK behavior:
- Awaits this method before establishing the WebSocket connection.
- On rejection, propagates the error to the caller of `SignalWire()`.

#### Returns

`Promise`\<\{ `expiry_at`: `number`; `token`: `string`; \}\>

#### Implementation of

[`CredentialProvider`](../interfaces/CredentialProvider.md).[`authenticate`](../interfaces/CredentialProvider.md#authenticate)

***

### refresh()

> **refresh**(): `Promise`\<\{ `expiry_at`: `number`; `token`: `string`; \}\>

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:58](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L58)

Obtains fresh credentials before the current ones expire. Optional.

Implementor responsibilities:
- Resolve with a new [SDKCredential](../interfaces/SDKCredential.md) containing an updated `token` (or `authorizationState`) and `expiry_at`.
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

[`CredentialProvider`](../interfaces/CredentialProvider.md).[`refresh`](../interfaces/CredentialProvider.md#refresh)
