# authenticate

> **authenticate**(): `Promise`\<\{ `expiry_at`: `number`; `token`: `string`; \}\>

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:52](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L52)

Obtains the initial credentials. Called once during client initialization.

Implementor responsibilities:
- Resolve with a valid [SDKCredential](../../interfaces/SDKCredential.md) on success.
- Reject (throw) on failure — this will cause client initialization to fail.
- When `context.fingerprint` is provided, forward it to the server-side token
  endpoint with `scope: "sat:refresh"` to enable automatic token refresh.

SDK behavior:
- Awaits this method before establishing the WebSocket connection.
- On rejection, propagates the error to the caller of `SignalWire()`.

#### Returns

`Promise`\<\{ `expiry_at`: `number`; `token`: `string`; \}\>

#### Implementation of

[`CredentialProvider`](../../interfaces/CredentialProvider.md).[`authenticate`](../../interfaces/CredentialProvider.md#authenticate)
