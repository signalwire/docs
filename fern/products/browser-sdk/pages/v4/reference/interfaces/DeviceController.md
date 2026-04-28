# Interface: DeviceController

Defined in: [interfaces/DeviceController.ts:10](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L10)

Interface for media device management.

Provides reactive access to available media devices, device selection,
and monitoring for device changes (connect/disconnect).

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audioinputdevices"></a> `audioInputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available audio input devices. | [interfaces/DeviceController.ts:33](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L33) |
| <a id="audioinputdevices-1"></a> `audioInputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available audio input (microphone) devices. | [interfaces/DeviceController.ts:12](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L12) |
| <a id="audioinputdisabled"></a> `audioInputDisabled` | `readonly` | `boolean` | Whether audio input is currently disabled. | [interfaces/DeviceController.ts:105](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L105) |
| <a id="audioinputdisabled-1"></a> `audioInputDisabled$` | `readonly` | `Observable`\<`boolean`\> | Observable that emits `true` when audio input is disabled (receive-only). | [interfaces/DeviceController.ts:101](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L101) |
| <a id="audiooutputdevices"></a> `audioOutputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available audio output devices. | [interfaces/DeviceController.ts:35](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L35) |
| <a id="audiooutputdevices-1"></a> `audioOutputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available audio output (speaker) devices. | [interfaces/DeviceController.ts:14](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L14) |
| <a id="devicerecovered"></a> `deviceRecovered$` | `readonly` | `Observable`\<[`DeviceRecoveryEvent`](DeviceRecoveryEvent.md)\> | Observable that emits when the SDK auto-switches a device due to disconnect, reconnect, or recovery. | [interfaces/DeviceController.ts:86](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L86) |
| <a id="errors"></a> `errors$` | `readonly` | `Observable`\<`Error`\> | Observable stream of errors from device enumeration and monitoring. | [interfaces/DeviceController.ts:81](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L81) |
| <a id="selectedaudioinputdevice"></a> `selectedAudioInputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected audio input device, or `null` if none. | [interfaces/DeviceController.ts:26](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L26) |
| <a id="selectedaudioinputdevice-1"></a> `selectedAudioInputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected audio input device, or `null` if none. | [interfaces/DeviceController.ts:19](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L19) |
| <a id="selectedaudioinputdeviceconstraints"></a> `selectedAudioInputDeviceConstraints` | `readonly` | `boolean` \| `MediaTrackConstraints` | Media track constraints for the selected audio input device. Returns `false` when disabled. | [interfaces/DeviceController.ts:40](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L40) |
| <a id="selectedaudiooutputdevice"></a> `selectedAudioOutputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected audio output device, or `null` if none. | [interfaces/DeviceController.ts:28](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L28) |
| <a id="selectedaudiooutputdevice-1"></a> `selectedAudioOutputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected audio output device, or `null` if none. | [interfaces/DeviceController.ts:21](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L21) |
| <a id="selectedvideoinputdevice"></a> `selectedVideoInputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected video input device, or `null` if none. | [interfaces/DeviceController.ts:30](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L30) |
| <a id="selectedvideoinputdevice-1"></a> `selectedVideoInputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected video input device, or `null` if none. | [interfaces/DeviceController.ts:23](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L23) |
| <a id="selectedvideoinputdeviceconstraints"></a> `selectedVideoInputDeviceConstraints` | `readonly` | `boolean` \| `MediaTrackConstraints` | Media track constraints for the selected video input device. Returns `false` when disabled. | [interfaces/DeviceController.ts:42](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L42) |
| <a id="videoinputdevices"></a> `videoInputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available video input devices. | [interfaces/DeviceController.ts:37](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L37) |
| <a id="videoinputdevices-1"></a> `videoInputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available video input (camera) devices. | [interfaces/DeviceController.ts:16](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L16) |
| <a id="videoinputdisabled"></a> `videoInputDisabled` | `readonly` | `boolean` | Whether video input is currently disabled. | [interfaces/DeviceController.ts:103](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L103) |
| <a id="videoinputdisabled-1"></a> `videoInputDisabled$` | `readonly` | `Observable`\<`boolean`\> | Observable that emits `true` when video input is disabled (receive-only). | [interfaces/DeviceController.ts:99](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L99) |

## Methods

### clearDeviceState()

> **clearDeviceState**(): `Promise`\<`void`\>

Defined in: [interfaces/DeviceController.ts:115](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L115)

Clears all device state (history, selections, persisted prefs) and re-enumerates.

#### Returns

`Promise`\<`void`\>

***

### deviceInfoToConstraints()

> **deviceInfoToConstraints**(`deviceInfo`): `MediaTrackConstraints`

Defined in: [interfaces/DeviceController.ts:48](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L48)

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

Defined in: [interfaces/DeviceController.ts:91](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L91)

Disables audio input (receive-only mode). No track will be acquired.

#### Returns

`void`

***

### disableDeviceMonitoring()

> **disableDeviceMonitoring**(): `void`

Defined in: [interfaces/DeviceController.ts:67](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L67)

Stops monitoring for media device changes.

#### Returns

`void`

***

### disableVideoInput()

> **disableVideoInput**(): `void`

Defined in: [interfaces/DeviceController.ts:95](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L95)

Disables video input (receive-only mode). No track will be acquired.

#### Returns

`void`

***

### enableAudioInput()

> **enableAudioInput**(): `void`

Defined in: [interfaces/DeviceController.ts:93](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L93)

Re-enables audio input, restoring the last selection or auto-selecting.

#### Returns

`void`

***

### enableDeviceMonitoring()

> **enableDeviceMonitoring**(): `void`

Defined in: [interfaces/DeviceController.ts:65](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L65)

Starts monitoring for media device changes (connect/disconnect).

#### Returns

`void`

***

### enableVideoInput()

> **enableVideoInput**(): `void`

Defined in: [interfaces/DeviceController.ts:97](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L97)

Re-enables video input, restoring the last selection or auto-selecting.

#### Returns

`void`

***

### enumerateDevices()

> **enumerateDevices**(): `Promise`\<`void`\>

Defined in: [interfaces/DeviceController.ts:118](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L118)

Force a device re-enumeration.

#### Returns

`Promise`\<`void`\>

***

### getDeviceCapabilities()

> **getDeviceCapabilities**(`deviceInfo`): `Promise`\<`MediaTrackCapabilities` \| `null`\>

Defined in: [interfaces/DeviceController.ts:73](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L73)

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

Defined in: [interfaces/DeviceController.ts:79](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L79)

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

Defined in: [interfaces/DeviceController.ts:53](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L53)

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

Defined in: [interfaces/DeviceController.ts:63](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L63)

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

Defined in: [interfaces/DeviceController.ts:58](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L58)

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

Defined in: [interfaces/DeviceController.ts:110](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/interfaces/DeviceController.ts#L110)

Injects the storage manager for device persistence.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `storageManager` | `StorageManager` |

#### Returns

`void`
