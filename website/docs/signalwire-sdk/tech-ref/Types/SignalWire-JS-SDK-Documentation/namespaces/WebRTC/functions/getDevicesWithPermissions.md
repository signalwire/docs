> **getDevicesWithPermissions**(`kind?`, `fullList?`): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:57](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L57)

After prompting the user for permission, returns an array of media input and
output devices available on this machine. If `kind` is not null, only the
devices of the specified kind are returned. Possible values of the `kind`
parameters are `"camera"`, `"microphone"`, and `"speaker"`, which
respectively correspond to functions
[getCameraDevicesWithPermissions](getCameraDevicesWithPermissions.md),
[getMicrophoneDevicesWithPermissions](getMicrophoneDevicesWithPermissions.md), and
[getSpeakerDevicesWithPermissions](getSpeakerDevicesWithPermissions.md).

## Parameters

### kind?

`DevicePermissionName`

filter for this device category

### fullList?

`boolean` = `false`

By default, only devices for which
we have been granted permissions are returned. To obtain a list of devices regardless of
the permissions, pass `fullList=true`. Note however that some values such as
`name` and `deviceId` could be omitted.

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getDevicesWithPermissions("camera")
// [
//   {
//     "deviceId": "Rug5Bk...4TMhY=",
//     "kind": "videoinput",
//     "label": "HD FaceTime Camera",
//     "groupId": "Su/dzw...ccfnY="
//   }
// ]
```

## Deprecated

Use [getDevices](getDevices.md) for better cross browser compatibility.
