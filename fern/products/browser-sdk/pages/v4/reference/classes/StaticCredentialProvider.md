# Class: StaticCredentialProvider

Defined in: [dependencies/StaticCredentialProvider.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/StaticCredentialProvider.ts#L15)

Credential provider that returns a fixed set of credentials.

Use when the token is already available (e.g. from a backend endpoint).

## Example

```ts
const provider = new StaticCredentialProvider({ token: 'my-sat-token' });
const client = new SignalWire(provider);
```

## Implements

- [`CredentialProvider`](../interfaces/CredentialProvider.md)

## Constructors

### Constructor

> **new StaticCredentialProvider**(`credentials`): `StaticCredentialProvider`

Defined in: [dependencies/StaticCredentialProvider.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/StaticCredentialProvider.ts#L16)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `credentials` | [`SDKCredential`](../interfaces/SDKCredential.md) |

#### Returns

`StaticCredentialProvider`

## Methods

### authenticate()

> **authenticate**(): `Promise`\<[`SDKCredential`](../interfaces/SDKCredential.md)\>

Defined in: [dependencies/StaticCredentialProvider.ts:19](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/StaticCredentialProvider.ts#L19)

Returns the static credentials.

#### Returns

`Promise`\<[`SDKCredential`](../interfaces/SDKCredential.md)\>

#### Implementation of

[`CredentialProvider`](../interfaces/CredentialProvider.md).[`authenticate`](../interfaces/CredentialProvider.md#authenticate)
