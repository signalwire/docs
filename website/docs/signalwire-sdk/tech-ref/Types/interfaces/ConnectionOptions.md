Defined in: [packages/webrtc/src/utils/interfaces.ts:8](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L8)

## Properties

### additionalDevice?

> `optional` **additionalDevice**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:54](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L54)

**`Internal`**

***

### attach?

> `optional` **attach**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:36](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L36)

**`Internal`**

***

### audio?

> `optional` **audio**: `boolean` \| `MediaTrackConstraints`

Defined in: [packages/webrtc/src/utils/interfaces.ts:32](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L32)

Audio constraints to use when joining the room. Default: `true`.

***

### autoApplyMediaParams?

> `optional` **autoApplyMediaParams**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:80](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L80)

**`Internal`**

***

### callerName?

> `optional` **callerName**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:17](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L17)

**`Internal`**

***

### callerNumber?

> `optional` **callerNumber**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:19](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L19)

**`Internal`**

***

### camId?

> `optional` **camId**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:44](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L44)

**`Internal`**

***

### camLabel?

> `optional` **camLabel**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:46](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L46)

**`Internal`**

***

### connectionPoolSize?

> `optional` **connectionPoolSize**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:112](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L112)

**`Internal`**

Number of connections to maintain in the connection pool.
Set to 0 to disable connection pooling. Default: 3

***

### destinationNumber?

> `optional` **destinationNumber**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:11](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L11)

**`Internal`**

***

### disableUdpIceServers?

> `optional` **disableUdpIceServers**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:30](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L30)

Disable ICE UDP transport policy

***

### enableConnectionPool?

> `optional` **enableConnectionPool**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:120](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L120)

**`Internal`**

Whether to enable connection pooling for faster call setup.
When enabled, maintains pre-warmed RTCPeerConnections with gathered ICE candidates.
Default: true

***

### fromCallAddressId?

> `optional` **fromCallAddressId**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:100](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L100)

**`Internal`**

***

### googleMaxBitrate?

> `optional` **googleMaxBitrate**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:58](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L58)

**`Internal`**

***

### googleMinBitrate?

> `optional` **googleMinBitrate**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:60](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L60)

**`Internal`**

***

### googleStartBitrate?

> `optional` **googleStartBitrate**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:62](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L62)

**`Internal`**

***

### iceCandidatePoolSize?

> `optional` **iceCandidatePoolSize**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:128](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L128)

**`Internal`**

Size of the ICE candidate pool for reuse.
Allows ICE candidates to be reused when tracks are replaced.
Default: 10

***

### iceGatheringTimeout?

> `optional` **iceGatheringTimeout**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:84](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L84)

**`Internal`**

***

### iceServers?

> `optional` **iceServers**: `RTCIceServer`[]

Defined in: [packages/webrtc/src/utils/interfaces.ts:28](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L28)

List of ICE servers.

***

### layout?

> `optional` **layout**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:104](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L104)

***

### localStream?

> `optional` **localStream**: `MediaStream`

Defined in: [packages/webrtc/src/utils/interfaces.ts:24](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L24)

**`Internal`**

***

### maxConnectionStateTimeout?

> `optional` **maxConnectionStateTimeout**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:88](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L88)

**`Internal`**

***

### maxIceGatheringTimeout?

> `optional` **maxIceGatheringTimeout**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:86](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L86)

**`Internal`**

***

### micId?

> `optional` **micId**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:40](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L40)

**`Internal`**

***

### micLabel?

> `optional` **micLabel**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:42](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L42)

**`Internal`**

***

### msStreamsNumber?

> `optional` **msStreamsNumber**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:72](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L72)

**`Internal`**

***

### negotiateAudio?

> `optional` **negotiateAudio**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:64](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L64)

**`Internal`**

***

### negotiateVideo?

> `optional` **negotiateVideo**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:66](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L66)

**`Internal`**

***

### nodeId?

> `optional` **nodeId**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:98](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L98)

**`Internal`**

***

### pingSupported?

> `optional` **pingSupported**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:94](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L94)

**`Internal`**

***

### positions?

> `optional` **positions**: [`VideoPositions`](../type-aliases/VideoPositions.md)

Defined in: [packages/webrtc/src/utils/interfaces.ts:105](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L105)

***

### prevCallId?

> `optional` **prevCallId**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:96](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L96)

**`Internal`**

***

### profileId?

> `optional` **profileId**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:102](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L102)

**`Internal`**

***

### recoverCall?

> `optional` **recoverCall**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:56](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L56)

**`Internal`**

***

### remoteCallerName?

> `optional` **remoteCallerName**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:13](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L13)

**`Internal`**

***

### remoteCallerNumber?

> `optional` **remoteCallerNumber**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:15](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L15)

**`Internal`**

***

### remoteSdp?

> `optional` **remoteSdp**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:22](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L22)

**`Internal`**

***

### remoteStream?

> `optional` **remoteStream**: `MediaStream`

Defined in: [packages/webrtc/src/utils/interfaces.ts:26](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L26)

**`Internal`**

***

### requestTimeout?

> `optional` **requestTimeout**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:74](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L74)

**`Internal`**

***

### rtcPeerConfig?

> `optional` **rtcPeerConfig**: `object`

Defined in: [packages/webrtc/src/utils/interfaces.ts:82](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L82)

**`Internal`**

#### Index Signature

\[`key`: `string`\]: `any`

***

### screenShare?

> `optional` **screenShare**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:52](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L52)

**`Internal`**

***

### sfu?

> `optional` **sfu**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:68](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L68)

**`Internal`**

***

### shakenCheck?

> `optional` **shakenCheck**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:76](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L76)

**`Internal`**

***

### shakenResult?

> `optional` **shakenResult**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:78](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L78)

**`Internal`**

***

### simulcast?

> `optional` **simulcast**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:70](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L70)

**`Internal`**

***

### speakerId?

> `optional` **speakerId**: `string`

Defined in: [packages/webrtc/src/utils/interfaces.ts:48](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L48)

Id of the speaker device to use for audio output. If undefined, picks a default speaker.

***

### userVariables?

> `optional` **userVariables**: `object`

Defined in: [packages/webrtc/src/utils/interfaces.ts:50](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L50)

**`Internal`**

#### Index Signature

\[`key`: `string`\]: `any`

***

### useStereo?

> `optional` **useStereo**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:38](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L38)

**`Internal`**

***

### video?

> `optional` **video**: `boolean` \| `MediaTrackConstraints`

Defined in: [packages/webrtc/src/utils/interfaces.ts:34](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L34)

Video constraints to use when joining the room. Default: `true`.

***

### watchMediaPackets?

> `optional` **watchMediaPackets**: `boolean`

Defined in: [packages/webrtc/src/utils/interfaces.ts:90](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L90)

**`Internal`**

***

### watchMediaPacketsTimeout?

> `optional` **watchMediaPacketsTimeout**: `number`

Defined in: [packages/webrtc/src/utils/interfaces.ts:92](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/webrtc/src/utils/interfaces.ts#L92)

**`Internal`**
