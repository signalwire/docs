# Interface: CredentialProvider

Defined in: [dependencies/interfaces.ts:45](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L45)

Provides authentication credentials to the SDK.

Implementors are responsible for:
- Obtaining credentials (e.g. via API calls, user login flows, or third-party auth services).
- Returning a valid [SDKCredential](SDKCredential.md) with either a `token` or `authorizationState`.
- Setting `expiry_at` when the credential has a known expiration so the SDK can schedule refresh.
- Handling errors and never leaking sensitive data through error messages.

The SDK owns the credential lifecycle: it calls `authenticate` once during initialization
and, if `refresh` is provided and `expiry_at` is set, schedules automatic refresh before expiry.

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="refresh"></a> `refresh?` | () => `Promise`\<[`SDKCredential`](SDKCredential.md)\> | Obtains fresh credentials before the current ones expire. Optional. Implementor responsibilities: - Resolve with a new [SDKCredential](SDKCredential.md) containing an updated `token` (or `authorizationState`) and `expiry_at`. - Reject (throw) if refresh is not possible — the SDK will stop the refresh schedule. SDK behavior: - Only called when `expiry_at` was set on the previous credential. - Scheduled automatically before expiry; implementors do not need to manage timing. - On rejection, the refresh schedule stops and the session continues with the current credentials until they expire. - When not provided and the SAT includes a `sat:refresh` scope, the SDK automatically refreshes via Client Bound SAT (DPoP) without developer intervention. - When not provided and no refresh scope is present, the SDK uses the initial credentials for the entire session lifetime. | [dependencies/interfaces.ts:78](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L78) |

## Methods

### authenticate()

> **authenticate**(`context?`): `Promise`\<[`SDKCredential`](SDKCredential.md)\>

Defined in: [dependencies/interfaces.ts:59](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L59)

Obtains the initial credentials. Called once during client initialization.

Implementor responsibilities:
- Resolve with a valid [SDKCredential](SDKCredential.md) on success.
- Reject (throw) on failure — this will cause client initialization to fail.
- When `context.fingerprint` is provided, forward it to the server-side token
  endpoint with `scope: "sat:refresh"` to enable automatic token refresh.

SDK behavior:
- Awaits this method before establishing the WebSocket connection.
- On rejection, propagates the error to the caller of `SignalWire()`.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `context?` | [`AuthenticateContext`](AuthenticateContext.md) |

#### Returns

`Promise`\<[`SDKCredential`](SDKCredential.md)\>
