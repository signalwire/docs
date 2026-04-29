# directory$

#### Get Signature

> **get** **directory$**(): `Observable`\<[`Directory`](../../interfaces/Directory.md) \| `undefined`\>

Defined in: [clients/SignalWire.ts:763](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L763)

Observable that emits the [Directory](../../interfaces/Directory.md) instance once the client is connected,
or `undefined` while disconnected. Subscribe to this to safely wait for the directory
to become available without risking an error.

##### Example

```ts
client.directory$.subscribe(dir => {
  if (dir) dir.addresses$.subscribe(console.log);
});
```

##### Returns

`Observable`\<[`Directory`](../../interfaces/Directory.md) \| `undefined`\>

## directory

#### Get Signature

> **get** **directory**(): [`Directory`](../../interfaces/Directory.md) \| `undefined`

Defined in: [clients/SignalWire.ts:771](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L771)

Current directory snapshot, or `undefined` if the client is not yet connected.
Prefer [directory$](#directory-1) when you need to react to the directory becoming available.

##### Returns

[`Directory`](../../interfaces/Directory.md) \| `undefined`
