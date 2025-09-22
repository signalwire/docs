> **getDisplayMedia**(`constraints?`): `Promise`\<`MediaStream`\>

Defined in: [packages/webrtc/src/utils/getDisplayMedia.ts:18](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/getDisplayMedia.ts#L18)

Prompts the user to share the screen and asynchronously returns a
[MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream)
object associated with a display or part of it.

## Parameters

### constraints?

`MediaStreamConstraints`

an optional
[MediaStreamConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamConstraints)
object specifying requirements for the returned [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream).

## Returns

`Promise`\<`MediaStream`\>

## Example

```typescript
await SignalWire.WebRTC.getDisplayMedia()
// MediaStream {id: "HCXy...", active: true, ...}
```
