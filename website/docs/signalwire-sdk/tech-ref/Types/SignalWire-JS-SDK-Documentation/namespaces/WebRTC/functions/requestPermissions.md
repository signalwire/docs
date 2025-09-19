> **requestPermissions**(`constraints`): `Promise`\<`void`\>

Defined in: [packages/webrtc/src/utils/requestPermissions.ts:29](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/requestPermissions.ts#L29)

Prompts the user to grant permissions for the devices matching the specified set of constraints.

## Parameters

### constraints

`MediaStreamConstraints`

an optional [MediaStreamConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamConstraints)
                   object specifying requirements for the returned [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream).

## Returns

`Promise`\<`void`\>

## Examples

To only request audio permissions:

```typescript
await SignalWire.WebRTC.requestPermissions({audio: true, video: false})
```

To request permissions for both audio and video, specifying constraints for the video:
```typescript
const constraints = {
  audio: true,
  video: {
    width: { min: 1024, ideal: 1280, max: 1920 },
    height: { min: 576, ideal: 720, max: 1080 }
  }
}
await SignalWire.WebRTC.requestPermissions(constraints)
```
