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

- [`DeviceController`](../interfaces/DeviceController.md)

## Constructors

### Constructor

> **new SignalWire**(`credentialProvider`, `options?`): `SignalWire`

Defined in: [clients/SignalWire.ts:189](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L189)

Creates a new SignalWire client and begins connecting.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `credentialProvider` | [`CredentialProvider`](../interfaces/CredentialProvider.md) \| `undefined` | Provider that supplies authentication credentials. |
| `options` | [`SignalWireOptions`](../interfaces/SignalWireOptions.md) | Configuration options (connection, device monitoring, preferences). |

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

- [`audioInputDevices`](./SignalWire/audioInputDevices.md)
- [`audioInputDevices$`](./SignalWire/audioInputDevices$.md)
- [`audioInputDisabled`](./SignalWire/audioInputDisabled.md)
- [`audioInputDisabled$`](./SignalWire/audioInputDisabled$.md)
- [`audioOutputDevices`](./SignalWire/audioOutputDevices.md)
- [`audioOutputDevices$`](./SignalWire/audioOutputDevices$.md)
- [`destroyed$`](./SignalWire/destroyed$.md)
- [`deviceRecovered$`](./SignalWire/deviceRecovered$.md)
- [`directory`](./SignalWire/directory.md)
- [`directory$`](./SignalWire/directory$.md)
- [`errors$`](./SignalWire/errors$.md)
- [`isConnected`](./SignalWire/isConnected.md)
- [`isConnected$`](./SignalWire/isConnected$.md)
- [`isRegistered`](./SignalWire/isRegistered.md)
- [`isRegistered$`](./SignalWire/isRegistered$.md)
- [`platformCapabilities`](./SignalWire/platformCapabilities.md)
- [`ready$`](./SignalWire/ready$.md)
- [`selectedAudioInputDevice`](./SignalWire/selectedAudioInputDevice.md)
- [`selectedAudioInputDevice$`](./SignalWire/selectedAudioInputDevice$.md)
- [`selectedAudioInputDeviceConstraints`](./SignalWire/selectedAudioInputDeviceConstraints.md)
- [`selectedAudioOutputDevice`](./SignalWire/selectedAudioOutputDevice.md)
- [`selectedAudioOutputDevice$`](./SignalWire/selectedAudioOutputDevice$.md)
- [`selectedVideoInputDevice`](./SignalWire/selectedVideoInputDevice.md)
- [`selectedVideoInputDevice$`](./SignalWire/selectedVideoInputDevice$.md)
- [`selectedVideoInputDeviceConstraints`](./SignalWire/selectedVideoInputDeviceConstraints.md)
- [`session`](./SignalWire/session.md)
- [`subscriber`](./SignalWire/subscriber.md)
- [`subscriber$`](./SignalWire/subscriber$.md)
- [`videoInputDevices`](./SignalWire/videoInputDevices.md)
- [`videoInputDevices$`](./SignalWire/videoInputDevices$.md)
- [`videoInputDisabled`](./SignalWire/videoInputDisabled.md)
- [`videoInputDisabled$`](./SignalWire/videoInputDisabled$.md)

## Methods

- [`applySelectedAudioOutputDevice`](./SignalWire/applySelectedAudioOutputDevice.md)
- [`cachedObservable`](./SignalWire/cachedObservable.md)
- [`clearDeviceState`](./SignalWire/clearDeviceState.md)
- [`connect`](./SignalWire/connect.md)
- [`createBehaviorSubject`](./SignalWire/createBehaviorSubject.md)
- [`createReplaySubject`](./SignalWire/createReplaySubject.md)
- [`createSubject`](./SignalWire/createSubject.md)
- [`deferEmission`](./SignalWire/deferEmission.md)
- [`destroy`](./SignalWire/destroy.md)
- [`deviceInfoToConstraints`](./SignalWire/deviceInfoToConstraints.md)
- [`dial`](./SignalWire/dial.md)
- [`disableAudioInput`](./SignalWire/disableAudioInput.md)
- [`disableDeviceMonitoring`](./SignalWire/disableDeviceMonitoring.md)
- [`disableVideoInput`](./SignalWire/disableVideoInput.md)
- [`disconnect`](./SignalWire/disconnect.md)
- [`enableAudioInput`](./SignalWire/enableAudioInput.md)
- [`enableDeviceMonitoring`](./SignalWire/enableDeviceMonitoring.md)
- [`enableVideoInput`](./SignalWire/enableVideoInput.md)
- [`enumerateDevices`](./SignalWire/enumerateDevices.md)
- [`exportDiagnostics`](./SignalWire/exportDiagnostics.md)
- [`getDeviceCapabilities`](./SignalWire/getDeviceCapabilities.md)
- [`isValidDevice`](./SignalWire/isValidDevice.md)
- [`preflight`](./SignalWire/preflight.md)
- [`publicCachedObservable`](./SignalWire/publicCachedObservable.md)
- [`register`](./SignalWire/register.md)
- [`requestMediaPermissions`](./SignalWire/requestMediaPermissions.md)
- [`resetToDefaults`](./SignalWire/resetToDefaults.md)
- [`selectAudioInputDevice`](./SignalWire/selectAudioInputDevice.md)
- [`selectAudioOutputDevice`](./SignalWire/selectAudioOutputDevice.md)
- [`selectVideoInputDevice`](./SignalWire/selectVideoInputDevice.md)
- [`setStorageManager`](./SignalWire/setStorageManager.md)
- [`subscribeTo`](./SignalWire/subscribeTo.md)
- [`unregister`](./SignalWire/unregister.md)
