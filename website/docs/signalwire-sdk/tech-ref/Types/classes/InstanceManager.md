Defined in: [packages/client/src/unified/InstanceManager.ts:13](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L13)

Manages the lifecycle of SignalWire client instances.
Handles creation, disposal, and tracking of active instances.

## Implements

- [`InstanceManagerContract`](../interfaces/InstanceManagerContract.md)

## Constructors

### Constructor

> **new InstanceManager**(): `InstanceManager`

#### Returns

`InstanceManager`

## Methods

### createInstance()

> **createInstance**(`profile`, `options`): `Promise`\<[`ManagedInstance`](../interfaces/ManagedInstance.md)\>

Defined in: [packages/client/src/unified/InstanceManager.ts:22](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L22)

Create a new client instance

#### Parameters

##### profile

[`Profile`](../interfaces/Profile.md)

Profile data

##### options

[`GetClientParamsOptions`](../type-aliases/GetClientParamsOptions.md)

#### Returns

`Promise`\<[`ManagedInstance`](../interfaces/ManagedInstance.md)\>

Created instance

#### Implementation of

[`InstanceManagerContract`](../interfaces/InstanceManagerContract.md).[`createInstance`](../interfaces/InstanceManagerContract.md#createinstance)

***

### dispose()

> **dispose**(): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/InstanceManager.ts:150](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L150)

Clean up all resources when the manager is being destroyed

#### Returns

`Promise`\<`void`\>

***

### disposeInstance()

> **disposeInstance**(`instanceId`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/InstanceManager.ts:82](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L82)

Dispose of a client instance

#### Parameters

##### instanceId

`string`

Instance ID to dispose

#### Returns

`Promise`\<`void`\>

Whether the instance was disposed

#### Implementation of

[`InstanceManagerContract`](../interfaces/InstanceManagerContract.md).[`disposeInstance`](../interfaces/InstanceManagerContract.md#disposeinstance)

***

### getInstance()

> **getInstance**(`instanceId`): `Promise`\<`null` \| [`ManagedInstance`](../interfaces/ManagedInstance.md)\>

Defined in: [packages/client/src/unified/InstanceManager.ts:101](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L101)

Get an existing instance

#### Parameters

##### instanceId

`string`

Instance identifier

#### Returns

`Promise`\<`null` \| [`ManagedInstance`](../interfaces/ManagedInstance.md)\>

Instance or null if not found

#### Implementation of

[`InstanceManagerContract`](../interfaces/InstanceManagerContract.md).[`getInstance`](../interfaces/InstanceManagerContract.md#getinstance)

***

### getInstanceByProfile()

> **getInstanceByProfile**(`profileId`): `Promise`\<`null` \| [`ManagedInstance`](../interfaces/ManagedInstance.md)\>

Defined in: [packages/client/src/unified/InstanceManager.ts:116](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L116)

Get instance by profile ID

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`null` \| [`ManagedInstance`](../interfaces/ManagedInstance.md)\>

Instance or null if not found

#### Implementation of

[`InstanceManagerContract`](../interfaces/InstanceManagerContract.md).[`getInstanceByProfile`](../interfaces/InstanceManagerContract.md#getinstancebyprofile)

***

### listInstances()

> **listInstances**(): `Promise`\<[`ManagedInstance`](../interfaces/ManagedInstance.md)[]\>

Defined in: [packages/client/src/unified/InstanceManager.ts:126](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L126)

List all active instances

#### Returns

`Promise`\<[`ManagedInstance`](../interfaces/ManagedInstance.md)[]\>

Array of active instances

#### Implementation of

[`InstanceManagerContract`](../interfaces/InstanceManagerContract.md).[`listInstances`](../interfaces/InstanceManagerContract.md#listinstances)

***

### updateInstanceAccess()

> **updateInstanceAccess**(`instanceId`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/InstanceManager.ts:136](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/InstanceManager.ts#L136)

Update instance access tracking

#### Parameters

##### instanceId

`string`

Instance identifier

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`InstanceManagerContract`](../interfaces/InstanceManagerContract.md).[`updateInstanceAccess`](../interfaces/InstanceManagerContract.md#updateinstanceaccess)
