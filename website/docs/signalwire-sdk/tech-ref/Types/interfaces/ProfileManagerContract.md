Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:200](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L200)

Contract for the ProfileManager

## Methods

### addProfile()

> **addProfile**(`profile`): `Promise`\<`string`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:212](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L212)

Add a new profile

#### Parameters

##### profile

`Omit`\<[`Profile`](Profile.md), `"id"` \| `"createdAt"` \| `"updatedAt"` \| `"lastUsed"`\>

Profile to add (without id, createdAt, updatedAt, lastUsed)

#### Returns

`Promise`\<`string`\>

Created profile ID

***

### createDynamicProfile()

> **createDynamicProfile**(`parentProfile`, `addressId`): `Promise`\<[`Profile`](Profile.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:275](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L275)

Create a dynamic profile for accessing a shared resource

#### Parameters

##### parentProfile

[`Profile`](Profile.md)

Profile to inherit credentials from

##### addressId

`string`

Address ID for the shared resource

#### Returns

`Promise`\<[`Profile`](Profile.md)\>

Created dynamic profile

***

### findProfileForAddress()

> **findProfileForAddress**(`addressId`): `Promise`\<`null` \| [`Profile`](Profile.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:260](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L260)

Find a profile that has access to a specific address

#### Parameters

##### addressId

`string`

Address identifier to search for

#### Returns

`Promise`\<`null` \| [`Profile`](Profile.md)\>

Profile that has access or null if not found

***

### getProfile()

> **getProfile**(`profileId`): `Promise`\<`null` \| [`Profile`](Profile.md)\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:239](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L239)

Get a profile by ID

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`null` \| [`Profile`](Profile.md)\>

Profile or null if not found

***

### getProfilesByCredentialId()

> **getProfilesByCredentialId**(`credentialId`): `Promise`\<[`Profile`](Profile.md)[]\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:267](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L267)

Get all profiles associated with a credential ID

#### Parameters

##### credentialId

`string`

Credential identifier

#### Returns

`Promise`\<[`Profile`](Profile.md)[]\>

Array of profiles with the given credential ID

***

### hasProfile()

> **hasProfile**(`profileId`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:253](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L253)

Check if a profile exists

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`boolean`\>

Whether the profile exists

***

### init()

> **init**(`storage`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:205](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L205)

Initialize the profile manager with storage

#### Parameters

##### storage

[`SignalWireStorageContract`](SignalWireStorageContract.md)

Storage implementation

#### Returns

`Promise`\<`void`\>

***

### listProfiles()

> **listProfiles**(`type?`): `Promise`\<[`Profile`](Profile.md)[]\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:246](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L246)

List all profiles

#### Parameters

##### type?

[`ProfileType`](../enumerations/ProfileType.md)

Optional filter by profile type

#### Returns

`Promise`\<[`Profile`](Profile.md)[]\>

Array of profiles

***

### removeProfile()

> **removeProfile**(`profileId`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:232](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L232)

Remove a profile

#### Parameters

##### profileId

`string`

Profile ID to remove

#### Returns

`Promise`\<`boolean`\>

Whether the profile was removed

***

### updateProfile()

> **updateProfile**(`profileId`, `updates`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:222](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L222)

Update an existing profile

#### Parameters

##### profileId

`string`

Profile ID to update

##### updates

`Partial`\<`Omit`\<[`Profile`](Profile.md), `"id"` \| `"createdAt"`\>\>

Partial profile updates

#### Returns

`Promise`\<`boolean`\>

Whether the profile was updated
