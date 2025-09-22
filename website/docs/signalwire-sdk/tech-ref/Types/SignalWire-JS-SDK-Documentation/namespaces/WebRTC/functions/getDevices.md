> **getDevices**(`name?`, `fullList?`): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:169](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L169)

Enumerates the media input and output devices available on this machine. If
`name` is provided, only the devices of the specified kind are returned.
Possible values of the `name` parameters are `"camera"`, `"microphone"`, and
`"speaker"`, which respectively correspond to functions
[getCameraDevices](getCameraDevices.md), [getMicrophoneDevices](getMicrophoneDevices.md), and
[getSpeakerDevices](getSpeakerDevices.md).

## Parameters

### name?

`DevicePermissionName`

filter for this device category

### fullList?

`boolean` = `false`

Default to false. Set to true to retrieve the raw list as returned by
the browser, which might include multiple, duplicate deviceIds for the same group.

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getDevices("camera", true)
// [
//   {
//     "deviceId": "3c4f97...",
//     "kind": "videoinput",
//     "label": "HD Camera",
//     "groupId": "828fec..."
//   }
// ]
```
