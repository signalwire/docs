> **createMicrophoneAnalyzer**(`options`): `Promise`\<[`MicrophoneAnalyzer`](../../../../interfaces/MicrophoneAnalyzer.md)\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:745](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L745)

Initializes a microphone analyzer. You can use a MicrophoneAnalyzer to track
the input audio volume.

To stop the analyzer, plase call the `destroy()` method on the object
returned by this method.

The returned object emits the following events:

  - `volumeChanged`: instantaneous volume from 0 to 100
  - `destroyed`: the object has been destroyed. You get a parameter
    describing the reason, which can be `null` (if you called `destroy()`),
    `"error"` (in case of errors), or `"disconnected"` (if the device was
    disconnected).

## Parameters

### options

either the id of the device to analize, or
[MediaStreamConstraints](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamConstraints),
or a
[MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream).

`string` | `MediaStream` | `MediaTrackConstraints`

## Returns

`Promise`\<[`MicrophoneAnalyzer`](../../../../interfaces/MicrophoneAnalyzer.md)\>

Asynchronously returns a MicrophoneAnalyzer.

## Example

```js
const micAnalyzer = await createMicrophoneAnalyzer('device-id')

micAnalyzer.on('volumeChanged', (vol) => {
  console.log("Volume: ", vol)
})
micAnalyzer.on('destroyed', (reason) => {
  console.log('Microphone analyzer destroyed', reason)
})

micAnalyzer.destroy()
```
