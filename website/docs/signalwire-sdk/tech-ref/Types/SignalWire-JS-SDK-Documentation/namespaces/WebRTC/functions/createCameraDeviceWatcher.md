> **createCameraDeviceWatcher**(): `Promise`\<`EventEmitter`\<`DeviceWatcherEvents`, `any`\>\>

Defined in: [packages/webrtc/src/utils/deviceHelpers.ts:654](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/deviceHelpers.ts#L654)

Asynchronously returns an event emitter that notifies changes in all camera
devices. This is equivalent to calling
`createDeviceWatcher({ targets: ['camera'] })`, so refer to
[createDeviceWatcher](createDeviceWatcher.md) for additional information about the returned
event emitter.

## Returns

`Promise`\<`EventEmitter`\<`DeviceWatcherEvents`, `any`\>\>
