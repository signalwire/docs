---
title: "AuthenticateContext"
---

# Interface: AuthenticateContext

Defined in: [dependencies/interfaces.ts:20](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L20)

Context provided by the SDK when calling [CredentialProvider.authenticate](CredentialProvider.md#authenticate).

Contains optional parameters the SDK generates internally (e.g., DPoP fingerprint)
that the implementor can forward to their server-side token endpoint.

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="fingerprint"></a> `fingerprint?` | `string` | JWK Thumbprint (RFC 7638) of the SDK's ephemeral DPoP key pair. When present, the implementor should forward this value as the `fingerprint` parameter to the server-side SAT issuance endpoint alongside `scope: "sat:refresh"`. This enables the server to bind the SAT to the SDK's key pair, allowing automatic Client Bound SAT refresh without developer intervention. When absent (e.g., Web Crypto API not available), the implementor should proceed without DPoP binding. | [dependencies/interfaces.ts:32](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L32) |
