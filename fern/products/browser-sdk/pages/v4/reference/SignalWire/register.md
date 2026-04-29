---
title: "register"
---

# register

> **register**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:973](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L973)

Registers the subscriber as online to receive inbound calls and events.

Waits for authentication to complete before sending the registration.
If the initial attempt fails, reauthentication is attempted automatically.

#### Returns

`Promise`\<`void`\>

#### Throws

If registration and reauthentication both fail.
