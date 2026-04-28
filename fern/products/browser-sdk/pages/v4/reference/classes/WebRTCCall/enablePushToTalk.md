# enablePushToTalk

> **enablePushToTalk**(): `void`

Defined in: [core/entities/Call.ts:1405](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/entities/Call.ts#L1405)

Enable push-to-talk: while [setPushToTalkActive](#setpushtotalkactive) has been called
with `false`, the microphone gain is forced to 0; calling
[setPushToTalkActive](#setpushtotalkactive) with `true` restores the configured gain.
Use this instead of mute/unmute for instant talk/silence transitions
because it doesn't rebuild the track.

This method installs the pipeline but does not attach any keyboard
listener — consumers bind the key themselves and call
[setPushToTalkActive](#setpushtotalkactive) on keydown/keyup.

#### Returns

`void`
