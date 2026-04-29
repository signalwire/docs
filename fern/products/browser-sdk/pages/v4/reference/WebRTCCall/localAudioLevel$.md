---
title: "localAudioLevel$"
---

# localAudioLevel$

#### Get Signature

> **get** **localAudioLevel$**(): `Observable`\<`number`\>

Defined in: [core/entities/Call.ts:1370](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1370)

Observable of the RMS audio level of the local microphone, 0..1.
Emits at ~30fps while a mic track is active. Engages the local audio
pipeline on first subscription.

##### Returns

`Observable`\<`number`\>
