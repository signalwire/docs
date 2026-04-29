---
title: "applySelectedAudioOutputDevice"
---

# applySelectedAudioOutputDevice

> **applySelectedAudioOutputDevice**(`element`): `Promise`\<`boolean`\>

Defined in: [clients/SignalWire.ts:1212](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L1212)

Apply the currently selected audio output device to an HTMLMediaElement
(e.g. the `<audio>` or `<video>` element the consumer attached the
remote stream to). Uses `HTMLMediaElement.setSinkId` under the hood.
Returns a `Promise<boolean>`: `true` if the sink was applied,
`false` if the browser doesn't support `setSinkId` or no device is
selected.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `element` | `HTMLMediaElement` |

#### Returns

`Promise`\<`boolean`\>

#### Example

```ts
audioEl.srcObject = call.remoteStream;
await client.applySelectedAudioOutputDevice(audioEl);
```
