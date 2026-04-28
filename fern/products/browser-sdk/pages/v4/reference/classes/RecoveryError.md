# Class: RecoveryError

Defined in: [core/errors.ts:420](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L420)

Error thrown when a recovery attempt fails.

Carries the recovery action and attempt number for diagnostic purposes.

## Extends

- `Error`

## Constructors

### Constructor

> **new RecoveryError**(`action`, `attempt`, `originalError?`): `RecoveryError`

Defined in: [core/errors.ts:421](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L421)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `action` | `string` |
| `attempt` | `number` |
| `originalError?` | `unknown` |

#### Returns

`RecoveryError`

#### Overrides

`Error.constructor`

## Properties

| Property | Modifier | Type | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="action"></a> `action` | `public` | `string` | [core/errors.ts:422](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L422) |
| <a id="attempt"></a> `attempt` | `public` | `number` | [core/errors.ts:423](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L423) |
| <a id="originalerror"></a> `originalError?` | `public` | `unknown` | [core/errors.ts:424](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/errors.ts#L424) |
