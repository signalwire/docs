Defined in: [packages/client/src/unified/ProfileManager.ts:22](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L22)

Manages authentication profiles for SignalWire client instances.
Handles both persistent (static) and memory-only (dynamic) profiles.

## Implements

- [`ProfileManagerContract`](../interfaces/ProfileManagerContract.md)

## Constructors

### Constructor

> **new ProfileManager**(): `ProfileManager`

#### Returns

`ProfileManager`

## Methods

### addProfile()

> **addProfile**(`profile`): `Promise`\<`string`\>

Defined in: [packages/client/src/unified/ProfileManager.ts:65](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L65)

Add a new profile

#### Parameters

##### profile

`Omit`\<[`Profile`](../interfaces/Profile.md), `"id"` \| `"createdAt"` \| `"updatedAt"` \| `"lastUsed"`\>

Profile to add (without id, createdAt, updatedAt, lastUsed)

#### Returns

`Promise`\<`string`\>

Created profile ID

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`addProfile`](../interfaces/ProfileManagerContract.md#addprofile)

***

### cleanup()

> **cleanup**(): `void`

Defined in: [packages/client/src/unified/ProfileManager.ts:464](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L464)

Cleanup all timers and resources

#### Returns

`void`

***

### createDynamicProfile()

> **createDynamicProfile**(`parentProfile`, `addressId`): `Promise`\<[`Profile`](../interfaces/Profile.md)\>

Defined in: [packages/client/src/unified/ProfileManager.ts:681](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L681)

Create a dynamic profile for accessing a shared resource

#### Parameters

##### parentProfile

[`Profile`](../interfaces/Profile.md)

Profile to inherit credentials from

##### addressId

`string`

Address ID for the shared resource

#### Returns

`Promise`\<[`Profile`](../interfaces/Profile.md)\>

Created dynamic profile

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`createDynamicProfile`](../interfaces/ProfileManagerContract.md#createdynamicprofile)

***

### findProfileForAddress()

> **findProfileForAddress**(`addressId`): `Promise`\<`null` \| [`Profile`](../interfaces/Profile.md)\>

Defined in: [packages/client/src/unified/ProfileManager.ts:577](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L577)

Find a profile that has access to a specific address

#### Parameters

##### addressId

`string`

Address identifier to search for

#### Returns

`Promise`\<`null` \| [`Profile`](../interfaces/Profile.md)\>

Profile that has access or null if not found

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`findProfileForAddress`](../interfaces/ProfileManagerContract.md#findprofileforaddress)

***

### getProfile()

> **getProfile**(`profileId`): `Promise`\<`null` \| [`Profile`](../interfaces/Profile.md)\>

Defined in: [packages/client/src/unified/ProfileManager.ts:184](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L184)

Get a profile by ID

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`null` \| [`Profile`](../interfaces/Profile.md)\>

Profile or null if not found

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`getProfile`](../interfaces/ProfileManagerContract.md#getprofile)

***

### getProfilesByCredentialId()

> **getProfilesByCredentialId**(`credentialId`): `Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Defined in: [packages/client/src/unified/ProfileManager.ts:661](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L661)

Get all profiles associated with a credential ID

#### Parameters

##### credentialId

`string`

Credential identifier

#### Returns

`Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Array of profiles with the given credential ID

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`getProfilesByCredentialId`](../interfaces/ProfileManagerContract.md#getprofilesbycredentialid)

***

### hasProfile()

> **hasProfile**(`profileId`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/ProfileManager.ts:231](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L231)

Check if a profile exists

#### Parameters

##### profileId

`string`

Profile identifier

#### Returns

`Promise`\<`boolean`\>

Whether the profile exists

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`hasProfile`](../interfaces/ProfileManagerContract.md#hasprofile)

***

### init()

> **init**(`storage`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/ProfileManager.ts:34](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L34)

Initialize the profile manager with storage

#### Parameters

##### storage

[`SignalWireStorageContract`](../interfaces/SignalWireStorageContract.md)

Storage implementation for persistent profiles

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`init`](../interfaces/ProfileManagerContract.md#init)

***

### listProfiles()

> **listProfiles**(`type?`): `Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Defined in: [packages/client/src/unified/ProfileManager.ts:206](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L206)

List all profiles

#### Parameters

##### type?

[`ProfileType`](../enumerations/ProfileType.md)

Optional filter by profile type

#### Returns

`Promise`\<[`Profile`](../interfaces/Profile.md)[]\>

Array of profiles

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`listProfiles`](../interfaces/ProfileManagerContract.md#listprofiles)

***

### refreshCredentials()

> **refreshCredentials**(`profileId`): `Promise`\<`void`\>

Defined in: [packages/client/src/unified/ProfileManager.ts:328](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L328)

Refresh credentials for a profile

#### Parameters

##### profileId

`string`

Profile ID to refresh credentials for

#### Returns

`Promise`\<`void`\>

#### Throws

CredentialRefreshError if refresh fails

***

### removeProfile()

> **removeProfile**(`profileId`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/ProfileManager.ts:149](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L149)

Remove a profile

#### Parameters

##### profileId

`string`

Profile ID to remove

#### Returns

`Promise`\<`boolean`\>

Whether the profile was removed

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`removeProfile`](../interfaces/ProfileManagerContract.md#removeprofile)

***

### scheduleRefresh()

> **scheduleRefresh**(`profile`): `void`

Defined in: [packages/client/src/unified/ProfileManager.ts:410](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L410)

Schedule automatic credential refresh

#### Parameters

##### profile

[`Profile`](../interfaces/Profile.md)

Profile to schedule refresh for

#### Returns

`void`

***

### updateProfile()

> **updateProfile**(`profileId`, `updates`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/ProfileManager.ts:114](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L114)

Update an existing profile

#### Parameters

##### profileId

`string`

Profile ID to update

##### updates

`Partial`\<`Omit`\<[`Profile`](../interfaces/Profile.md), `"id"` \| `"createdAt"`\>\>

Partial profile updates

#### Returns

`Promise`\<`boolean`\>

Whether the profile was updated

#### Implementation of

[`ProfileManagerContract`](../interfaces/ProfileManagerContract.md).[`updateProfile`](../interfaces/ProfileManagerContract.md#updateprofile)

***

### validateCredentials()

> **validateCredentials**(`profileId`): `Promise`\<`boolean`\>

Defined in: [packages/client/src/unified/ProfileManager.ts:375](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/ProfileManager.ts#L375)

Validate if credentials are still valid

#### Parameters

##### profileId

`string`

Profile ID to validate

#### Returns

`Promise`\<`boolean`\>

true if credentials are valid, false otherwise
