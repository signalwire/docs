> **getCameraDevicesWithPermissions**(): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:79](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L79)

After prompting the user for permission, returns an array of camera devices.

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getCameraDevicesWithPermissions()
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

Use [getCameraDevices](getCameraDevices.md) for better cross browser compatibility.
