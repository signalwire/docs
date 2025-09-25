> **getSpeakerDevices**(): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:249](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L249)

Returns an array of speaker devices that can be accessed on this device (for which we have permissions).

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getSpeakerDevices()
// [
//   {
//     "deviceId": "ADciLf...NYgF8=",
//     "kind": "audiooutput",
//     "label": "External Speaker",
//     "groupId": "rgZgKM...NW1hU="
//   }
// ]
```
