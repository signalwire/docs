---
title: "Subscriber"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L17)</sub>

Authenticated subscriber profile.

Fetched automatically when a [SignalWire](../SignalWire/index.md) connects.
Contains identity, contact, and organization details.

## Extends

- `Fetchable`\<`GetSubscriberInfoResponse`\>

## Constructors

### Constructor

> **new Subscriber**(`http`): `Subscriber`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L50)</sub>

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `http` | `HTTPRequestController` |

#### Returns

`Subscriber`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Fetchable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L8) |
| `addresses` | `public` | `GetAddressResponse`[] | `undefined` | Fabric addresses associated with this subscriber. | - | [core/entities/Subscriber.ts:46](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L46) |
| `appSettings?` | `public` | `object` | `undefined` | Application-level settings (display name, permission scopes). | - | [core/entities/Subscriber.ts:41](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L41) |
| `appSettings.displayName` | `public` | `string` | `undefined` | - | - | [core/entities/Subscriber.ts:42](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L42) |
| `appSettings.scopes` | `public` | `string`[] | `undefined` | - | - | [core/entities/Subscriber.ts:43](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L43) |
| `companyName?` | `public` | `string` | `undefined` | Company name. | - | [core/entities/Subscriber.ts:37](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L37) |
| `country?` | `public` | `string` | `undefined` | Country code. | - | [core/entities/Subscriber.ts:33](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L33) |
| `displayName?` | `public` | `string` | `undefined` | Display name shown to other participants. | - | [core/entities/Subscriber.ts:27](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L27) |
| `email` | `public` | `string` | `undefined` | Subscriber email address. | - | [core/entities/Subscriber.ts:21](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L21) |
| `fetched$` | `public` | `Observable`\<`boolean`\> | `undefined` | - | `Fetchable.fetched$` | [behaviors/Fetchable.ts:9](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Fetchable.ts#L9) |
| `firstName?` | `public` | `string` | `undefined` | First name. | - | [core/entities/Subscriber.ts:23](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L23) |
| `fromPath` | `public` | `string` | `undefined` | - | `Fetchable.fromPath` | [behaviors/Fetchable.ts:12](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Fetchable.ts#L12) |
| `http` | `protected` | `HTTPRequestController` | `undefined` | - | `Fetchable.http` | [behaviors/Fetchable.ts:13](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Fetchable.ts#L13) |
| `id` | `public` | `string` | `undefined` | Unique subscriber identifier. | - | [core/entities/Subscriber.ts:19](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L19) |
| `jobTitle?` | `public` | `string` | `undefined` | Job title. | - | [core/entities/Subscriber.ts:29](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L29) |
| `lastName?` | `public` | `string` | `undefined` | Last name. | - | [core/entities/Subscriber.ts:25](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L25) |
| `pushNotificationKey` | `public` | `string` | `undefined` | Push notification key for mobile/web push. | - | [core/entities/Subscriber.ts:39](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L39) |
| `region?` | `public` | `string` | `undefined` | Region/state. | - | [core/entities/Subscriber.ts:35](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L35) |
| `satClaims?` | `public` | [`SATClaims`](../interfaces/SATClaims.md) | `undefined` | Filtered SAT claims when the token has special capabilities (e.g., refresh scope). | - | [core/entities/Subscriber.ts:48](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L48) |
| `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Fetchable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L7) |
| `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Fetchable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L6) |
| `timeZone?` | `public` | `number` | `undefined` | Time zone offset. | - | [core/entities/Subscriber.ts:31](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L31) |

## Accessors

- [`destroyed$`](./destroyed$.md)

## Methods

- [`cachedObservable`](./cachedObservable.md)
- [`createBehaviorSubject`](./createBehaviorSubject.md)
- [`createReplaySubject`](./createReplaySubject.md)
- [`createSubject`](./createSubject.md)
- [`deferEmission`](./deferEmission.md)
- [`destroy`](./destroy.md)
- [`populateInstance`](./populateInstance.md)
- [`publicCachedObservable`](./publicCachedObservable.md)
- [`subscribeTo`](./subscribeTo.md)
