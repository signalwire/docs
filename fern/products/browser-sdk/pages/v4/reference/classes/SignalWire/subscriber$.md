# subscriber$

#### Get Signature

> **get** **subscriber$**(): `Observable`\<[`Subscriber`](Subscriber.md) \| `undefined`\>

Defined in: [clients/SignalWire.ts:742](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L742)

Observable that emits the [Subscriber](Subscriber.md) profile once fetched,
or `undefined` before authentication completes.

##### Example

```ts
client.subscriber$.subscribe(sub => {
  if (sub) console.log('Logged in as', sub.email);
});
```

##### Returns

`Observable`\<[`Subscriber`](Subscriber.md) \| `undefined`\>

## subscriber

#### Get Signature

> **get** **subscriber**(): [`Subscriber`](Subscriber.md) \| `undefined`

Defined in: [clients/SignalWire.ts:747](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L747)

Current subscriber snapshot, or `undefined` if not yet authenticated.

##### Returns

[`Subscriber`](Subscriber.md) \| `undefined`
