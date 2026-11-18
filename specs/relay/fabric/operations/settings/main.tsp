import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callVmutedHideSet = "call.vmuted.hide.set";
const callVmutedHideSetResponse = "${callVmutedHideSet} response";
model VmutedHideSetRequest
  is JsonRpcRequest<typeof callVmutedHideSet, VmutedHideSetParams>;
model VmutedHideSetResult { ...FabricResult; }
@extension("x-fern-display-name", callVmutedHideSetResponse)
@reply
model VmutedHideSetReply is JsonRpcResponse<VmutedHideSetResult>;

@doc("""
  Hides video-muted members from the room layout. Send `hide: true`. A `room.updated`
  event follows.

  Returns code `"403"` when the target is on a 1:1 call rather than in a conference,
  or when you lack permission.
  """)
@channel(callVmutedHideSet)
@summary("Hide video-muted members")
@extension("x-fern-display-name", callVmutedHideSet)
op vmutedHideSet(...VmutedHideSetRequest): VmutedHideSetReply;

const callLock = "call.lock";
const callLockResponse = "${callLock} response";
model LockRequest is JsonRpcRequest<typeof callLock, LockParams>;
model LockResult { ...FabricResult; }
@extension("x-fern-display-name", callLockResponse)
@reply
model LockReply is JsonRpcResponse<LockResult>;

@doc("""
  Locks the room to new participants. A `room.updated` event follows.

  Returns code `"403"` when the target is on a 1:1 call rather than in a conference,
  or when you lack permission.
  """)
@channel(callLock)
@summary("Lock the room")
@extension("x-fern-display-name", callLock)
op lock(...LockRequest): LockReply;

const callUnlock = "call.unlock";
const callUnlockResponse = "${callUnlock} response";
model UnlockRequest is JsonRpcRequest<typeof callUnlock, UnlockParams>;
model UnlockResult { ...FabricResult; }
@extension("x-fern-display-name", callUnlockResponse)
@reply
model UnlockReply is JsonRpcResponse<UnlockResult>;

@doc("""
  Unlocks the room, reversing `call.lock`. A `room.updated` event follows.

  Returns code `"403"` when the target is on a 1:1 call rather than in a conference,
  or when you lack permission.
  """)
@channel(callUnlock)
@summary("Unlock the room")
@extension("x-fern-display-name", callUnlock)
op unlock(...UnlockRequest): UnlockReply;

const callLowbitrateSet = "call.lowbitrate.set";
const callLowbitrateSetResponse = "${callLowbitrateSet} response";
model LowbitrateSetRequest
  is JsonRpcRequest<typeof callLowbitrateSet, LowbitrateSetParams>;
model LowbitrateSetResult { ...FabricResult; }
@extension("x-fern-display-name", callLowbitrateSetResponse)
@reply
model LowbitrateSetReply is JsonRpcResponse<LowbitrateSetResult>;

@doc("""
  Enables or disables low-bitrate mode for a member. Target yourself with `self` or another member with `target`. A `member.updated`
  event follows.

  Returns code `"403"` when the target is on a 1:1 call rather than in a conference,
  or when you lack permission to act on that member.
  """)
@channel(callLowbitrateSet)
@summary("Set a member's low-bitrate mode")
@extension("x-fern-display-name", callLowbitrateSet)
op lowbitrateSet(...LowbitrateSetRequest): LowbitrateSetReply;

const callDenoiseSet = "call.denoise.set";
const callDenoiseSetResponse = "${callDenoiseSet} response";
model DenoiseSetRequest
  is JsonRpcRequest<typeof callDenoiseSet, DenoiseSetParams>;
model DenoiseSetResult { ...FabricResult; }
@extension("x-fern-display-name", callDenoiseSetResponse)
@reply
model DenoiseSetReply is JsonRpcResponse<DenoiseSetResult>;

@doc("""
  Enables or disables noise reduction (denoise) for a member. Target yourself with `self` or another member with `target`. A `member.updated`
  event follows.

  Returns code `"403"` when the target is on a 1:1 call rather than in a conference,
  or when you lack permission to act on that member.
  """)
@channel(callDenoiseSet)
@summary("Set a member's denoise")
@extension("x-fern-display-name", callDenoiseSet)
op denoiseSet(...DenoiseSetRequest): DenoiseSetReply;

const callAudioflagsSet = "call.audioflags.set";
const callAudioflagsSetResponse = "${callAudioflagsSet} response";
model AudioflagsSetRequest
  is JsonRpcRequest<typeof callAudioflagsSet, AudioflagsSetParams>;
model AudioflagsSetResult { ...FabricResult; }
@extension("x-fern-display-name", callAudioflagsSetResponse)
@reply
model AudioflagsSetReply is JsonRpcResponse<AudioflagsSetResult>;

@doc("""
  Sets a member's audio processing flags — echo cancellation, noise suppression, automatic gain. Send at least one flag. Target yourself with `self` or another member with `target`. A `member.updated`
  event follows.

  Returns code `"403"` when the target is on a 1:1 call rather than in a conference,
  or when you lack permission to act on that member.
  """)
@channel(callAudioflagsSet)
@summary("Set a member's audio flags")
@extension("x-fern-display-name", callAudioflagsSet)
op audioflagsSet(...AudioflagsSetRequest): AudioflagsSetReply;
