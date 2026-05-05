---
title: "CallCreateError"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L264)</sub>

## Extends

- `Error`

## Constructors

### Constructor

> **new CallCreateError**(`message`, `error?`, `direction?`, `options?`): `CallCreateError`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L265)</sub>

#### Parameters

| Parameter | Type | Default value |
| ------ | ------ | ------ |
| `message` | `string` | `undefined` |
| `error` | `unknown` | `null` |
| `direction` | `"inbound"` \| `"outbound"` | `'outbound'` |
| `options?` | `ErrorOptions` | `undefined` |

#### Returns

`CallCreateError`

## Properties

| Property | Modifier | Type | Default value | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ |
| `direction` | `public` | `"inbound"` \| `"outbound"` | `'outbound'` | - | [core/errors.ts:268](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L268) |
| `error` | `public` | `unknown` | `null` | - | [core/errors.ts:267](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L267) |
| `message` | `public` | `string` | `undefined` | `Error.message` | [core/errors.ts:266](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L266) |
