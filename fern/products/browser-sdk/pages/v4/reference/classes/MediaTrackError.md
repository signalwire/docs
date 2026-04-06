# Class: MediaTrackError

Defined in: [core/errors.ts:369](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L369)

## Extends

- `Error`

## Constructors

### Constructor

> **new MediaTrackError**(`operation`, `kind`, `originalError`): `MediaTrackError`

Defined in: [core/errors.ts:370](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L370)

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
| <a id="kind"></a> `kind` | `public` | `string` | [core/errors.ts:372](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L372) |
| <a id="operation"></a> `operation` | `public` | `string` | [core/errors.ts:371](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L371) |
| <a id="originalerror"></a> `originalError` | `public` | `unknown` | [core/errors.ts:373](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L373) |
