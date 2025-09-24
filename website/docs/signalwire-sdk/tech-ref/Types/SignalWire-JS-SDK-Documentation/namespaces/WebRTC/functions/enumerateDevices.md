> **enumerateDevices**(): `Promise`\<`MediaDeviceInfo`[]\>

Defined in: [packages/webrtc/src/utils/enumerateDevices.ts:25](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/enumerateDevices.ts#L25)

Enumerates the media input and output devices available on this device.

> 📘
> Depending on the browser, some information (such as the `label` and
> `deviceId` attributes) could be hidden until permission is granted, for
> example by calling [getUserMedia](getUserMedia.md).

## Returns

`Promise`\<`MediaDeviceInfo`[]\>

## Example

```typescript
await SignalWire.WebRTC.enumerateDevices()
// [
//   {
//     "deviceId": "Rug5Bk...4TMhY=",
//     "kind": "videoinput",
//     "label": "HD FaceTime Camera",
//     "groupId": "EEX/N2...AjrOs="
//   },
//   ...
// ]
```
