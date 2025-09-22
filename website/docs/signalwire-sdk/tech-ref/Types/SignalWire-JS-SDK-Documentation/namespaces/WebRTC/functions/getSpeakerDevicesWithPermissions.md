> **getSpeakerDevicesWithPermissions**(): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:119](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L119)

After prompting the user for permission, returns an array of speaker devices.

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.getSpeakerDevicesWithPermissions()
// [
//   {
//     "deviceId": "ADciLf...NYgF8=",
//     "kind": "audiooutput",
//     "label": "External Speaker",
//     "groupId": "rgZgKM...NW1hU="
//   }
// ]
```

## Deprecated

Use [getSpeakerDevices](getSpeakerDevices.md) for better cross browser compatibility.
