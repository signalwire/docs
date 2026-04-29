---
title: "OverconstrainedFallbackError"
---

# Class: OverconstrainedFallbackError

Defined in: [core/errors.ts:437](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L437)

Error thrown when getUserMedia fails with OverconstrainedError
and all fallback levels have been exhausted.

## Extends

- `Error`

## Constructors

### Constructor

> **new OverconstrainedFallbackError**(`deviceKind`, `originalError?`): `OverconstrainedFallbackError`

Defined in: [core/errors.ts:438](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L438)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `deviceKind` | `string` |
| `originalError?` | `unknown` |

#### Returns

`OverconstrainedFallbackError`

#### Overrides

`Error.constructor`

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="devicekind"></a> `deviceKind` | `public` | `string` | [core/errors.ts:439](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L439) |
| <a id="originalerror"></a> `originalError?` | `public` | `unknown` | [core/errors.ts:440](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L440) |
