# Class: PreflightError

Defined in: [core/errors.ts:452](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L452)

Error thrown when the preflight connectivity test fails.

## Extends

- `Error`

## Constructors

### Constructor

> **new PreflightError**(`phase`, `originalError?`): `PreflightError`

Defined in: [core/errors.ts:453](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L453)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `phase` | `string` |
| `originalError?` | `unknown` |

#### Returns

`PreflightError`

#### Overrides

`Error.constructor`

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="originalerror"></a> `originalError?` | `public` | `unknown` | [core/errors.ts:455](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L455) |
| <a id="phase"></a> `phase` | `public` | `string` | [core/errors.ts:454](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L454) |
