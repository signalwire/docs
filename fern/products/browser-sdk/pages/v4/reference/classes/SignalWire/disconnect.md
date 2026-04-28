# disconnect

> **disconnect**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:923](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L923)

Disconnects the WebSocket and tears down the current session.

The client can be reconnected by calling [connect](#connect) again,
which creates a fresh transport and session.

#### Returns

`Promise`\<`void`\>
