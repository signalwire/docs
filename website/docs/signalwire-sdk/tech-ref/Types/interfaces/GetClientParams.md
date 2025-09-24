Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:115](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L115)

Parameters for getting a client instance

## Properties

### addressId?

> `optional` **addressId**: `string`

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:119](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L119)

Address ID to find a suitable profile for. Used if profileId is not provided

***

### options

> **options**: [`GetClientParamsOptions`](../type-aliases/GetClientParamsOptions.md)

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:121](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L121)

Signalwire client options

***

### profileId?

> `optional` **profileId**: `string`

Defined in: [packages/client/src/unified/interfaces/clientFactory.ts:117](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/clientFactory.ts#L117)

Profile ID to use for the client. Takes priority over addressId
