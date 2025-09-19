> **checkSpeakerPermissions**(): `Promise`\<`null` \| `boolean`\>

Defined in: [packages/webrtc/src/utils/permissions.ts:89](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/permissions.ts#L89)

Asynchronously returns whether we have permissions to access the speakers.

## Returns

`Promise`\<`null` \| `boolean`\>

## Example

```typescript
await SignalWire.WebRTC.checkSpeakerPermissions()
// true
```
