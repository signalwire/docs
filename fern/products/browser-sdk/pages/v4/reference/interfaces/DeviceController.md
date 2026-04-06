# Interface: DeviceController

Defined in: [interfaces/DeviceController.ts:9](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L9)

Interface for media device management.

Provides reactive access to available media devices, device selection,
and monitoring for device changes (connect/disconnect).

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audioinputdevices"></a> `audioInputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available audio input devices. | [interfaces/DeviceController.ts:32](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L32) |
| <a id="audioinputdevices-1"></a> `audioInputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available audio input (microphone) devices. | [interfaces/DeviceController.ts:11](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L11) |
| <a id="audiooutputdevices"></a> `audioOutputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available audio output devices. | [interfaces/DeviceController.ts:34](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L34) |
| <a id="audiooutputdevices-1"></a> `audioOutputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available audio output (speaker) devices. | [interfaces/DeviceController.ts:13](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L13) |
| <a id="errors"></a> `errors$` | `readonly` | `Observable`\<`Error`\> | Observable stream of errors from device enumeration and monitoring. | [interfaces/DeviceController.ts:80](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L80) |
| <a id="selectedaudioinputdevice"></a> `selectedAudioInputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected audio input device, or `null` if none. | [interfaces/DeviceController.ts:25](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L25) |
| <a id="selectedaudioinputdevice-1"></a> `selectedAudioInputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected audio input device, or `null` if none. | [interfaces/DeviceController.ts:18](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L18) |
| <a id="selectedaudioinputdeviceconstraints"></a> `selectedAudioInputDeviceConstraints` | `readonly` | `MediaTrackConstraints` | Media track constraints for the selected audio input device. | [interfaces/DeviceController.ts:39](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L39) |
| <a id="selectedaudiooutputdevice"></a> `selectedAudioOutputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected audio output device, or `null` if none. | [interfaces/DeviceController.ts:27](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L27) |
| <a id="selectedaudiooutputdevice-1"></a> `selectedAudioOutputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected audio output device, or `null` if none. | [interfaces/DeviceController.ts:20](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L20) |
| <a id="selectedvideoinputdevice"></a> `selectedVideoInputDevice` | `readonly` | `MediaDeviceInfo` \| `null` | Currently selected video input device, or `null` if none. | [interfaces/DeviceController.ts:29](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L29) |
| <a id="selectedvideoinputdevice-1"></a> `selectedVideoInputDevice$` | `readonly` | `Observable`\<`MediaDeviceInfo` \| `null`\> | Observable of the currently selected video input device, or `null` if none. | [interfaces/DeviceController.ts:22](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L22) |
| <a id="selectedvideoinputdeviceconstraints"></a> `selectedVideoInputDeviceConstraints` | `readonly` | `MediaTrackConstraints` | Media track constraints for the selected video input device. | [interfaces/DeviceController.ts:41](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L41) |
| <a id="videoinputdevices"></a> `videoInputDevices` | `readonly` | `MediaDeviceInfo`[] | Current snapshot of available video input devices. | [interfaces/DeviceController.ts:36](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L36) |
| <a id="videoinputdevices-1"></a> `videoInputDevices$` | `readonly` | `Observable`\<`MediaDeviceInfo`[]\> | Observable list of available video input (camera) devices. | [interfaces/DeviceController.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L15) |

## Methods

### deviceInfoToConstraints()

> **deviceInfoToConstraints**(`deviceInfo`): `MediaTrackConstraints`

Defined in: [interfaces/DeviceController.ts:47](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L47)

Converts a MediaDeviceInfo to track constraints suitable for `getUserMedia`.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `deviceInfo` | `MediaDeviceInfo` \| `null` | The device to convert, or `null` for default constraints. |

#### Returns

`MediaTrackConstraints`

***

### disableDeviceMonitoring()

> **disableDeviceMonitoring**(): `void`

Defined in: [interfaces/DeviceController.ts:66](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L66)

Stops monitoring for media device changes.

#### Returns

`void`

***

### enableDeviceMonitoring()

> **enableDeviceMonitoring**(): `void`

Defined in: [interfaces/DeviceController.ts:64](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L64)

Starts monitoring for media device changes (connect/disconnect).

#### Returns

`void`

***

### getDeviceCapabilities()

> **getDeviceCapabilities**(`deviceInfo`): `Promise`\<`MediaTrackCapabilities` \| `null`\>

Defined in: [interfaces/DeviceController.ts:72](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L72)

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

Defined in: [interfaces/DeviceController.ts:78](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L78)

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

Defined in: [interfaces/DeviceController.ts:52](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L52)

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

Defined in: [interfaces/DeviceController.ts:62](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L62)

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

Defined in: [interfaces/DeviceController.ts:57](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/DeviceController.ts#L57)

Sets the preferred video input device for future calls.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `device` | `MediaDeviceInfo` \| `null` | The device to select, or `null` to use the system default. |

#### Returns

`void`
