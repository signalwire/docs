---
title: "hangup"
---

# hangup

> **hangup**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:1205](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1205)

Hangs up the call and releases all resources.

Sends a Verto `bye` to the server, transitions status to `'disconnecting'`,
then destroys the call. After this, the call instance is no longer usable.

#### Returns

`Promise`\<`void`\>

#### Example

```ts
await call.hangup();
```

#### Implementation of

`CallManager.hangup`
