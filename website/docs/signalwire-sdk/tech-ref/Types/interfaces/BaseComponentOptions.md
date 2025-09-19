Defined in: [packages/core/src/utils/interfaces.ts:146](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L146)

## Properties

### customSagas?

> `optional` **customSagas**: `CustomSaga`\<`any`\>[]

Defined in: [packages/core/src/utils/interfaces.ts:148](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L148)

***

### store

> **store**: `object`

Defined in: [packages/core/src/utils/interfaces.ts:147](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L147)

#### channels

> **channels**: `InternalChannels`

#### instanceMap

> **instanceMap**: `InstanceMap`

#### runSaga()

> **runSaga**: \<`T`\>(`saga`, `args`) => `Task`\<`any`\>

##### Type Parameters

###### T

`T`

##### Parameters

###### saga

`Saga`

###### args

###### instance

`T`

###### runSaga

`any`

##### Returns

`Task`\<`any`\>

#### sessionEmitter

> **sessionEmitter**: `EventEmitter`\<[`ClientEvents`](../type-aliases/ClientEvents.md), `any`\>
