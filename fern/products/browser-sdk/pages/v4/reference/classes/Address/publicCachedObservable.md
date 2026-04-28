# publicCachedObservable

> `protected` **publicCachedObservable**\<`T`\>(`key`, `factory`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:42](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L42)

Like `cachedObservable`, but defers emissions to the microtask queue
via `observeOn(asapScheduler)`.

Use ONLY for public-facing observable getters that external consumers
subscribe to. Prevents a class of bugs where `BehaviorSubject` or
`ReplaySubject` replays synchronously during `subscribe()`, before
the subscription variable is assigned in the caller's scope.

Do NOT use for observables consumed internally by the SDK — internal
code using `subscribeTo()`, `firstValueFrom()`, or `withLatestFrom()`
depends on synchronous emission delivery.

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `factory` | () => `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

`Destroyable.publicCachedObservable`
