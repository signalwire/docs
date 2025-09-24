> `const` **SignalWire**: (`params`) => `Promise`\<[`SignalWireContract`](../../../../interfaces/SignalWireContract.md)\>

Defined in: [packages/client/src/unified/SignalWire.ts:21](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/SignalWire.ts#L21)

Legacy singleton SignalWire function - kept for backward compatibility

## Parameters

### params

[`SignalWireClientParams`](../../../../interfaces/SignalWireClientParams.md)

SignalWire client parameters including optional profileId and storage

## Returns

`Promise`\<[`SignalWireContract`](../../../../interfaces/SignalWireContract.md)\>

Promise resolving to SignalWireClient

Note: Singleton behavior is maintained only when profileId is 'default' (or omitted)
and no custom storage is provided. Otherwise, a new instance is created each time.
