# Type Alias: Capability

> **Capability** = `"self"` \| `"self.mute"` \| `"self.mute.audio"` \| `"self.mute.audio.on"` \| `"self.mute.audio.off"` \| `"self.mute.video"` \| `"self.mute.video.on"` \| `"self.mute.video.off"` \| `"self.deaf"` \| `"self.deaf.on"` \| `"self.deaf.off"` \| `"self.microphone"` \| `"self.microphone.volume.set"` \| `"self.microphone.sensitivity.set"` \| `"self.speaker"` \| `"self.speaker.volume.set"` \| `"self.position.set"` \| `"self.meta"` \| `"self.audioflags.set"` \| `"member"` \| `"member.mute"` \| `"member.mute.audio"` \| `"member.mute.audio.on"` \| `"member.mute.audio.off"` \| `"member.mute.video"` \| `"member.mute.video.on"` \| `"member.mute.video.off"` \| `"member.deaf"` \| `"member.deaf.on"` \| `"member.deaf.off"` \| `"member.microphone"` \| `"member.microphone.volume.set"` \| `"member.microphone.sensitivity.set"` \| `"member.speaker"` \| `"member.speaker.volume.set"` \| `"member.position.set"` \| `"member.meta"` \| `"member.audioflags.set"` \| `"layout"` \| `"layout.set"` \| `"digit"` \| `"digit.send"` \| `"vmuted"` \| `"vmuted.hide"` \| `"vmuted.hide.on"` \| `"vmuted.hide.off"` \| `"lock"` \| `"lock.on"` \| `"lock.off"` \| `"device"` \| `"screenshare"` \| `"end"`

Defined in: [core/types/call.types.ts:73](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/core/types/call.types.ts#L73)

Feature capability string that controls what actions a participant can perform.

Capabilities are organized into categories:
- **self.\*** — Actions the local participant can perform on themselves (mute, deaf, volume, position, meta).
- **member.\*** — Actions that can be performed on other participants.
- **layout.\*** — Layout management for the video canvas.
- **digit.\*** — DTMF digit sending.
- **vmuted.\*** — Visibility control for muted video participants.
- **lock.\*** — Room lock/unlock control.
- **device** / **screenshare** — Device and screen share capabilities.
- **end** — Permission to end the call or room.
