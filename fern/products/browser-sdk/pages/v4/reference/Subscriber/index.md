---
title: "Subscriber"
---

# Class: Subscriber

Defined in: [core/entities/Subscriber.ts:17](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L17)

Authenticated subscriber profile.

Fetched automatically when a [SignalWire](../SignalWire/index.md) connects.
Contains identity, contact, and organization details.

## Extends

- `Fetchable`\<`GetSubscriberInfoResponse`\>

## Constructors

### Constructor

> **new Subscriber**(`http`): `Subscriber`

Defined in: [core/entities/Subscriber.ts:50](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L50)

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
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Fetchable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="addresses"></a> `addresses` | `public` | `GetAddressResponse`[] | `undefined` | Fabric addresses associated with this subscriber. | - | [core/entities/Subscriber.ts:46](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L46) |
| <a id="appsettings"></a> `appSettings?` | `public` | `object` | `undefined` | Application-level settings (display name, permission scopes). | - | [core/entities/Subscriber.ts:41](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L41) |
| `appSettings.displayName` | `public` | `string` | `undefined` | - | - | [core/entities/Subscriber.ts:42](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L42) |
| `appSettings.scopes` | `public` | `string`[] | `undefined` | - | - | [core/entities/Subscriber.ts:43](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L43) |
| <a id="companyname"></a> `companyName?` | `public` | `string` | `undefined` | Company name. | - | [core/entities/Subscriber.ts:37](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L37) |
| <a id="country"></a> `country?` | `public` | `string` | `undefined` | Country code. | - | [core/entities/Subscriber.ts:33](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L33) |
| <a id="displayname"></a> `displayName?` | `public` | `string` | `undefined` | Display name shown to other participants. | - | [core/entities/Subscriber.ts:27](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L27) |
| <a id="email"></a> `email` | `public` | `string` | `undefined` | Subscriber email address. | - | [core/entities/Subscriber.ts:21](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L21) |
| <a id="fetched"></a> `fetched$` | `public` | `Observable`\<`boolean`\> | `undefined` | - | `Fetchable.fetched$` | [behaviors/Fetchable.ts:9](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Fetchable.ts#L9) |
| <a id="firstname"></a> `firstName?` | `public` | `string` | `undefined` | First name. | - | [core/entities/Subscriber.ts:23](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L23) |
| <a id="frompath"></a> `fromPath` | `public` | `string` | `undefined` | - | `Fetchable.fromPath` | [behaviors/Fetchable.ts:12](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Fetchable.ts#L12) |
| <a id="http"></a> `http` | `protected` | `HTTPRequestController` | `undefined` | - | `Fetchable.http` | [behaviors/Fetchable.ts:13](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Fetchable.ts#L13) |
| <a id="id"></a> `id` | `public` | `string` | `undefined` | Unique subscriber identifier. | - | [core/entities/Subscriber.ts:19](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L19) |
| <a id="jobtitle"></a> `jobTitle?` | `public` | `string` | `undefined` | Job title. | - | [core/entities/Subscriber.ts:29](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L29) |
| <a id="lastname"></a> `lastName?` | `public` | `string` | `undefined` | Last name. | - | [core/entities/Subscriber.ts:25](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L25) |
| <a id="pushnotificationkey"></a> `pushNotificationKey` | `public` | `string` | `undefined` | Push notification key for mobile/web push. | - | [core/entities/Subscriber.ts:39](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L39) |
| <a id="region"></a> `region?` | `public` | `string` | `undefined` | Region/state. | - | [core/entities/Subscriber.ts:35](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L35) |
| <a id="satclaims"></a> `satClaims?` | `public` | [`SATClaims`](../interfaces/SATClaims.md) | `undefined` | Filtered SAT claims when the token has special capabilities (e.g., refresh scope). | - | [core/entities/Subscriber.ts:48](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L48) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Fetchable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Fetchable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/behaviors/Destroyable.ts#L6) |
| <a id="timezone"></a> `timeZone?` | `public` | `number` | `undefined` | Time zone offset. | - | [core/entities/Subscriber.ts:31](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Subscriber.ts#L31) |

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
