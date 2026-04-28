# directory

#### Get Signature

> **get** **directory**(): [`Directory`](../../interfaces/Directory.md) \| `undefined`

Defined in: [clients/SignalWire.ts:771](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L771)

Current directory snapshot, or `undefined` if the client is not yet connected.
Prefer [directory$](#directory-1) when you need to react to the directory becoming available.

##### Returns

[`Directory`](../../interfaces/Directory.md) \| `undefined`
