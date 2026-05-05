---
title: "DeviceController"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L10)</sub>

Interface for media device management.

Provides reactive access to available media devices, device selection,
and monitoring for device changes (connect/disconnect).

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `audioInputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available audio input devices. | [interfaces/DeviceController.ts:33](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L33) |
| `audioInputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available audio input (microphone) devices. | [interfaces/DeviceController.ts:12](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L12) |
| `audioInputDisabled` | `readonly` | `boolean` | Whether audio input is currently disabled. | [interfaces/DeviceController.ts:105](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L105) |
| `audioInputDisabled$` | `readonly` | `Observable`\<`boolean`\> | Observable that emits `true` when audio input is disabled (receive-only). | [interfaces/DeviceController.ts:101](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L101) |
| `audioOutputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available audio output devices. | [interfaces/DeviceController.ts:35](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L35) |
| `audioOutputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available audio output (speaker) devices. | [interfaces/DeviceController.ts:14](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L14) |
| `deviceRecovered$` | `readonly` | `Observable`\<[`DeviceRecoveryEvent`](DeviceRecoveryEvent.md)\> | Observable that emits when the SDK auto-switches a device due to disconnect, reconnect, or recovery. | [interfaces/DeviceController.ts:86](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L86) |
| `errors$` | `readonly` | `Observable`\<`Error`\> | Observable stream of errors from device enumeration and monitoring. | [interfaces/DeviceController.ts:81](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L81) |
| `selectedAudioInputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected audio input device, or `null` if none. | [interfaces/DeviceController.ts:26](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L26) |
| `selectedAudioInputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected audio input device, or `null` if none. | [interfaces/DeviceController.ts:19](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L19) |
| `selectedAudioInputDeviceConstraints` | `readonly` | `boolean` \| `MediaTrackConstraints` | Media track constraints for the selected audio input device. Returns `false` when disabled. | [interfaces/DeviceController.ts:40](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L40) |
| `selectedAudioOutputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected audio output device, or `null` if none. | [interfaces/DeviceController.ts:28](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L28) |
| `selectedAudioOutputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected audio output device, or `null` if none. | [interfaces/DeviceController.ts:21](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L21) |
| `selectedVideoInputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected video input device, or `null` if none. | [interfaces/DeviceController.ts:30](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L30) |
| `selectedVideoInputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected video input device, or `null` if none. | [interfaces/DeviceController.ts:23](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L23) |
| `selectedVideoInputDeviceConstraints` | `readonly` | `boolean` \| `MediaTrackConstraints` | Media track constraints for the selected video input device. Returns `false` when disabled. | [interfaces/DeviceController.ts:42](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L42) |
| `videoInputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available video input devices. | [interfaces/DeviceController.ts:37](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L37) |
| `videoInputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available video input (camera) devices. | [interfaces/DeviceController.ts:16](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L16) |
| `videoInputDisabled` | `readonly` | `boolean` | Whether video input is currently disabled. | [interfaces/DeviceController.ts:103](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L103) |
| `videoInputDisabled$` | `readonly` | `Observable`\<`boolean`\> | Observable that emits `true` when video input is disabled (receive-only). | [interfaces/DeviceController.ts:99](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L99) |

## Methods

### clearDeviceState()

> **clearDeviceState**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L115)</sub>

Clears all device state (history, selections, persisted prefs) and re-enumerates.

#### Returns

`Promise`\<`void`\>

***

### deviceInfoToConstraints()

> **deviceInfoToConstraints**(`deviceInfo`): `MediaTrackConstraints`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L48)</sub>

Converts a MediaDeviceInfo to track constraints suitable for `getUserMedia`.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` \| `null` | The device to convert, or `null` for default constraints. |

#### Returns

`MediaTrackConstraints`

***

### disableAudioInput()

> **disableAudioInput**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L91)</sub>

Disables audio input (receive-only mode). No track will be acquired.

#### Returns

`void`

***

### disableDeviceMonitoring()

> **disableDeviceMonitoring**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L67)</sub>

Stops monitoring for media device changes.

#### Returns

`void`

***

### disableVideoInput()

> **disableVideoInput**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L95)</sub>

Disables video input (receive-only mode). No track will be acquired.

#### Returns

`void`

***

### enableAudioInput()

> **enableAudioInput**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L93)</sub>

Re-enables audio input, restoring the last selection or auto-selecting.

#### Returns

`void`

***

### enableDeviceMonitoring()

> **enableDeviceMonitoring**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L65)</sub>

Starts monitoring for media device changes (connect/disconnect).

#### Returns

`void`

***

### enableVideoInput()

> **enableVideoInput**(): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L97)</sub>

Re-enables video input, restoring the last selection or auto-selecting.

#### Returns

`void`

***

### enumerateDevices()

> **enumerateDevices**(): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L118)</sub>

Force a device re-enumeration.

#### Returns

`Promise`\<`void`\>

***

### getDeviceCapabilities()

> **getDeviceCapabilities**(`deviceInfo`): `Promise`\<`MediaTrackCapabilities` \| `null`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L73)</sub>

Returns the capabilities of a media device.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` | The device to query. |

#### Returns

`Promise`\<`MediaTrackCapabilities` \| `null`\>

The device capabilities, or `null` if unavailable.

***

### isValidDevice()

> **isValidDevice**(`deviceInfo`): `Promise`\<`boolean`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L79)</sub>

Checks whether a device is still available and usable.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` \| `null` | The device to validate, or `null`. |

#### Returns

`Promise`\<`boolean`\>

`true` if the device is valid and available. Returns `false` for `null`, audio output devices, or unavailable devices.

***

### selectAudioInputDevice()

> **selectAudioInputDevice**(`device`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L53)</sub>

Sets the preferred audio input device for future calls.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `device` | `MediaDeviceInfo` \| `null` | The device to select, or `null` to use the system default. |

#### Returns

`void`

***

### selectAudioOutputDevice()

> **selectAudioOutputDevice**(`device`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L63)</sub>

Sets the preferred audio output device for future calls.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `device` | `MediaDeviceInfo` \| `null` | The device to select, or `null` to use the system default. |

#### Returns

`void`

***

### selectVideoInputDevice()

> **selectVideoInputDevice**(`device`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L58)</sub>

Sets the preferred video input device for future calls.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `device` | `MediaDeviceInfo` \| `null` | The device to select, or `null` to use the system default. |

#### Returns

`void`

***

### setStorageManager()

> **setStorageManager**(`storageManager`): `void`

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/DeviceController.ts#L110)</sub>

Injects the storage manager for device persistence.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `storageManager` | `StorageManager` |

#### Returns

`void`
