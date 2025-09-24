> **getUserMedia**(`constraints`): `Promise`\<`MediaStream`\>

Defined in: [packages/webrtc/src/utils/getUserMedia.ts:70](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/getUserMedia.ts#L70)

Prompts the user to share one or more media devices and asynchronously
returns an associated [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream)
object.

For more information, see [`MediaDevices.getUserMedia()`](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia).

## Parameters

### constraints

`MediaStreamConstraints` = `...`

an optional [MediaStreamConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamConstraints)
                   object specifying requirements for the returned [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream).

## Returns

`Promise`\<`MediaStream`\>

## Examples

To only request audio media:

```typescript
await SignalWire.WebRTC.getUserMedia({audio: true, video: false})
// MediaStream {id: "HCXy...", active: true, ...}
```

To request both audio and video, specifying constraints for the video:

```typescript
const constraints = {
  audio: true,
  video: {
    width: { min: 1024, ideal: 1280, max: 1920 },
    height: { min: 576, ideal: 720, max: 1080 }
  }
}
await SignalWire.WebRTC.getUserMedia(constraints)
// MediaStream {id: "EDVk...", active: true, ...}
```
