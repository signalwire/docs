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
model VmutedHideSetResult { ...FabricResult<"Updated">; }
@extension("x-fern-display-name", callVmutedHideSetResponse)
@reply
model VmutedHideSetReply is JsonRpcResponse<VmutedHideSetResult>;

@doc("Sets whether video-muted members are hidden from the room layout. A `room.updated` event follows.")
@channel(callVmutedHideSet)
@summary("Hide or show video-muted members")
@extension("x-fern-display-name", callVmutedHideSet)
op vmutedHideSet(...VmutedHideSetRequest): VmutedHideSetReply;

const callLock = "call.lock";
const callLockResponse = "${callLock} response";
model LockRequest is JsonRpcRequest<typeof callLock, LockParams>;
model LockResult { ...FabricResult<"Locked">; }
@extension("x-fern-display-name", callLockResponse)
@reply
model LockReply is JsonRpcResponse<LockResult>;

@doc("Locks the room to new participants. A `room.updated` event follows.")
@channel(callLock)
@summary("Lock the room")
@extension("x-fern-display-name", callLock)
op lock(...LockRequest): LockReply;

const callUnlock = "call.unlock";
const callUnlockResponse = "${callUnlock} response";
model UnlockRequest is JsonRpcRequest<typeof callUnlock, UnlockParams>;
model UnlockResult { ...FabricResult<"Unlocked">; }
@extension("x-fern-display-name", callUnlockResponse)
@reply
model UnlockReply is JsonRpcResponse<UnlockResult>;

@doc("Unlocks the room, reversing `call.lock`. A `room.updated` event follows.")
@channel(callUnlock)
@summary("Unlock the room")
@extension("x-fern-display-name", callUnlock)
op unlock(...UnlockRequest): UnlockReply;

const callLowbitrateSet = "call.lowbitrate.set";
const callLowbitrateSetResponse = "${callLowbitrateSet} response";
model LowbitrateSetRequest
  is JsonRpcRequest<typeof callLowbitrateSet, LowbitrateSetParams>;
model LowbitrateSetResult { ...FabricResult<"Updated">; }
@extension("x-fern-display-name", callLowbitrateSetResponse)
@reply
model LowbitrateSetReply is JsonRpcResponse<LowbitrateSetResult>;

@doc("Enables or disables low-bitrate mode for a member. Target yourself with `self` or another member with `target`. A `member.updated` event follows.")
@channel(callLowbitrateSet)
@summary("Set a member's low-bitrate mode")
@extension("x-fern-display-name", callLowbitrateSet)
op lowbitrateSet(...LowbitrateSetRequest): LowbitrateSetReply;

const callDenoiseSet = "call.denoise.set";
const callDenoiseSetResponse = "${callDenoiseSet} response";
model DenoiseSetRequest
  is JsonRpcRequest<typeof callDenoiseSet, DenoiseSetParams>;
model DenoiseSetResult { ...FabricResult<"Updated">; }
@extension("x-fern-display-name", callDenoiseSetResponse)
@reply
model DenoiseSetReply is JsonRpcResponse<DenoiseSetResult>;

@doc("Enables or disables noise reduction (denoise) for a member. Target yourself with `self` or another member with `target`. A `member.updated` event follows.")
@channel(callDenoiseSet)
@summary("Set a member's denoise")
@extension("x-fern-display-name", callDenoiseSet)
op denoiseSet(...DenoiseSetRequest): DenoiseSetReply;

const callAudioflagsSet = "call.audioflags.set";
const callAudioflagsSetResponse = "${callAudioflagsSet} response";
model AudioflagsSetRequest
  is JsonRpcRequest<typeof callAudioflagsSet, AudioflagsSetParams>;
model AudioflagsSetResult { ...FabricResult<"Updated">; }
@extension("x-fern-display-name", callAudioflagsSetResponse)
@reply
model AudioflagsSetReply is JsonRpcResponse<AudioflagsSetResult>;

@doc("Sets a member's audio processing flags — echo cancellation, noise suppression, automatic gain. Target yourself with `self` or another member with `target`. A `member.updated` event follows.")
@channel(callAudioflagsSet)
@summary("Set a member's audio flags")
@extension("x-fern-display-name", callAudioflagsSet)
op audioflagsSet(...AudioflagsSetRequest): AudioflagsSetReply;
