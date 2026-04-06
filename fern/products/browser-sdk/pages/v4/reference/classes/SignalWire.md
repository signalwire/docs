# Class: SignalWire

Defined in: [clients/SignalWire.ts:93](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L93)

Main entry point for the SignalWire Browser SDK.

Manages authentication, WebSocket transport, call creation, and media devices.

## Example

```ts
const client = new SignalWire(credentialProvider);
client.isConnected$.subscribe(connected => console.log('Connected:', connected));
const call = await client.dial('/public/my-room');
```

## Extends

- `Destroyable`

## Implements

- [`DeviceController`](../interfaces/DeviceController.md)

## Constructors

### Constructor

> **new SignalWire**(`credentialProvider`, `options?`): `SignalWire`

Defined in: [clients/SignalWire.ts:119](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L119)

Creates a new SignalWire client and begins connecting.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `credentialProvider` | [`CredentialProvider`](../interfaces/CredentialProvider.md) | Provider that supplies authentication credentials. |
| `options` | [`SignalWireOptions`](../interfaces/SignalWireOptions.md) | Configuration options (connection, device monitoring, preferences). |

#### Returns

`SignalWire`

#### Overrides

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L17) |
| <a id="preferences"></a> `preferences` | `public` | [`ClientPreferences`](ClientPreferences.md) | `undefined` | Global SDK preferences (timeouts, ICE config, media defaults). | - | [clients/SignalWire.ts:95](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L95) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L16) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L15) |

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

### audioInputDevices

#### Get Signature

> **get** **audioInputDevices**(): `MediaDeviceInfo`[]

Defined in: [clients/SignalWire.ts:708](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L708)

Current snapshot of available audio input devices.

##### Returns

`MediaDeviceInfo`[]

Current snapshot of available audio input devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`audioInputDevices`](../interfaces/DeviceController.md#audioinputdevices)

***

### audioInputDevices$

#### Get Signature

> **get** **audioInputDevices$**(): `Observable`\<`MediaDeviceInfo`[]\>

Defined in: [clients/SignalWire.ts:703](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L703)

Observable list of available audio input (microphone) devices.

##### Returns

`Observable`\<`MediaDeviceInfo`[]\>

Observable list of available audio input (microphone) devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`audioInputDevices$`](../interfaces/DeviceController.md#audioinputdevices-1)

***

### audioOutputDevices

#### Get Signature

> **get** **audioOutputDevices**(): `MediaDeviceInfo`[]

Defined in: [clients/SignalWire.ts:718](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L718)

Current snapshot of available audio output devices.

##### Returns

`MediaDeviceInfo`[]

Current snapshot of available audio output devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`audioOutputDevices`](../interfaces/DeviceController.md#audiooutputdevices)

***

### audioOutputDevices$

#### Get Signature

> **get** **audioOutputDevices$**(): `Observable`\<`MediaDeviceInfo`[]\>

Defined in: [clients/SignalWire.ts:713](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L713)

Observable list of available audio output (speaker) devices.

##### Returns

`Observable`\<`MediaDeviceInfo`[]\>

Observable list of available audio output (speaker) devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`audioOutputDevices$`](../interfaces/DeviceController.md#audiooutputdevices-1)

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

### directory

#### Get Signature

> **get** **directory**(): [`Directory`](../interfaces/Directory.md) \| `undefined`

Defined in: [clients/SignalWire.ts:537](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L537)

Current directory snapshot, or `undefined` if the client is not yet connected.
Prefer [directory$](#directory-1) when you need to react to the directory becoming available.

##### Returns

[`Directory`](../interfaces/Directory.md) \| `undefined`

***

### directory$

#### Get Signature

> **get** **directory$**(): `Observable`\<[`Directory`](../interfaces/Directory.md) \| `undefined`\>

Defined in: [clients/SignalWire.ts:529](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L529)

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

***

### errors$

#### Get Signature

> **get** **errors$**(): `Observable`\<`Error`\>

Defined in: [clients/SignalWire.ts:571](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L571)

Observable stream of errors from transport, authentication, and devices.

##### Returns

`Observable`\<`Error`\>

Observable stream of errors from device enumeration and monitoring.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`errors$`](../interfaces/DeviceController.md#errors)

***

### isConnected

#### Get Signature

> **get** **isConnected**(): `boolean`

Defined in: [clients/SignalWire.ts:552](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L552)

Whether the client is currently connected.

##### Returns

`boolean`

***

### isConnected$

#### Get Signature

> **get** **isConnected$**(): `Observable`\<`boolean`\>

Defined in: [clients/SignalWire.ts:557](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L557)

Observable that emits when the connection state changes.

##### Returns

`Observable`\<`boolean`\>

***

### isRegistered

#### Get Signature

> **get** **isRegistered**(): `boolean`

Defined in: [clients/SignalWire.ts:547](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L547)

Whether the subscriber is currently registered.

##### Returns

`boolean`

***

### isRegistered$

#### Get Signature

> **get** **isRegistered$**(): `Observable`\<`boolean`\>

Defined in: [clients/SignalWire.ts:542](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L542)

Observable that emits when the subscriber registration state changes.

##### Returns

`Observable`\<`boolean`\>

***

### ready$

#### Get Signature

> **get** **ready$**(): `Observable`\<`boolean`\>

Defined in: [clients/SignalWire.ts:562](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L562)

Observable that emits `true` when the client is both connected and authenticated.

##### Returns

`Observable`\<`boolean`\>

***

### selectedAudioInputDevice

#### Get Signature

> **get** **selectedAudioInputDevice**(): `MediaDeviceInfo` \| `null`

Defined in: [clients/SignalWire.ts:745](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L745)

Currently selected audio input device, or `null` if none.

##### Returns

`MediaDeviceInfo` \| `null`

Currently selected audio input device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedAudioInputDevice`](../interfaces/DeviceController.md#selectedaudioinputdevice)

***

### selectedAudioInputDevice$

#### Get Signature

> **get** **selectedAudioInputDevice$**(): `Observable`\<`MediaDeviceInfo` \| `null`\>

Defined in: [clients/SignalWire.ts:733](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L733)

Observable of the currently selected audio input device.

##### Returns

`Observable`\<`MediaDeviceInfo` \| `null`\>

Observable of the currently selected audio input device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedAudioInputDevice$`](../interfaces/DeviceController.md#selectedaudioinputdevice-1)

***

### selectedAudioInputDeviceConstraints

#### Get Signature

> **get** **selectedAudioInputDeviceConstraints**(): `MediaTrackConstraints`

Defined in: [clients/SignalWire.ts:757](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L757)

Media track constraints for the selected audio input device.

##### Returns

`MediaTrackConstraints`

Media track constraints for the selected audio input device.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedAudioInputDeviceConstraints`](../interfaces/DeviceController.md#selectedaudioinputdeviceconstraints)

***

### selectedAudioOutputDevice

#### Get Signature

> **get** **selectedAudioOutputDevice**(): `MediaDeviceInfo` \| `null`

Defined in: [clients/SignalWire.ts:749](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L749)

Currently selected audio output device, or `null` if none.

##### Returns

`MediaDeviceInfo` \| `null`

Currently selected audio output device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedAudioOutputDevice`](../interfaces/DeviceController.md#selectedaudiooutputdevice)

***

### selectedAudioOutputDevice$

#### Get Signature

> **get** **selectedAudioOutputDevice$**(): `Observable`\<`MediaDeviceInfo` \| `null`\>

Defined in: [clients/SignalWire.ts:737](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L737)

Observable of the currently selected audio output device.

##### Returns

`Observable`\<`MediaDeviceInfo` \| `null`\>

Observable of the currently selected audio output device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedAudioOutputDevice$`](../interfaces/DeviceController.md#selectedaudiooutputdevice-1)

***

### selectedVideoInputDevice

#### Get Signature

> **get** **selectedVideoInputDevice**(): `MediaDeviceInfo` \| `null`

Defined in: [clients/SignalWire.ts:753](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L753)

Currently selected video input device, or `null` if none.

##### Returns

`MediaDeviceInfo` \| `null`

Currently selected video input device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedVideoInputDevice`](../interfaces/DeviceController.md#selectedvideoinputdevice)

***

### selectedVideoInputDevice$

#### Get Signature

> **get** **selectedVideoInputDevice$**(): `Observable`\<`MediaDeviceInfo` \| `null`\>

Defined in: [clients/SignalWire.ts:741](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L741)

Observable of the currently selected video input device.

##### Returns

`Observable`\<`MediaDeviceInfo` \| `null`\>

Observable of the currently selected video input device, or `null` if none.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedVideoInputDevice$`](../interfaces/DeviceController.md#selectedvideoinputdevice-1)

***

### selectedVideoInputDeviceConstraints

#### Get Signature

> **get** **selectedVideoInputDeviceConstraints**(): `MediaTrackConstraints`

Defined in: [clients/SignalWire.ts:761](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L761)

Media track constraints for the selected video input device.

##### Returns

`MediaTrackConstraints`

Media track constraints for the selected video input device.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectedVideoInputDeviceConstraints`](../interfaces/DeviceController.md#selectedvideoinputdeviceconstraints)

***

### session

#### Get Signature

> **get** **session**(): `ClientSessionWrapper`

Defined in: [clients/SignalWire.ts:696](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L696)

The underlying client session for advanced RPC operations.

##### Returns

`ClientSessionWrapper`

***

### subscriber

#### Get Signature

> **get** **subscriber**(): [`Subscriber`](Subscriber.md) \| `undefined`

Defined in: [clients/SignalWire.ts:513](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L513)

Current subscriber snapshot, or `undefined` if not yet authenticated.

##### Returns

[`Subscriber`](Subscriber.md) \| `undefined`

***

### subscriber$

#### Get Signature

> **get** **subscriber$**(): `Observable`\<[`Subscriber`](Subscriber.md) \| `undefined`\>

Defined in: [clients/SignalWire.ts:508](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L508)

Observable that emits the [Subscriber](Subscriber.md) profile once fetched,
or `undefined` before authentication completes.

##### Example

```ts
client.subscriber$.subscribe(sub => {
  if (sub) console.log('Logged in as', sub.email);
});
```

##### Returns

`Observable`\<[`Subscriber`](Subscriber.md) \| `undefined`\>

***

### videoInputDevices

#### Get Signature

> **get** **videoInputDevices**(): `MediaDeviceInfo`[]

Defined in: [clients/SignalWire.ts:728](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L728)

Current snapshot of available video input devices.

##### Returns

`MediaDeviceInfo`[]

Current snapshot of available video input devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`videoInputDevices`](../interfaces/DeviceController.md#videoinputdevices)

***

### videoInputDevices$

#### Get Signature

> **get** **videoInputDevices$**(): `Observable`\<`MediaDeviceInfo`[]\>

Defined in: [clients/SignalWire.ts:723](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L723)

Observable list of available video input (camera) devices.

##### Returns

`Observable`\<`MediaDeviceInfo`[]\>

Observable list of available video input (camera) devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`videoInputDevices$`](../interfaces/DeviceController.md#videoinputdevices-1)

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

### connect()

> **connect**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:347](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L347)

Establishes the WebSocket connection and authenticates the session.

## Reconnection behavior

After a successful connection the underlying WebSocketController
automatically attempts to reconnect whenever the socket closes
unexpectedly (e.g. network change, server restart). Reconnection uses an
**exponential back-off** strategy:

- First retry after `reconnectDelayMin` (default **1 s**).
- Each subsequent retry doubles the delay up to `reconnectDelayMax`
  (default **30 s**).
- The delay resets to `reconnectDelayMin` once a connection succeeds.
- A per-attempt `connectionTimeout` (default **10 s**) aborts the
  attempt and schedules the next retry if the server does not respond.

Calling [disconnect](#disconnect) stops the reconnection loop entirely.

## Message handling during temporary disconnections

While the socket is not in the `connected` state, **outgoing messages
are queued** in an internal buffer. Once the connection is
re-established the queue is flushed in order so no outgoing RPC call is
lost.

**Incoming** server-to-client messages that arrive while the socket is
down are *not* buffered by the SDK — they are expected to be
re-delivered by the server after the session is re-authenticated.
Active RPC calls that were awaiting a response will time out
(default **5 s**) and reject with an `RPCTimeoutError`; callers should
handle this and retry if appropriate.

The connection status can be observed via the `status$` observable on
the transport layer, which emits `'connecting'`, `'connected'`,
`'reconnecting'`, `'disconnecting'`, or `'disconnected'`.

#### Returns

`Promise`\<`void`\>

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

Defined in: [clients/SignalWire.ts:816](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L816)

Destroys the client, clearing timers and releasing all resources.

#### Returns

`void`

#### Overrides

`Destroyable.destroy`

***

### deviceInfoToConstraints()

> **deviceInfoToConstraints**(`deviceInfo`): `MediaTrackConstraints`

Defined in: [clients/SignalWire.ts:766](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L766)

Converts a `MediaDeviceInfo` to track constraints suitable for `getUserMedia`.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` \| `null` |

#### Returns

`MediaTrackConstraints`

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`deviceInfoToConstraints`](../interfaces/DeviceController.md#deviceinfotoconstraints)

***

### dial()

> **dial**(`destination`, `options?`): `Promise`\<[`Call`](../interfaces/Call.md)\>

Defined in: [clients/SignalWire.ts:681](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L681)

Places an outbound call to the given destination.

Waits for authentication before dialing. Media options are merged from
saved preferences, destination query parameters (e.g. `?channel=video`),
and the provided `options` (highest priority).

Returns a [Call](../interfaces/Call.md) in `'ringing'` state. Subscribe to [Call.status$](../interfaces/Call.md#status-1)
to track progression through `'connected'` → `'disconnected'`.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `destination` | `string` \| [`Address`](Address.md) | Address URI string (e.g. `'/public/my-room'`) or [Address](Address.md) instance. |
| `options` | [`DialOptions`](../interfaces/DialOptions.md) | Media and dial options (audio/video, device constraints). Overrides defaults. |

#### Returns

`Promise`\<[`Call`](../interfaces/Call.md)\>

The created [Call](../interfaces/Call.md) instance.

#### Throws

If authentication is not complete or call creation fails.

#### Example

```ts
const call = await client.dial('/public/conference', {
  audio: true,
  video: true,
});
call.status$.subscribe(status => console.log('Call:', status));
```

***

### disableDeviceMonitoring()

> **disableDeviceMonitoring**(): `void`

Defined in: [clients/SignalWire.ts:791](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L791)

Stops monitoring for media device changes.

#### Returns

`void`

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`disableDeviceMonitoring`](../interfaces/DeviceController.md#disabledevicemonitoring)

***

### disconnect()

> **disconnect**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:581](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L581)

Disconnects the WebSocket and tears down the current session.

The client can be reconnected by calling [connect](#connect) again,
which creates a fresh transport and session.

#### Returns

`Promise`\<`void`\>

***

### enableDeviceMonitoring()

> **enableDeviceMonitoring**(): `void`

Defined in: [clients/SignalWire.ts:786](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L786)

Starts monitoring for media device changes (connect/disconnect).

#### Returns

`void`

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`enableDeviceMonitoring`](../interfaces/DeviceController.md#enabledevicemonitoring)

***

### getDeviceCapabilities()

> **getDeviceCapabilities**(`deviceInfo`): `Promise`\<`MediaTrackCapabilities` \| `null`\>

Defined in: [clients/SignalWire.ts:800](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L800)

Returns the capabilities of a media device.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` | The device to query. |

#### Returns

`Promise`\<`MediaTrackCapabilities` \| `null`\>

The device capabilities, or `null` if unavailable.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`getDeviceCapabilities`](../interfaces/DeviceController.md#getdevicecapabilities)

***

### isValidDevice()

> **isValidDevice**(`deviceInfo`): `Promise`\<`boolean`\>

Defined in: [clients/SignalWire.ts:811](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L811)

Checks whether a device is still available and usable.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` \| `null` | The device to validate, or `null`. |

#### Returns

`Promise`\<`boolean`\>

`true` if the device is valid and available. Returns `false` for `null`, audio output devices, or unavailable devices.

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`isValidDevice`](../interfaces/DeviceController.md#isvaliddevice)

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

### register()

> **register**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:600](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L600)

Registers the subscriber as online to receive inbound calls and events.

Waits for authentication to complete before sending the registration.
If the initial attempt fails, reauthentication is attempted automatically.

#### Returns

`Promise`\<`void`\>

#### Throws

If registration and reauthentication both fail.

***

### selectAudioInputDevice()

> **selectAudioInputDevice**(`device`): `void`

Defined in: [clients/SignalWire.ts:771](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L771)

Sets the preferred audio input device.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` \| `null` |

#### Returns

`void`

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectAudioInputDevice`](../interfaces/DeviceController.md#selectaudioinputdevice)

***

### selectAudioOutputDevice()

> **selectAudioOutputDevice**(`device`): `void`

Defined in: [clients/SignalWire.ts:781](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L781)

Sets the preferred audio output device.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` \| `null` |

#### Returns

`void`

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectAudioOutputDevice`](../interfaces/DeviceController.md#selectaudiooutputdevice)

***

### selectVideoInputDevice()

> **selectVideoInputDevice**(`device`): `void`

Defined in: [clients/SignalWire.ts:776](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L776)

Sets the preferred video input device.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` \| `null` |

#### Returns

`void`

#### Implementation of

[`DeviceController`](../interfaces/DeviceController.md).[`selectVideoInputDevice`](../interfaces/DeviceController.md#selectvideoinputdevice)

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

***

### unregister()

> **unregister**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:644](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L644)

Unregisters the subscriber, going offline for inbound calls.

The WebSocket connection remains open; use [disconnect](#disconnect) to fully close it.

#### Returns

`Promise`\<`void`\>
