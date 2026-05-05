---
title: "disconnect"
---

> **disconnect**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L923)</sub>

Disconnects the WebSocket and tears down the current session.

The client can be reconnected by calling [connect](#connect) again,
which creates a fresh transport and session.

#### Returns

`Promise`\<`void`\>
