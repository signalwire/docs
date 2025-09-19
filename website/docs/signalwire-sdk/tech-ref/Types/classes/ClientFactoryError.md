Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:355](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L355)

Error types for ClientFactory operations

## Extends

- `Error`

## Extended by

- [`ProfileNotFoundError`](ProfileNotFoundError.md)
- [`InstanceNotFoundError`](InstanceNotFoundError.md)
- [`ProfileExistsError`](ProfileExistsError.md)
- [`InstanceInUseError`](InstanceInUseError.md)
- [`CredentialRefreshError`](CredentialRefreshError.md)
- [`CredentialExpiredError`](CredentialExpiredError.md)

## Constructors

### Constructor

> **new ClientFactoryError**(`message`, `code`, `context?`): `ClientFactoryError`

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:356](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L356)

#### Parameters

##### message

`string`

##### code

`string`

##### context?

`Record`\<`string`, `unknown`\>

#### Returns

`ClientFactoryError`

#### Overrides

`Error.constructor`

## Properties

### code

> `readonly` **code**: `string`

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:358](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L358)

***

### context?

> `readonly` `optional` **context**: `Record`\<`string`, `unknown`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:359](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L359)
