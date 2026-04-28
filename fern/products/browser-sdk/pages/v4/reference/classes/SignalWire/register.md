# register

> **register**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:973](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L973)

Registers the subscriber as online to receive inbound calls and events.

Waits for authentication to complete before sending the registration.
If the initial attempt fails, reauthentication is attempted automatically.

#### Returns

`Promise`\<`void`\>

#### Throws

If registration and reauthentication both fail.
