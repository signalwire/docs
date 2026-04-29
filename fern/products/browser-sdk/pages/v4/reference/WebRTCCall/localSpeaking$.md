---
title: "localSpeaking$"
---

# localSpeaking$

#### Get Signature

> **get** **localSpeaking$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Call.ts:1384](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1384)

Observable that is `true` while the local participant is speaking
(RMS level above the VAD threshold, with hold time to avoid flicker).

##### Returns

`Observable`\<`boolean`\>
