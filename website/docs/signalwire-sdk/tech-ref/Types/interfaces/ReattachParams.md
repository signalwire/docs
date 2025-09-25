Defined in: [packages/client/src/unified/interfaces/wsClient.ts:134](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L134)

## Extends

- `CallParams`

## Properties

### applyLocalVideoOverlay?

> `optional` **applyLocalVideoOverlay**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:114](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L114)

Whether to apply the local-overlay on top of your video. Default: `true`.

#### Inherited from

`CallParams.applyLocalVideoOverlay`

***

### applyMemberOverlay?

> `optional` **applyMemberOverlay**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:116](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L116)

Whether to apply an overlay on top of each member. Default: `true`.

#### Inherited from

`CallParams.applyMemberOverlay`

***

### audio?

> `optional` **audio**: `boolean` \| `MediaTrackConstraints`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:106](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L106)

Audio constraints to use when joining the room. Default: `true`.

#### Inherited from

`CallParams.audio`

***

### disableUdpIceServers?

> `optional` **disableUdpIceServers**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:104](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L104)

Disable ICE UDP transport policy

#### Inherited from

`CallParams.disableUdpIceServers`

***

### fromCallAddressId?

> `optional` **fromCallAddressId**: `string`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:124](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L124)

Call address ID matching one of the subscriber’s addresses to attribute conversation API events in the INVITE.

#### Inherited from

`CallParams.fromCallAddressId`

***

### listen?

> `optional` **listen**: `Partial`\<`CallListeners`\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:138](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L138)

Optional event listeners for the call session

***

### mirrorLocalVideoOverlay?

> `optional` **mirrorLocalVideoOverlay**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:118](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L118)

Whether to mirror the local video overlay. Default: `false`.

#### Inherited from

`CallParams.mirrorLocalVideoOverlay`

***

### negotiateAudio?

> `optional` **negotiateAudio**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:110](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L110)

Negotiate the incoming audio from the RTC. Default: `true`.

#### Inherited from

`CallParams.negotiateAudio`

***

### negotiateVideo?

> `optional` **negotiateVideo**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:112](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L112)

Negotiate the incoming video from the RTC. Default: `true` for "video" channel.

#### Inherited from

`CallParams.negotiateVideo`

***

### nodeId?

> `optional` **nodeId**: `string`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:136](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L136)

***

### rootElement?

> `optional` **rootElement**: `null` \| `HTMLElement`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:97](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L97)

HTML element in which to display the video stream

#### Inherited from

`CallParams.rootElement`

***

### stopCameraWhileMuted?

> `optional` **stopCameraWhileMuted**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:120](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L120)

Whether to stop the camera when the member is muted. Default: `true`.

#### Inherited from

`CallParams.stopCameraWhileMuted`

***

### stopMicrophoneWhileMuted?

> `optional` **stopMicrophoneWhileMuted**: `boolean`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:122](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L122)

Whether to stop the microphone when the member is muted. Default: `true`.

#### Inherited from

`CallParams.stopMicrophoneWhileMuted`

***

### to?

> `optional` **to**: `string`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:135](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L135)

***

### userVariables?

> `optional` **userVariables**: `Record`\<`string`, `any`\>

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:99](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L99)

User & UserAgent metadata

#### Inherited from

`CallParams.userVariables`

***

### video?

> `optional` **video**: `boolean` \| `MediaTrackConstraints`

Defined in: [packages/client/src/unified/interfaces/wsClient.ts:108](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/unified/interfaces/wsClient.ts#L108)

Video constraints to use when joining the room. Default: `true` for "video" channel.

#### Inherited from

`CallParams.video`
