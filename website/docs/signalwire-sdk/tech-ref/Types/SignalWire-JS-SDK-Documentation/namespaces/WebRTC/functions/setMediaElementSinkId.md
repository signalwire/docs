> **setMediaElementSinkId**(`el`, `deviceId`): `Promise`\<`undefined`\>

Defined in: [packages/webrtc/src/utils/primitives.ts:77](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/primitives.ts#L77)

Assigns the specified audio output device to the specified HTMLMediaElement.
The device with id `deviceId` must be an audio output device. Asynchronously
returns whether the operation had success.

> 📘
> Some browsers do not support output device selection. You can check by
> calling [`supportsMediaOutput`](supportsMediaOutput).

## Parameters

### el

target element

`null` | `HTMLMediaElement`

### deviceId

`string`

id of the audio output device

## Returns

`Promise`\<`undefined`\>

a promise of whether the operation had success

## Example

```typescript
const el = document.querySelector('video')
const outDevices = await SignalWire.WebRTC.getSpeakerDevicesWithPermissions()
await SignalWire.WebRTC.setMediaElementSinkId(el, outDevices[0].deviceId)
// true
```
