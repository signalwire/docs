# Class: SignalWire

Defined in: [clients/SignalWire.ts:157](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L157)

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

- [`DeviceController`](../../interfaces/DeviceController.md)

## Constructors

### Constructor

> **new SignalWire**(`credentialProvider`, `options?`): `SignalWire`

Defined in: [clients/SignalWire.ts:189](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L189)

Creates a new SignalWire client and begins connecting.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `credentialProvider` | [`CredentialProvider`](../../interfaces/CredentialProvider.md) \| `undefined` | Provider that supplies authentication credentials. |
| `options` | [`SignalWireOptions`](../../interfaces/SignalWireOptions.md) | Configuration options (connection, device monitoring, preferences). |

#### Returns

`SignalWire`

#### Overrides

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:8](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L8) |
| <a id="preferences"></a> `preferences` | `public` | [`ClientPreferences`](ClientPreferences.md) | `undefined` | Global SDK preferences (timeouts, ICE config, media defaults). | - | [clients/SignalWire.ts:159](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L159) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:7](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L7) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:6](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/behaviors/Destroyable.ts#L6) |

## Accessors

- [`audioInputDevices$`](./audioInputDevices$.md)
- [`audioInputDisabled$`](./audioInputDisabled$.md)
- [`audioOutputDevices$`](./audioOutputDevices$.md)
- [`destroyed$`](./destroyed$.md)
- [`deviceRecovered$`](./deviceRecovered$.md)
- [`directory$`](./directory$.md)
- [`errors$`](./errors$.md)
- [`isConnected$`](./isConnected$.md)
- [`isRegistered$`](./isRegistered$.md)
- [`platformCapabilities`](./platformCapabilities.md)
- [`ready$`](./ready$.md)
- [`selectedAudioInputDevice$`](./selectedAudioInputDevice$.md)
- [`selectedAudioInputDeviceConstraints`](./selectedAudioInputDeviceConstraints.md)
- [`selectedAudioOutputDevice$`](./selectedAudioOutputDevice$.md)
- [`selectedVideoInputDevice$`](./selectedVideoInputDevice$.md)
- [`selectedVideoInputDeviceConstraints`](./selectedVideoInputDeviceConstraints.md)
- [`session`](./session.md)
- [`subscriber$`](./subscriber$.md)
- [`videoInputDevices$`](./videoInputDevices$.md)
- [`videoInputDisabled$`](./videoInputDisabled$.md)

## Methods

- [`applySelectedAudioOutputDevice`](./applySelectedAudioOutputDevice.md)
- [`cachedObservable`](./cachedObservable.md)
- [`clearDeviceState`](./clearDeviceState.md)
- [`connect`](./connect.md)
- [`createBehaviorSubject`](./createBehaviorSubject.md)
- [`createReplaySubject`](./createReplaySubject.md)
- [`createSubject`](./createSubject.md)
- [`deferEmission`](./deferEmission.md)
- [`destroy`](./destroy.md)
- [`deviceInfoToConstraints`](./deviceInfoToConstraints.md)
- [`dial`](./dial.md)
- [`disableAudioInput`](./disableAudioInput.md)
- [`disableDeviceMonitoring`](./disableDeviceMonitoring.md)
- [`disableVideoInput`](./disableVideoInput.md)
- [`disconnect`](./disconnect.md)
- [`enableAudioInput`](./enableAudioInput.md)
- [`enableDeviceMonitoring`](./enableDeviceMonitoring.md)
- [`enableVideoInput`](./enableVideoInput.md)
- [`enumerateDevices`](./enumerateDevices.md)
- [`exportDiagnostics`](./exportDiagnostics.md)
- [`getDeviceCapabilities`](./getDeviceCapabilities.md)
- [`isValidDevice`](./isValidDevice.md)
- [`preflight`](./preflight.md)
- [`publicCachedObservable`](./publicCachedObservable.md)
- [`register`](./register.md)
- [`requestMediaPermissions`](./requestMediaPermissions.md)
- [`resetToDefaults`](./resetToDefaults.md)
- [`selectAudioInputDevice`](./selectAudioInputDevice.md)
- [`selectAudioOutputDevice`](./selectAudioOutputDevice.md)
- [`selectVideoInputDevice`](./selectVideoInputDevice.md)
- [`setStorageManager`](./setStorageManager.md)
- [`subscribeTo`](./subscribeTo.md)
- [`unregister`](./unregister.md)
