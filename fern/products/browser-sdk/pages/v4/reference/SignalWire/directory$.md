---
title: "directory$"
---

#### Get Signature

> **get** **directory$**(): `Observable`\<[`Directory`](../interfaces/Directory.md) \| `undefined`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L763)</sub>

Observable that emits the [Directory](../interfaces/Directory.md) instance once the client is connected,
or `undefined` while disconnected. Subscribe to this to safely wait for the directory
to become available without risking an error.

##### Example

```ts
client.directory$.subscribe(dir => {
  if (dir) dir.addresses$.subscribe(console.log);
});
```

##### Returns

`Observable`\<[`Directory`](../interfaces/Directory.md) \| `undefined`\>

## directory

#### Get Signature

> **get** **directory**(): [`Directory`](../interfaces/Directory.md) \| `undefined`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L771)</sub>

Current directory snapshot, or `undefined` if the client is not yet connected.
Prefer [directory$](#directory-1) when you need to react to the directory becoming available.

##### Returns

[`Directory`](../interfaces/Directory.md) \| `undefined`
