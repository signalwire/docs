> **getMicrophoneDevicesWithPermissions**(): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:99](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L99)

After prompting the user for permission, returns an array of microphone devices.

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getMicrophoneDevicesWithPermissions()
// [
//   {
//     "deviceId": "ADciLf...NYgF8=",
//     "kind": "audioinput",
//     "label": "Internal Microphone",
//     "groupId": "rgZgKM...NW1hU="
//   }
// ]
```

## Deprecated

Use [getMicrophoneDevices](getMicrophoneDevices.md) for better cross browser compatibility.
