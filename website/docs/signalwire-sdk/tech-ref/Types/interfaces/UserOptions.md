Defined in: [packages/core/src/utils/interfaces.ts:122](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L122)

## Extends

- `SessionOptions`

## Properties

### contexts?

> `optional` **contexts**: `string`[]

Defined in: [packages/core/src/utils/interfaces.ts:110](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L110)

#### Inherited from

`SessionOptions.contexts`

***

### debug?

> `optional` **debug**: `object`

Defined in: [packages/core/src/utils/interfaces.ts:126](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L126)

**`Internal`**

#### logWsTraffic?

> `optional` **logWsTraffic**: `boolean`

***

### devTools?

> `optional` **devTools**: `boolean`

Defined in: [packages/core/src/utils/interfaces.ts:124](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L124)

**`Internal`**

***

### host?

> `optional` **host**: `string`

Defined in: [packages/core/src/utils/interfaces.ts:101](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L101)

**`Internal`**

#### Inherited from

`SessionOptions.host`

***

### instanceMap?

> `optional` **instanceMap**: `InstanceMap`

Defined in: [packages/core/src/utils/interfaces.ts:119](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L119)

#### Inherited from

`SessionOptions.instanceMap`

***

### logger?

> `optional` **logger**: `SDKLogger`

Defined in: [packages/core/src/utils/interfaces.ts:130](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L130)

**`Internal`**

***

### logLevel?

> `optional` **logLevel**: `"debug"` \| `"trace"` \| `"info"` \| `"warn"` \| `"error"` \| `"silent"`

Defined in: [packages/core/src/utils/interfaces.ts:115](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L115)

logging level

#### Inherited from

`SessionOptions.logLevel`

***

### profileId?

> `optional` **profileId**: `string`

Defined in: [packages/core/src/utils/interfaces.ts:108](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L108)

**`Internal`**

#### Inherited from

`SessionOptions.profileId`

***

### project?

> `optional` **project**: `string`

Defined in: [packages/core/src/utils/interfaces.ts:103](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L103)

SignalWire project id, e.g. `a10d8a9f-2166-4e82-56ff-118bc3a4840f`

#### Inherited from

`SessionOptions.project`

***

### sessionChannel?

> `optional` **sessionChannel**: `SessionChannel`

Defined in: [packages/core/src/utils/interfaces.ts:118](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L118)

#### Inherited from

`SessionOptions.sessionChannel`

***

### token

> **token**: `string`

Defined in: [packages/core/src/utils/interfaces.ts:105](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L105)

SignalWire project token, e.g. `PT9e5660c101cd140a1c93a0197640a369cf5f16975a0079c9`

#### Inherited from

`SessionOptions.token`

***

### topics?

> `optional` **topics**: `string`[]

Defined in: [packages/core/src/utils/interfaces.ts:112](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L112)

An alias for contexts - Topics has more priority over contexts

#### Inherited from

`SessionOptions.topics`

## Methods

### onRefreshToken()?

> `optional` **onRefreshToken**(): `Promise`\<`string`\>

Defined in: [packages/core/src/utils/interfaces.ts:117](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L117)

Callback invoked by the SDK to fetch a new token for re-authentication

#### Returns

`Promise`\<`string`\>

#### Inherited from

`SessionOptions.onRefreshToken`
