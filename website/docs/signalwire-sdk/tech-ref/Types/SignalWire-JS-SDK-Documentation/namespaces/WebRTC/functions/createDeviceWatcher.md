> **createDeviceWatcher**(`options`): `Promise`\<`EventEmitter`\<`DeviceWatcherEvents`, `any`\>\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:563](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L563)

Asynchronously returns an event emitter that notifies changes in the devices.
The possible events are:

 - "added": a device has been added
 - "removed": a device has been removed
 - "updated": a device has been updated
 - "changed": any of the previous events occurred

In all cases, your event handler gets as parameter an object `e` with the
following keys:

 - `e.changes`: the changed devices. For "added", "removed", and "updated"
   event handlers, you only get the object associated to the respective event
   (i.e., only a list of added devices, removed devices, or updated devices).
   For "changed" event handlers, you get all three lists.
 - `e.devices`: the new list of devices

For device-specific helpers, see [createCameraDeviceWatcher](createCameraDeviceWatcher.md),
[createMicrophoneDeviceWatcher](createMicrophoneDeviceWatcher.md), and [createSpeakerDeviceWatcher](createSpeakerDeviceWatcher.md).

## Parameters

### options

`CreateDeviceWatcherOptions` = `{}`

if null, the event emitter is associated to all devices for
which we have permission. Otherwise, you can pass an object
`{targets: string}`, where the value for key targets is a list of categories.
Allowed categories are `"camera"`, `"microphone"`, and `"speaker"`.

## Returns

`Promise`\<`EventEmitter`\<`DeviceWatcherEvents`, `any`\>\>

## Examples

Creating an event listener on the "changed" event and printing the received parameter after both connecting and disconnecting external headphones:
```typescript
await SignalWire.WebRTC.getUserMedia({audio: true, video: false})
h = await SignalWire.WebRTC.createDeviceWatcher()
h.on('changed', (c) => console.log(c))
```

Getting notified just for changes about audio input and output devices, ignoring the camera:
```typescript
h = await SignalWire.WebRTC.createDeviceWatcher({targets: ['microphone', 'speaker']})
h.on('changed', (c) => console.log(c))
```
