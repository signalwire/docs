---
title: "SelfCapabilities"
---

# Class: SelfCapabilities

Defined in: [core/capabilities/SelfCapabilities.ts:27](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/capabilities/SelfCapabilities.ts#L27)

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
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L6) |

## Accessors

- [`destroyed$`](./destroyed$.md)
- [`device$`](./device$.md)
- [`end$`](./end$.md)
- [`lock$`](./lock$.md)
- [`member$`](./member$.md)
- [`screenshare$`](./screenshare$.md)
- [`self$`](./self$.md)
- [`sendDigit$`](./sendDigit$.md)
- [`setLayout$`](./setLayout$.md)
- [`state$`](./state$.md)
- [`vmutedHide$`](./vmutedHide$.md)

## Methods

- [`cachedObservable`](./cachedObservable.md)
- [`createBehaviorSubject`](./createBehaviorSubject.md)
- [`createReplaySubject`](./createReplaySubject.md)
- [`createSubject`](./createSubject.md)
- [`deferEmission`](./deferEmission.md)
- [`destroy`](./destroy.md)
- [`publicCachedObservable`](./publicCachedObservable.md)
- [`subscribeTo`](./subscribeTo.md)
