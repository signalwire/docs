# Class: Subscriber

Defined in: [core/entities/Subscriber.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L17)

Authenticated subscriber profile.

Fetched automatically when a [SignalWire](SignalWire.md) connects.
Contains identity, contact, and organization details.

## Extends

- `Fetchable`\<`GetSubscriberInfoResponse`\>

## Constructors

### Constructor

> **new Subscriber**(`http`): `Subscriber`

Defined in: [core/entities/Subscriber.ts:50](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L50)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `http` | `HTTPRequestController` |

#### Returns

`Subscriber`

#### Overrides

`Fetchable<GetSubscriberInfoResponse>.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Fetchable._destroyed$` | [behaviors/Destroyable.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L17) |
| <a id="addresses"></a> `addresses` | `public` | `GetAddressResponse`[] | `undefined` | Fabric addresses associated with this subscriber. | - | [core/entities/Subscriber.ts:46](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L46) |
| <a id="appsettings"></a> `appSettings?` | `public` | `object` | `undefined` | Application-level settings (display name, permission scopes). | - | [core/entities/Subscriber.ts:41](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L41) |
| `appSettings.displayName` | `public` | `string` | `undefined` | - | - | [core/entities/Subscriber.ts:42](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L42) |
| `appSettings.scopes` | `public` | `string`[] | `undefined` | - | - | [core/entities/Subscriber.ts:43](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L43) |
| <a id="companyname"></a> `companyName?` | `public` | `string` | `undefined` | Company name. | - | [core/entities/Subscriber.ts:37](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L37) |
| <a id="country"></a> `country?` | `public` | `string` | `undefined` | Country code. | - | [core/entities/Subscriber.ts:33](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L33) |
| <a id="displayname"></a> `displayName?` | `public` | `string` | `undefined` | Display name shown to other participants. | - | [core/entities/Subscriber.ts:27](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L27) |
| <a id="email"></a> `email` | `public` | `string` | `undefined` | Subscriber email address. | - | [core/entities/Subscriber.ts:21](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L21) |
| <a id="fetched"></a> `fetched$` | `public` | `Observable`\<`boolean`\> | `undefined` | - | `Fetchable.fetched$` | [behaviors/Fetchable.ts:9](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Fetchable.ts#L9) |
| <a id="firstname"></a> `firstName?` | `public` | `string` | `undefined` | First name. | - | [core/entities/Subscriber.ts:23](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L23) |
| <a id="frompath"></a> `fromPath` | `public` | `string` | `undefined` | - | `Fetchable.fromPath` | [behaviors/Fetchable.ts:12](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Fetchable.ts#L12) |
| <a id="http"></a> `http` | `protected` | `HTTPRequestController` | `undefined` | - | `Fetchable.http` | [behaviors/Fetchable.ts:13](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Fetchable.ts#L13) |
| <a id="id"></a> `id` | `public` | `string` | `undefined` | Unique subscriber identifier. | - | [core/entities/Subscriber.ts:19](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L19) |
| <a id="jobtitle"></a> `jobTitle?` | `public` | `string` | `undefined` | Job title. | - | [core/entities/Subscriber.ts:29](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L29) |
| <a id="lastname"></a> `lastName?` | `public` | `string` | `undefined` | Last name. | - | [core/entities/Subscriber.ts:25](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L25) |
| <a id="pushnotificationkey"></a> `pushNotificationKey` | `public` | `string` | `undefined` | Push notification key for mobile/web push. | - | [core/entities/Subscriber.ts:39](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L39) |
| <a id="region"></a> `region?` | `public` | `string` | `undefined` | Region/state. | - | [core/entities/Subscriber.ts:35](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L35) |
| <a id="satclaims"></a> `satClaims?` | `public` | [`SATClaims`](../interfaces/SATClaims.md) | `undefined` | Filtered SAT claims when the token has special capabilities (e.g., refresh scope). | - | [core/entities/Subscriber.ts:48](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L48) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Fetchable.subjects` | [behaviors/Destroyable.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L16) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Fetchable.subscriptions` | [behaviors/Destroyable.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L15) |
| <a id="timezone"></a> `timeZone?` | `public` | `number` | `undefined` | Time zone offset. | - | [core/entities/Subscriber.ts:31](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L31) |

## Accessors

### $

#### Get Signature

> **get** **$**(): `Observable`\<`this`\>

Defined in: [behaviors/Destroyable.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L100)

##### Returns

`Observable`\<`this`\>

#### Inherited from

`Fetchable.$`

***

### destroyed$

#### Get Signature

> **get** **destroyed$**(): `Observable`\<`void`\>

Defined in: [behaviors/Destroyable.ts:112](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L112)

Observable that emits when the instance is destroyed

##### Returns

`Observable`\<`void`\>

#### Inherited from

`Fetchable.destroyed$`

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

`Fetchable.cachedObservable`

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

`Fetchable.createBehaviorSubject`

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

`Fetchable.createReplaySubject`

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

`Fetchable.createSubject`

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

`Fetchable.deferEmission`

***

### destroy()

> **destroy**(): `void`

Defined in: [behaviors/Destroyable.ts:20](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L20)

#### Returns

`void`

#### Inherited from

`Fetchable.destroy`

***

### populateInstance()

> `protected` **populateInstance**(`data`): `void`

Defined in: [core/entities/Subscriber.ts:54](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Subscriber.ts#L54)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `data` | `GetSubscriberInfoResponse` |

#### Returns

`void`

#### Overrides

`Fetchable.populateInstance`

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

`Fetchable.publicCachedObservable`

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

`Fetchable.subscribeTo`
