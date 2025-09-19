Defined in: [packages/client/src/unified/interfaces/index.ts:7](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L7)

## Extends

- `WSClientOptions`

## Properties

### apiRequestRetriesDelay?

> `optional` **apiRequestRetriesDelay**: `number`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:145](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L145)

Initial retry delay

#### Inherited from

`WSClientOptions.apiRequestRetriesDelay`

***

### apiRequestRetriesDelayIncrement?

> `optional` **apiRequestRetriesDelayIncrement**: `number`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:143](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L143)

Increment step for each retry delay

#### Inherited from

`WSClientOptions.apiRequestRetriesDelayIncrement`

***

### contexts?

> `optional` **contexts**: `string`[]

Defined in: [packages/core/src/utils/interfaces.ts:110](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L110)

#### Inherited from

`WSClientOptions.contexts`

***

### debug?

> `optional` **debug**: `object`

Defined in: [packages/core/src/utils/interfaces.ts:126](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L126)

**`Internal`**

#### logWsTraffic?

> `optional` **logWsTraffic**: `boolean`

#### Inherited from

`WSClientOptions.debug`

***

### devTools?

> `optional` **devTools**: `boolean`

Defined in: [packages/core/src/utils/interfaces.ts:124](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L124)

**`Internal`**

#### Inherited from

`WSClientOptions.devTools`

***

### host?

> `optional` **host**: `string`

Defined in: [packages/core/src/utils/interfaces.ts:101](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L101)

**`Internal`**

#### Inherited from

`WSClientOptions.host`

***

### incomingCallHandlers?

> `optional` **incomingCallHandlers**: [`IncomingCallHandlers`](IncomingCallHandlers.md)

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:162](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L162)

Call back function to receive the incoming call

#### Inherited from

`WSClientOptions.incomingCallHandlers`

***

### instanceMap?

> `optional` **instanceMap**: `InstanceMap`

Defined in: [packages/core/src/utils/interfaces.ts:119](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L119)

#### Inherited from

`WSClientOptions.instanceMap`

***

### logger?

> `optional` **logger**: `SDKLogger`

Defined in: [packages/core/src/utils/interfaces.ts:130](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L130)

**`Internal`**

#### Inherited from

`WSClientOptions.logger`

***

### logLevel?

> `optional` **logLevel**: `"debug"` \| `"trace"` \| `"info"` \| `"warn"` \| `"error"` \| `"silent"`

Defined in: [packages/core/src/utils/interfaces.ts:115](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L115)

logging level

#### Inherited from

`WSClientOptions.logLevel`

***

### maxApiRequestRetries?

> `optional` **maxApiRequestRetries**: `number`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:147](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L147)

Max API request retry, set to 0 disable retries

#### Inherited from

`WSClientOptions.maxApiRequestRetries`

***

### profileId?

> `optional` **profileId**: `string`

Defined in: [packages/client/src/unified/interfaces/index.ts:9](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L9)

Optional profileId ID for multi-instance support. Defaults to 'default'

#### Overrides

`WSClientOptions.profileId`

***

### project?

> `optional` **project**: `string`

Defined in: [packages/core/src/utils/interfaces.ts:103](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L103)

SignalWire project id, e.g. `a10d8a9f-2166-4e82-56ff-118bc3a4840f`

#### Inherited from

`WSClientOptions.project`

***

### rootElement?

> `optional` **rootElement**: `null` \| `HTMLElement`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:97](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L97)

HTML element in which to display the video stream

#### Inherited from

`WSClientOptions.rootElement`

***

### sessionChannel?

> `optional` **sessionChannel**: `SessionChannel`

Defined in: [packages/core/src/utils/interfaces.ts:118](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L118)

#### Inherited from

`WSClientOptions.sessionChannel`

***

### shouldDisconnect()?

> `optional` **shouldDisconnect**: () => `boolean`

Defined in: [packages/client/src/unified/interfaces/index.ts:13](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L13)

#### Returns

`boolean`

***

### storage?

> `optional` **storage**: [`SignalWireStorageContract`](SignalWireStorageContract.md)

Defined in: [packages/client/src/unified/interfaces/index.ts:11](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/index.ts#L11)

Optional storage implementation for persisting client data

#### Overrides

`WSClientOptions.storage`

***

### token

> **token**: `string`

Defined in: [packages/core/src/utils/interfaces.ts:105](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L105)

SignalWire project token, e.g. `PT9e5660c101cd140a1c93a0197640a369cf5f16975a0079c9`

#### Inherited from

`WSClientOptions.token`

***

### topics?

> `optional` **topics**: `string`[]

Defined in: [packages/core/src/utils/interfaces.ts:112](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L112)

An alias for contexts - Topics has more priority over contexts

#### Inherited from

`WSClientOptions.topics`

***

### userVariables?

> `optional` **userVariables**: `Record`\<`string`, `any`\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:99](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L99)

User & UserAgent metadata

#### Inherited from

`WSClientOptions.userVariables`

## Methods

### onRefreshToken()?

> `optional` **onRefreshToken**(): `Promise`\<`string`\>

Defined in: [packages/core/src/utils/interfaces.ts:117](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/utils/interfaces.ts#L117)

Callback invoked by the SDK to fetch a new token for re-authentication

#### Returns

`Promise`\<`string`\>

#### Inherited from

`WSClientOptions.onRefreshToken`
