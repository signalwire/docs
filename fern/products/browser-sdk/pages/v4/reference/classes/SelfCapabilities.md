# Class: SelfCapabilities

Defined in: [core/capabilities/SelfCapabilities.ts:27](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/capabilities/SelfCapabilities.ts#L27)

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
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |

## Accessors

- [`destroyed$`](./SelfCapabilities/destroyed$.md)
- [`device`](./SelfCapabilities/device.md)
- [`device$`](./SelfCapabilities/device$.md)
- [`end`](./SelfCapabilities/end.md)
- [`end$`](./SelfCapabilities/end$.md)
- [`lock`](./SelfCapabilities/lock.md)
- [`lock$`](./SelfCapabilities/lock$.md)
- [`member`](./SelfCapabilities/member.md)
- [`member$`](./SelfCapabilities/member$.md)
- [`screenshare`](./SelfCapabilities/screenshare.md)
- [`screenshare$`](./SelfCapabilities/screenshare$.md)
- [`self`](./SelfCapabilities/self.md)
- [`self$`](./SelfCapabilities/self$.md)
- [`sendDigit`](./SelfCapabilities/sendDigit.md)
- [`sendDigit$`](./SelfCapabilities/sendDigit$.md)
- [`setLayout`](./SelfCapabilities/setLayout.md)
- [`setLayout$`](./SelfCapabilities/setLayout$.md)
- [`state`](./SelfCapabilities/state.md)
- [`state$`](./SelfCapabilities/state$.md)
- [`vmutedHide`](./SelfCapabilities/vmutedHide.md)
- [`vmutedHide$`](./SelfCapabilities/vmutedHide$.md)

## Methods

- [`cachedObservable`](./SelfCapabilities/cachedObservable.md)
- [`createBehaviorSubject`](./SelfCapabilities/createBehaviorSubject.md)
- [`createReplaySubject`](./SelfCapabilities/createReplaySubject.md)
- [`createSubject`](./SelfCapabilities/createSubject.md)
- [`deferEmission`](./SelfCapabilities/deferEmission.md)
- [`destroy`](./SelfCapabilities/destroy.md)
- [`publicCachedObservable`](./SelfCapabilities/publicCachedObservable.md)
- [`subscribeTo`](./SelfCapabilities/subscribeTo.md)
