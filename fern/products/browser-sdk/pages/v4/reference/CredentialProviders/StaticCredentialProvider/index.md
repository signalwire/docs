---
title: "StaticCredentialProvider"
---

# Class: StaticCredentialProvider

Defined in: [dependencies/StaticCredentialProvider.ts:15](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/StaticCredentialProvider.ts#L15)

Credential provider that returns a fixed set of credentials.

Use when the token is already available (e.g. from a backend endpoint).

## Example

```ts
const provider = new StaticCredentialProvider({ token: 'my-sat-token' });
const client = new SignalWire(provider);
```

## Implements

- [`CredentialProvider`](../../interfaces/CredentialProvider.md)

## Constructors

### Constructor

> **new StaticCredentialProvider**(`credentials`): `StaticCredentialProvider`

Defined in: [dependencies/StaticCredentialProvider.ts:16](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/StaticCredentialProvider.ts#L16)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `credentials` | [`SDKCredential`](../../interfaces/SDKCredential.md) |

#### Returns

`StaticCredentialProvider`

## Methods

- [`authenticate`](./authenticate.md)
