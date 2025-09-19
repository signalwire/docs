Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:398](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L398)

Error types for ClientFactory operations

## Extends

- [`ClientFactoryError`](ClientFactoryError.md)

## Constructors

### Constructor

> **new CredentialRefreshError**(`profileId`, `originalError?`): `CredentialRefreshError`

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:399](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L399)

#### Parameters

##### profileId

`string`

##### originalError?

`Error`

#### Returns

`CredentialRefreshError`

#### Overrides

[`ClientFactoryError`](ClientFactoryError.md).[`constructor`](ClientFactoryError.md#constructor)

## Properties

### code

> `readonly` **code**: `string`

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:358](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L358)

#### Inherited from

[`ClientFactoryError`](ClientFactoryError.md).[`code`](ClientFactoryError.md#code)

***

### context?

> `readonly` `optional` **context**: `Record`\<`string`, `unknown`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:359](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L359)

#### Inherited from

[`ClientFactoryError`](ClientFactoryError.md).[`context`](ClientFactoryError.md#context)
