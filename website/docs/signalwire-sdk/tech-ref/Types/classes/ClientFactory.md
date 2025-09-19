Defined in: [packages/client/src/unified/ClientFactory.ts:29](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L29)

Singleton factory for managing SignalWire client instances and authentication profiles.
Provides a centralized way to create, manage, and dispose of client instances.

## Implements

- [`ClientFactoryContract`](../interfaces/ClientFactoryContract.md)

## Methods

### addDynamicProfile()

> **addDynamicProfile**(`credentialsId`, `credentials`, `addressId`, `addressDetails?`): `Promise`\<[`Profile`](../interfaces/Profile.md)\>

Defined in: [packages/client/src/unified/ClientFactory.ts:364](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L364)

Add a dynamic profile (memory-only, not persisted)
Convenience method for creating temporary authentication profiles

#### Parameters

##### credentialsId

`string`

Unique identifier for credentials

##### credentials

[`SignalWireCredentials`](../interfaces/SignalWireCredentials.md)

Authentication credentials

##### addressId

`string`

SignalWire address ID

##### addressDetails?

Optional address details

###### channels?

`number`

###### displayName?

`string`

###### name

`string`

###### type

[`ResourceType`](../type-aliases/ResourceType.md)

#### Returns

`Promise`\<[`Profile`](../interfaces/Profile.md)\>

Created profile

***

### addProfiles()

> **addProfiles**(`params`): `Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Defined in: [packages/client/src/unified/ClientFactory.ts:78](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L78)

Add one or more authentication profiles

#### Parameters

##### params

[`AddProfilesParams`](../interfaces/AddProfilesParams.md)

Profiles to add

#### Returns

`Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Array of created profiles

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`addProfiles`](../interfaces/ClientFactoryContract.md#addprofiles)

***

### addStaticProfile()

> **addStaticProfile**(`credentialsId`, `credentials`, `addressId`, `addressDetails?`): `Promise`\<[`Profile`](../interfaces/Profile.md)\>

Defined in: [packages/client/src/unified/ClientFactory.ts:404](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L404)

Add a static profile (persisted to storage)
Convenience method for creating persistent authentication profiles

#### Parameters

##### credentialsId

`string`

Unique identifier for credentials

##### credentials

[`SignalWireCredentials`](../interfaces/SignalWireCredentials.md)

Authentication credentials

##### addressId

`string`

SignalWire address ID

##### addressDetails?

Optional address details

###### channels?

`number`

###### displayName?

`string`

###### name

`string`

###### type

[`ResourceType`](../type-aliases/ResourceType.md)

#### Returns

`Promise`\<[`Profile`](../interfaces/Profile.md)\>

Created profile

***

### dispose()

> **dispose**(): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/ClientFactory.ts:450](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L450)

Dispose of all resources and reset the factory
This will dispose of all active instances and clear all profiles

#### Returns

`Promise`\<`void`\>

***

### disposeClient()

> **disposeClient**(`params`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/ClientFactory.ts:327](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L327)

Dispose of a client instance

#### Parameters

##### params

[`DisposeClientParams`](../interfaces/DisposeClientParams.md)

Disposal parameters

#### Returns

`Promise`\<`void`\>

Whether the instance was successfully disposed

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`disposeClient`](../interfaces/ClientFactoryContract.md#disposeclient)

***

### getClient()

> **getClient**(`params`): `Promise`\<[`GetClientResult`](../interfaces/GetClientResult.md)\>

Defined in: [packages/client/src/unified/ClientFactory.ts:238](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L238)

Get or create a client instance for a profile

#### Parameters

##### params

[`GetClientParams`](../interfaces/GetClientParams.md)

Client request parameters

#### Returns

`Promise`\<[`GetClientResult`](../interfaces/GetClientResult.md)\>

Client instance information

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`getClient`](../interfaces/ClientFactoryContract.md#getclient)

***

### getProfile()

> **getProfile**(`profileId`): `Promise`\<`null` \| [`Profile`](../interfaces/Profile.md)\>

Defined in: [packages/client/src/unified/ClientFactory.ts:228](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L228)

Get a specific profile by ID

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`null` \| [`Profile`](../interfaces/Profile.md)\>

Profile or null if not found

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`getProfile`](../interfaces/ClientFactoryContract.md#getprofile)

***

### getStorageInfo()

> **getStorageInfo**(): `Promise`\<`null` \| [`StorageInfo`](../interfaces/StorageInfo.md)\>

Defined in: [packages/client/src/unified/ClientFactory.ts:439](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L439)

Get storage information

#### Returns

`Promise`\<`null` \| [`StorageInfo`](../interfaces/StorageInfo.md)\>

Storage information if available

***

### init()

> **init**(`storage?`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/ClientFactory.ts:56](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L56)

Initialize the factory with storage

#### Parameters

##### storage?

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md)

Optional storage implementation (defaults to LocalStorageAdapter)

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`init`](../interfaces/ClientFactoryContract.md#init)

***

### listActiveClients()

> **listActiveClients**(): `Promise`\<[`ManagedInstance`](../interfaces/ManagedInstance.md)[]\>

Defined in: [packages/client/src/unified/ClientFactory.ts:350](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L350)

List all active client instances

#### Returns

`Promise`\<[`ManagedInstance`](../interfaces/ManagedInstance.md)[]\>

Array of active instances

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`listActiveClients`](../interfaces/ClientFactoryContract.md#listactiveclients)

***

### listProfiles()

> **listProfiles**(): `Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Defined in: [packages/client/src/unified/ClientFactory.ts:218](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L218)

List all available profiles

#### Returns

`Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Array of all profiles

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`listProfiles`](../interfaces/ClientFactoryContract.md#listprofiles)

***

### removeProfiles()

> **removeProfiles**(`params`): `Promise`\<`string`[]\>

Defined in: [packages/client/src/unified/ClientFactory.ts:181](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L181)

Remove one or more authentication profiles

#### Parameters

##### params

[`RemoveProfilesParams`](../interfaces/RemoveProfilesParams.md)

Profile IDs to remove

#### Returns

`Promise`\<`string`[]\>

Array of successfully removed profile IDs

#### Implementation of

[`ClientFactoryContract`](../interfaces/ClientFactoryContract.md).[`removeProfiles`](../interfaces/ClientFactoryContract.md#removeprofiles)

***

### getInstance()

> `static` **getInstance**(): `ClientFactory`

Defined in: [packages/client/src/unified/ClientFactory.ts:45](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ClientFactory.ts#L45)

Get the singleton instance of ClientFactory

#### Returns

`ClientFactory`

ClientFactory instance
