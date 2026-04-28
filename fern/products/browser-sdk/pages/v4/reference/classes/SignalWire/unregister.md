# unregister

> **unregister**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:1016](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1016)

Unregisters the subscriber, going offline for inbound calls.

The WebSocket connection remains open; use [disconnect](#disconnect) to fully close it.

#### Returns

`Promise`\<`void`\>
