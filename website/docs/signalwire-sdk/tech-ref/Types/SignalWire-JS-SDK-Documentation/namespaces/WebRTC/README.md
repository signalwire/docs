The WebRTC namespace includes functions that give you access to the input and
output media devices available on the user's machine. For example, you can
use these functions to request permission and get access to the media stream
from a webcam, from a microphone, or from a screen sharing.

## Functions

| Function | Description |
| ------ | ------ |
| [checkCameraPermissions](functions/checkCameraPermissions.md) | Asynchronously returns whether we have permissions to access the camera. |
| [checkMicrophonePermissions](functions/checkMicrophonePermissions.md) | Asynchronously returns whether we have permissions to access the microphone. |
| [checkPermissions](functions/checkPermissions.md) | Asynchronously returns whether we have permissions to access the specified resource. Some common parameter values for `name` are `"camera"`, `"microphone"`, and `"speaker"`. In those cases, prefer the dedicated methods [checkCameraPermissions](functions/checkCameraPermissions.md), [checkMicrophonePermissions](functions/checkMicrophonePermissions.md), and [checkSpeakerPermissions](functions/checkSpeakerPermissions.md). |
| [checkSpeakerPermissions](functions/checkSpeakerPermissions.md) | Asynchronously returns whether we have permissions to access the speakers. |
| [createCameraDeviceWatcher](functions/createCameraDeviceWatcher.md) | Asynchronously returns an event emitter that notifies changes in all camera devices. This is equivalent to calling `createDeviceWatcher({ targets: ['camera'] })`, so refer to [createDeviceWatcher](functions/createDeviceWatcher.md) for additional information about the returned event emitter. |
| [createDeviceWatcher](functions/createDeviceWatcher.md) | Asynchronously returns an event emitter that notifies changes in the devices. The possible events are: |
| [createMicrophoneAnalyzer](functions/createMicrophoneAnalyzer.md) | Initializes a microphone analyzer. You can use a MicrophoneAnalyzer to track the input audio volume. |
| [createMicrophoneDeviceWatcher](functions/createMicrophoneDeviceWatcher.md) | Asynchronously returns an event emitter that notifies changes in all microphone devices. This is equivalent to calling `createDeviceWatcher({ targets: ['microphone'] })`, so refer to [createDeviceWatcher](functions/createDeviceWatcher.md) for additional information about the returned event emitter. |
| [createSpeakerDeviceWatcher](functions/createSpeakerDeviceWatcher.md) | Asynchronously returns an event emitter that notifies changes in all speaker devices. This is equivalent to calling `createDeviceWatcher({ targets: ['speaker'] })`, so refer to [createDeviceWatcher](functions/createDeviceWatcher.md) for additional information about the returned event emitter. |
| [enumerateDevices](functions/enumerateDevices.md) | Enumerates the media input and output devices available on this device. |
| [enumerateDevicesByKind](functions/enumerateDevicesByKind.md) | - |
| [getCameraDevices](functions/getCameraDevices.md) | Returns an array of camera devices that can be accessed on this device (for which we have permissions). |
| [~~getCameraDevicesWithPermissions~~](functions/getCameraDevicesWithPermissions.md) | After prompting the user for permission, returns an array of camera devices. |
| [getDevices](functions/getDevices.md) | Enumerates the media input and output devices available on this machine. If `name` is provided, only the devices of the specified kind are returned. Possible values of the `name` parameters are `"camera"`, `"microphone"`, and `"speaker"`, which respectively correspond to functions [getCameraDevices](functions/getCameraDevices.md), [getMicrophoneDevices](functions/getMicrophoneDevices.md), and [getSpeakerDevices](functions/getSpeakerDevices.md). |
| [~~getDevicesWithPermissions~~](functions/getDevicesWithPermissions.md) | After prompting the user for permission, returns an array of media input and output devices available on this machine. If `kind` is not null, only the devices of the specified kind are returned. Possible values of the `kind` parameters are `"camera"`, `"microphone"`, and `"speaker"`, which respectively correspond to functions [getCameraDevicesWithPermissions](functions/getCameraDevicesWithPermissions.md), [getMicrophoneDevicesWithPermissions](functions/getMicrophoneDevicesWithPermissions.md), and [getSpeakerDevicesWithPermissions](functions/getSpeakerDevicesWithPermissions.md). |
| [getDisplayMedia](functions/getDisplayMedia.md) | Prompts the user to share the screen and asynchronously returns a [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) object associated with a display or part of it. |
| [getMicrophoneDevices](functions/getMicrophoneDevices.md) | Returns an array of microphone devices that can be accessed on this device (for which we have permissions). |
| [~~getMicrophoneDevicesWithPermissions~~](functions/getMicrophoneDevicesWithPermissions.md) | After prompting the user for permission, returns an array of microphone devices. |
| [getSpeakerDevices](functions/getSpeakerDevices.md) | Returns an array of speaker devices that can be accessed on this device (for which we have permissions). |
| [~~getSpeakerDevicesWithPermissions~~](functions/getSpeakerDevicesWithPermissions.md) | After prompting the user for permission, returns an array of speaker devices. |
| [getSupportedConstraints](functions/getSupportedConstraints.md) | Returns a dictionary whose fields specify the constrainable properties the user agent understands. |
| [getUserMedia](functions/getUserMedia.md) | Prompts the user to share one or more media devices and asynchronously returns an associated [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) object. |
| [requestPermissions](functions/requestPermissions.md) | Prompts the user to grant permissions for the devices matching the specified set of constraints. |
| [setMediaElementSinkId](functions/setMediaElementSinkId.md) | Assigns the specified audio output device to the specified HTMLMediaElement. The device with id `deviceId` must be an audio output device. Asynchronously returns whether the operation had success. |
| [stopStream](functions/stopStream.md) | - |
| [stopTrack](functions/stopTrack.md) | - |
| [supportsGetDisplayMedia](functions/supportsGetDisplayMedia.md) | Returns whether the current environment supports `getDisplayMedia`. |
| [supportsGetUserMedia](functions/supportsGetUserMedia.md) | Returns whether the current environment supports `getUserMedia`. |
| [supportsMediaDevices](functions/supportsMediaDevices.md) | Returns whether the current environment supports the media devices API. |
| [supportsMediaOutput](functions/supportsMediaOutput.md) | Returns whether the current environment supports the selection of a media output device. |

## References

### MicrophoneAnalyzer

Re-exports [MicrophoneAnalyzer](../../../interfaces/MicrophoneAnalyzer.md)
