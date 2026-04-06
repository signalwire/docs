# Class: DPoPInitError

Defined in: [core/errors.ts:386](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L386)

## Extends

- `Error`

## Constructors

### Constructor

> **new DPoPInitError**(`originalError`, `message?`): `DPoPInitError`

Defined in: [core/errors.ts:387](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L387)

#### Parameters

| Parameter | Type | Default value |
| ------ | ------ | ------ |
| `originalError` | `unknown` | `undefined` |
| `message` | `string` | `'Failed to initialize DPoP key pair'` |

#### Returns

`DPoPInitError`

#### Overrides

`Error.constructor`

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="originalerror"></a> `originalError` | `public` | `unknown` | [core/errors.ts:388](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/errors.ts#L388) |
