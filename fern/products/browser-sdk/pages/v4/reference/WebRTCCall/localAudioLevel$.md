---
title: "localAudioLevel$"
---

#### Get Signature

> **get** **localAudioLevel$**(): `Observable`\<`number`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1370)</sub>

Observable of the RMS audio level of the local microphone, 0..1.
Emits at ~30fps while a mic track is active. Engages the local audio
pipeline on first subscription.

##### Returns

`Observable`\<`number`\>
