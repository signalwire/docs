> **getCameraDevices**(): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:213](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L213)

Returns an array of camera devices that can be accessed on this device (for which we have permissions).

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getCameraDevices()
// [
//   {
//     "deviceId": "Rug5Bk...4TMhY=",
//     "kind": "videoinput",
//     "label": "HD FaceTime Camera",
//     "groupId": "Su/dzw...ccfnY="
//   }
// ]
```
