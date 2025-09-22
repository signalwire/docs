> **getMicrophoneDevices**(): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:231](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L231)

Returns an array of microphone devices that can be accessed on this device (for which we have permissions).

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getMicrophoneDevices()
// [
//   {
//     "deviceId": "ADciLf...NYgF8=",
//     "kind": "audioinput",
//     "label": "Internal Microphone",
//     "groupId": "rgZgKM...NW1hU="
//   }
// ]
```
