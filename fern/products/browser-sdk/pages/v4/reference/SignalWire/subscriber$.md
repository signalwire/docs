---
title: "subscriber$"
---

# subscriber$

#### Get Signature

> **get** **subscriber$**(): `Observable`\<[`Subscriber`](../Subscriber/index.md) \| `undefined`\>

Defined in: [clients/SignalWire.ts:742](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L742)

Observable that emits the [Subscriber](../Subscriber/index.md) profile once fetched,
or `undefined` before authentication completes.

##### Example

```ts
client.subscriber$.subscribe(sub => {
  if (sub) console.log('Logged in as', sub.email);
});
```

##### Returns

`Observable`\<[`Subscriber`](../Subscriber/index.md) \| `undefined`\>

## subscriber

#### Get Signature

> **get** **subscriber**(): [`Subscriber`](../Subscriber/index.md) \| `undefined`

Defined in: [clients/SignalWire.ts:747](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L747)

Current subscriber snapshot, or `undefined` if not yet authenticated.

##### Returns

[`Subscriber`](../Subscriber/index.md) \| `undefined`
