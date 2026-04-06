# Class: SelfCapabilities

Defined in: [core/capabilities/SelfCapabilities.ts:27](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L27)

SelfCapabilities manages the capability state for the self participant.

Capabilities are received from the server via `call.joined` events and determine
what actions the current participant is allowed to perform.

Each capability is exposed as both:
- An observable (e.g., `end$`) for reactive state management
- A synchronous getter (e.g., `end`) for immediate access

Member-level capabilities are accessed via the grouped `self` / `member` accessors:
- `capabilities.self.muteAudio` (sync)
- `capabilities.self$` (observable)

When a new `call.joined` event is received, the capabilities state is
completely replaced (not merged).

## Extends

- `Destroyable`

## Constructors

### Constructor

> **new SelfCapabilities**(): `SelfCapabilities`

#### Returns

`SelfCapabilities`

#### Inherited from

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L17) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | `Destroyable.subjects` | [behaviors/Destroyable.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L16) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L15) |

## Accessors

### $

#### Get Signature

> **get** **$**(): `Observable`\<`this`\>

Defined in: [behaviors/Destroyable.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L100)

##### Returns

`Observable`\<`this`\>

#### Inherited from

`Destroyable.$`

***

### destroyed$

#### Get Signature

> **get** **destroyed$**(): `Observable`\<`void`\>

Defined in: [behaviors/Destroyable.ts:112](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L112)

Observable that emits when the instance is destroyed

##### Returns

`Observable`\<`void`\>

#### Inherited from

`Destroyable.destroyed$`

***

### device

#### Get Signature

> **get** **device**(): `boolean`

Defined in: [core/capabilities/SelfCapabilities.ts:170](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L170)

Current device capability

##### Returns

`boolean`

***

### device$

#### Get Signature

> **get** **device$**(): `Observable`\<`boolean`\>

Defined in: [core/capabilities/SelfCapabilities.ts:160](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L160)

Observable for device capability

##### Returns

`Observable`\<`boolean`\>

***

### end

#### Get Signature

> **get** **end**(): `boolean`

Defined in: [core/capabilities/SelfCapabilities.ts:95](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L95)

Current end call capability

##### Returns

`boolean`

***

### end$

#### Get Signature

> **get** **end$**(): `Observable`\<`boolean`\>

Defined in: [core/capabilities/SelfCapabilities.ts:85](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L85)

Observable for end call capability

##### Returns

`Observable`\<`boolean`\>

***

### lock

#### Get Signature

> **get** **lock**(): [`OnOffCapability`](../interfaces/OnOffCapability.md)

Defined in: [core/capabilities/SelfCapabilities.ts:155](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L155)

Current lock capability

##### Returns

[`OnOffCapability`](../interfaces/OnOffCapability.md)

***

### lock$

#### Get Signature

> **get** **lock$**(): `Observable`\<[`OnOffCapability`](../interfaces/OnOffCapability.md)\>

Defined in: [core/capabilities/SelfCapabilities.ts:145](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L145)

Observable for lock capability

##### Returns

`Observable`\<[`OnOffCapability`](../interfaces/OnOffCapability.md)\>

***

### member

#### Get Signature

> **get** **member**(): [`MemberCapabilities`](../interfaces/MemberCapabilities.md)

Defined in: [core/capabilities/SelfCapabilities.ts:76](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L76)

Current other member capabilities

##### Returns

[`MemberCapabilities`](../interfaces/MemberCapabilities.md)

***

### member$

#### Get Signature

> **get** **member$**(): `Observable`\<[`MemberCapabilities`](../interfaces/MemberCapabilities.md)\>

Defined in: [core/capabilities/SelfCapabilities.ts:66](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L66)

Observable for other member capabilities

##### Returns

`Observable`\<[`MemberCapabilities`](../interfaces/MemberCapabilities.md)\>

***

### screenshare

#### Get Signature

> **get** **screenshare**(): `boolean`

Defined in: [core/capabilities/SelfCapabilities.ts:185](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L185)

Current screenshare capability

##### Returns

`boolean`

***

### screenshare$

#### Get Signature

> **get** **screenshare$**(): `Observable`\<`boolean`\>

Defined in: [core/capabilities/SelfCapabilities.ts:175](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L175)

Observable for screenshare capability

##### Returns

`Observable`\<`boolean`\>

***

### self

#### Get Signature

> **get** **self**(): [`MemberCapabilities`](../interfaces/MemberCapabilities.md)

Defined in: [core/capabilities/SelfCapabilities.ts:57](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L57)

Current self member capabilities

##### Returns

[`MemberCapabilities`](../interfaces/MemberCapabilities.md)

***

### self$

#### Get Signature

> **get** **self$**(): `Observable`\<[`MemberCapabilities`](../interfaces/MemberCapabilities.md)\>

Defined in: [core/capabilities/SelfCapabilities.ts:47](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L47)

Observable for self member capabilities

##### Returns

`Observable`\<[`MemberCapabilities`](../interfaces/MemberCapabilities.md)\>

***

### sendDigit

#### Get Signature

> **get** **sendDigit**(): `boolean`

Defined in: [core/capabilities/SelfCapabilities.ts:125](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L125)

Current send digit capability

##### Returns

`boolean`

***

### sendDigit$

#### Get Signature

> **get** **sendDigit$**(): `Observable`\<`boolean`\>

Defined in: [core/capabilities/SelfCapabilities.ts:115](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L115)

Observable for send digit capability

##### Returns

`Observable`\<`boolean`\>

***

### setLayout

#### Get Signature

> **get** **setLayout**(): `boolean`

Defined in: [core/capabilities/SelfCapabilities.ts:110](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L110)

Current set layout capability

##### Returns

`boolean`

***

### setLayout$

#### Get Signature

> **get** **setLayout$**(): `Observable`\<`boolean`\>

Defined in: [core/capabilities/SelfCapabilities.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L100)

Observable for set layout capability

##### Returns

`Observable`\<`boolean`\>

***

### state

#### Get Signature

> **get** **state**(): [`CallCapabilitiesState`](../interfaces/CallCapabilitiesState.md)

Defined in: [core/capabilities/SelfCapabilities.ts:199](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L199)

Current full capabilities state

##### Returns

[`CallCapabilitiesState`](../interfaces/CallCapabilitiesState.md)

***

### state$

#### Get Signature

> **get** **state$**(): `Observable`\<[`CallCapabilitiesState`](../interfaces/CallCapabilitiesState.md)\>

Defined in: [core/capabilities/SelfCapabilities.ts:194](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L194)

Observable for the full capabilities state

##### Returns

`Observable`\<[`CallCapabilitiesState`](../interfaces/CallCapabilitiesState.md)\>

***

### vmutedHide

#### Get Signature

> **get** **vmutedHide**(): [`OnOffCapability`](../interfaces/OnOffCapability.md)

Defined in: [core/capabilities/SelfCapabilities.ts:140](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L140)

Current vmuted hide capability

##### Returns

[`OnOffCapability`](../interfaces/OnOffCapability.md)

***

### vmutedHide$

#### Get Signature

> **get** **vmutedHide$**(): `Observable`\<[`OnOffCapability`](../interfaces/OnOffCapability.md)\>

Defined in: [core/capabilities/SelfCapabilities.ts:130](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/capabilities/SelfCapabilities.ts#L130)

Observable for vmuted hide capability

##### Returns

`Observable`\<[`OnOffCapability`](../interfaces/OnOffCapability.md)\>

## Methods

### cachedObservable()

> `protected` **cachedObservable**\<`T`\>(`key`, `factory`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:28](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L28)

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

`Destroyable.cachedObservable`

***

### createBehaviorSubject()

> `protected` **createBehaviorSubject**\<`T`\>(`initialValue`): `BehaviorSubject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:94](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L94)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `initialValue` | `T` |

#### Returns

`BehaviorSubject`\<`T`\>

#### Inherited from

`Destroyable.createBehaviorSubject`

***

### createReplaySubject()

> `protected` **createReplaySubject**\<`T`\>(`bufferSize?`, `windowTime?`): `ReplaySubject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:88](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L88)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `bufferSize?` | `number` |
| `windowTime?` | `number` |

#### Returns

`ReplaySubject`\<`T`\>

#### Inherited from

`Destroyable.createReplaySubject`

***

### createSubject()

> `protected` **createSubject**\<`T`\>(): `Subject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:82](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L82)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Returns

`Subject`\<`T`\>

#### Inherited from

`Destroyable.createSubject`

***

### deferEmission()

> `protected` **deferEmission**\<`T`\>(`observable`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:70](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L70)

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

`Destroyable.deferEmission`

***

### destroy()

> **destroy**(): `void`

Defined in: [behaviors/Destroyable.ts:20](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L20)

#### Returns

`void`

#### Inherited from

`Destroyable.destroy`

***

### publicCachedObservable()

> `protected` **publicCachedObservable**\<`T`\>(`key`, `factory`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:51](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L51)

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

***

### subscribeTo()

> `protected` **subscribeTo**\<`T`\>(`observable`, `observerOrNext`): `void`

Defined in: [behaviors/Destroyable.ts:74](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L74)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `observable` | `Observable`\<`T`\> |
| `observerOrNext` | `Partial`\<`Observer`\<`T`\>\> \| ((`value`) => `void`) \| `undefined` |

#### Returns

`void`

#### Inherited from

`Destroyable.subscribeTo`
