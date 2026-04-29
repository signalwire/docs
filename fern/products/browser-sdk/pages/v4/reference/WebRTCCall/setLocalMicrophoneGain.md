---
title: "setLocalMicrophoneGain"
---

# setLocalMicrophoneGain

> **setLocalMicrophoneGain**(`value`): `void`

Defined in: [core/entities/Call.ts:1337](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L1337)

Set the local microphone gain as a percentage applied before transmission.

  - `0`   = silent
  - `100` = unity (no change, default)
  - `200` = 2× digital boost (max; expect clipping / noise amplification)

Values are clamped to [0, 200]. Engages the local audio pipeline on
first use (one-time cost).

Note: this is a **digital** multiplier applied in a Web Audio GainNode
between your mic track and the RTCRtpSender — it does not change the
physical mic's hardware sensitivity. Browsers' autoGainControl can
fight the setting; call [setAutoGainControl](#setautogaincontrol)(false) for
predictable behaviour.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | `number` | Gain percentage (0..200; 100 = unity). |

#### Returns

`void`
