# Class: EmbedTokenCredentialProvider

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:9](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L9)

Credential provider that exchanges an embed token for a SAT via the host's token endpoint.

## Implements

- [`CredentialProvider`](../../interfaces/CredentialProvider.md)

## Constructors

### Constructor

> **new EmbedTokenCredentialProvider**(`host`, `embedToken`): `EmbedTokenCredentialProvider`

Defined in: [dependencies/EmbedTokenCredentialProvider.ts:10](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L10)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `host` | `string` |
| `embedToken` | `string` |

#### Returns

`EmbedTokenCredentialProvider`

## Methods

- [`authenticate`](./authenticate.md)
- [`refresh`](./refresh.md)
