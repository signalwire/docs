---
title: "MediaTrackError"
---

# Class: MediaTrackError

Defined in: [core/errors.ts:382](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L382)

## Extends

- `Error`

## Constructors

### Constructor

> **new MediaTrackError**(`operation`, `kind`, `originalError`): `MediaTrackError`

Defined in: [core/errors.ts:383](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L383)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `operation` | `string` |
| `kind` | `string` |
| `originalError` | `unknown` |

#### Returns

`MediaTrackError`

#### Overrides

`Error.constructor`

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="kind"></a> `kind` | `public` | `string` | [core/errors.ts:385](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L385) |
| <a id="operation"></a> `operation` | `public` | `string` | [core/errors.ts:384](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L384) |
| <a id="originalerror"></a> `originalError` | `public` | `unknown` | [core/errors.ts:386](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L386) |
