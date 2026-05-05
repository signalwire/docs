---
title: "OverconstrainedFallbackError"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L437)</sub>

Error thrown when getUserMedia fails with OverconstrainedError
and all fallback levels have been exhausted.

## Extends

- `Error`

## Constructors

### Constructor

> **new OverconstrainedFallbackError**(`deviceKind`, `originalError?`): `OverconstrainedFallbackError`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L438)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `deviceKind` | `string` |
| `originalError?` | `unknown` |

#### Returns

`OverconstrainedFallbackError`

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| `deviceKind` | `public` | `string` | [core/errors.ts:439](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L439) |
| `originalError?` | `public` | `unknown` | [core/errors.ts:440](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/errors.ts#L440) |
