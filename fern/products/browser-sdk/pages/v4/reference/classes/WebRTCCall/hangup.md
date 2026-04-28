# hangup

> **hangup**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:1205](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1205)

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
