> **checkPermissions**(`name?`): `Promise`\<`null` \| `boolean`\>

Defined in: [packages/webrtc/src/utils/permissions.ts:36](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/permissions.ts#L36)

Asynchronously returns whether we have permissions to access the specified
resource. Some common parameter values for `name` are `"camera"`,
`"microphone"`, and `"speaker"`. In those cases, prefer the dedicated methods
[checkCameraPermissions](checkCameraPermissions.md), [checkMicrophonePermissions](checkMicrophonePermissions.md), and
[checkSpeakerPermissions](checkSpeakerPermissions.md).

## Parameters

### name?

`DevicePermissionName`

name of the resource

## Returns

`Promise`\<`null` \| `boolean`\>

## Example

```typescript
await SignalWire.WebRTC.checkPermissions("camera")
// true: we have permission for using the camera
```
