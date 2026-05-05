---
title: "setAudioInputSensitivity"
---

> **setAudioInputSensitivity**(`value`): `Promise`\<`void`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Participant.ts#L504)</sub>

Adjusts the **conference-only** microphone energy gate / sensitivity level
for this member. Routes through the conferencing mix engine
(`signalwire.conferencing member.set_input_sensitivity`) and has no effect
on 1:1 WebRTC calls — for those, use browser audio constraints via
Call.setNoiseSuppression / Call.setAutoGainControl.

This is **not** a local PC mic gain control; it only changes how the
server-side mixer decides to open the mic gate on this participant.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | `number` | Sensitivity level as understood by the conference engine (integer, larger values are more sensitive). |

#### Returns

`Promise`\<`void`\>

#### Inherited from

[`Participant`](../Participant/index.md).[`setAudioInputSensitivity`](../Participant/index.md#setaudioinputsensitivity)
