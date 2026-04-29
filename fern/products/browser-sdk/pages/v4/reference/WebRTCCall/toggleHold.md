---
title: "toggleHold"
---

# toggleHold

> **toggleHold**(): `Promise`\<`void`\>

Defined in: [core/entities/Call.ts:356](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/entities/Call.ts#L356)

Toggles the hold state of the call (pauses/resumes local media transmission).

Distinct from [Participant.toggleMute](../Participant/index.md#togglemute) which mutes individual tracks.

#### Returns

`Promise`\<`void`\>

#### Implementation of

`CallManager.toggleHold`
