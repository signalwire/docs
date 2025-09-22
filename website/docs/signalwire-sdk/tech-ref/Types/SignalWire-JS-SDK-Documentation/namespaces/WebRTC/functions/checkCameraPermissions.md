> **checkCameraPermissions**(): `Promise`\<`null` \| `boolean`\>

Defined in: [packages/webrtc/src/utils/permissions.ts:67](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/permissions.ts#L67)

Asynchronously returns whether we have permissions to access the camera.

## Returns

`Promise`\<`null` \| `boolean`\>

## Example

```typescript
await SignalWire.WebRTC.checkCameraPermissions()
// true
```
