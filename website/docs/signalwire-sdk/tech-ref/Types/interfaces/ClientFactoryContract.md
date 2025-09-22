Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:143](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L143)

Contract for the ClientFactory

## Methods

### addProfiles()

> **addProfiles**(`params`): `Promise`\<[`Profile`](Profile.md)[]\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:155](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L155)

Add one or more authentication profiles

#### Parameters

##### params

[`AddProfilesParams`](AddProfilesParams.md)

Profiles to add

#### Returns

`Promise`\<[`Profile`](Profile.md)[]\>

Array of created profiles

***

### disposeClient()

> **disposeClient**(`params`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:188](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L188)

Dispose of a client instance

#### Parameters

##### params

[`DisposeClientParams`](DisposeClientParams.md)

Disposal parameters

#### Returns

`Promise`\<`void`\>

***

### getClient()

> **getClient**(`params`): `Promise`\<[`GetClientResult`](GetClientResult.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:182](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L182)

Get or create a client instance for a profile

#### Parameters

##### params

[`GetClientParams`](GetClientParams.md)

Client request parameters

#### Returns

`Promise`\<[`GetClientResult`](GetClientResult.md)\>

Client instance information

***

### getProfile()

> **getProfile**(`profileId`): `Promise`\<`null` \| [`Profile`](Profile.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:175](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L175)

Get a specific profile by ID

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`null` \| [`Profile`](Profile.md)\>

Profile or null if not found

***

### init()

> **init**(`storage?`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:148](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L148)

Initialize the factory with storage

#### Parameters

##### storage?

[`SignalWireStorageContract`](SignalWireStorageContract.md)

Optional storage implementation

#### Returns

`Promise`\<`void`\>

***

### listActiveClients()

> **listActiveClients**(): `Promise`\<[`ManagedInstance`](ManagedInstance.md)[]\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:194](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L194)

List all active client instances

#### Returns

`Promise`\<[`ManagedInstance`](ManagedInstance.md)[]\>

Array of active instances

***

### listProfiles()

> **listProfiles**(): `Promise`\<[`Profile`](Profile.md)[]\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:168](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L168)

List all available profiles

#### Returns

`Promise`\<[`Profile`](Profile.md)[]\>

Array of all profiles

***

### removeProfiles()

> **removeProfiles**(`params`): `Promise`\<`string`[]\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:162](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L162)

Remove one or more authentication profiles

#### Parameters

##### params

[`RemoveProfilesParams`](RemoveProfilesParams.md)

Profile IDs to remove

#### Returns

`Promise`\<`string`[]\>

Array of successfully removed profile IDs
