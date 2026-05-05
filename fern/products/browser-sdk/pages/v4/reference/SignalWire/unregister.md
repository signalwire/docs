---
title: "unregister"
---

> **unregister**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1016)</sub>

Unregisters the subscriber, going offline for inbound calls.

The WebSocket connection remains open; use [disconnect](#disconnect) to fully close it.

#### Returns

`Promise`\<`void`\>
