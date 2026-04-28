# deferEmission

> `protected` **deferEmission**\<`T`\>(`observable`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:61](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L61)

Wraps an observable so emissions are deferred to the microtask queue.

Use ONLY for public-facing getters that expose a subject via
`.asObservable()` without going through `cachedObservable`.

Do NOT use for observables consumed internally by the SDK.

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `observable` | `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

`Fetchable.deferEmission`
