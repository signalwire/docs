---
title: "EmbedTokenCredentialProvider"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L9)</sub>

Credential provider that exchanges an embed token for a SAT via the host's token endpoint.

## Implements

- [`CredentialProvider`](../../interfaces/CredentialProvider.md)

## Constructors

### Constructor

> **new EmbedTokenCredentialProvider**(`host`, `embedToken`): `EmbedTokenCredentialProvider`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/EmbedTokenCredentialProvider.ts#L10)</sub>

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
