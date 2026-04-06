# Interface: AuthenticateContext

Defined in: [dependencies/interfaces.ts:18](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L18)

Context provided by the SDK when calling [CredentialProvider.authenticate](CredentialProvider.md#authenticate).

Contains optional parameters the SDK generates internally (e.g., DPoP fingerprint)
that the implementor can forward to their server-side token endpoint.

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="fingerprint"></a> `fingerprint?` | `string` | JWK Thumbprint (RFC 7638) of the SDK's ephemeral DPoP key pair. When present, the implementor should forward this value as the `fingerprint` parameter to the server-side SAT issuance endpoint alongside `scope: "sat:refresh"`. This enables the server to bind the SAT to the SDK's key pair, allowing automatic Client Bound SAT refresh without developer intervention. When absent (e.g., Web Crypto API not available), the implementor should proceed without DPoP binding. | [dependencies/interfaces.ts:30](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L30) |
