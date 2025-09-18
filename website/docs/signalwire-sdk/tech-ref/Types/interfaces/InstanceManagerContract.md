Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:284](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L284)

Contract for the InstanceManager

## Methods

### createInstance()

> **createInstance**(`profile`, `options`): `Promise`\<[`ManagedInstance`](ManagedInstance.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:292](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L292)

Create a new client instance

#### Parameters

##### profile

[`Profile`](Profile.md)

Profile data

##### options

[`GetClientParamsOptions`](../type-aliases/GetClientParamsOptions.md)

SignalwireClient options

#### Returns

`Promise`\<[`ManagedInstance`](ManagedInstance.md)\>

Created instance

***

### disposeInstance()

> **disposeInstance**(`instanceId`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:303](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L303)

Dispose of a client instance

#### Parameters

##### instanceId

`string`

Instance ID to dispose

#### Returns

`Promise`\<`void`\>

Whether the instance was disposed

***

### getInstance()

> **getInstance**(`instanceId`): `Promise`\<`null` \| [`ManagedInstance`](ManagedInstance.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:310](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L310)

Get an existing instance

#### Parameters

##### instanceId

`string`

Instance identifier

#### Returns

`Promise`\<`null` \| [`ManagedInstance`](ManagedInstance.md)\>

Instance or null if not found

***

### getInstanceByProfile()

> **getInstanceByProfile**(`profileId`): `Promise`\<`null` \| [`ManagedInstance`](ManagedInstance.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:317](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L317)

Get instance by profile ID

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`null` \| [`ManagedInstance`](ManagedInstance.md)\>

Instance or null if not found

***

### listInstances()

> **listInstances**(): `Promise`\<[`ManagedInstance`](ManagedInstance.md)[]\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:323](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L323)

List all active instances

#### Returns

`Promise`\<[`ManagedInstance`](ManagedInstance.md)[]\>

Array of active instances

***

### updateInstanceAccess()

> **updateInstanceAccess**(`instanceId`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:329](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L329)

Update instance access tracking

#### Parameters

##### instanceId

`string`

Instance identifier

#### Returns

`Promise`\<`void`\>
