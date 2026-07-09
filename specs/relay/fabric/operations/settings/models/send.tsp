import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.vmuted.hide.set`.")
@summary("Hide video-muted parameters")
model VmutedHideSetParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The call leg addressing the room to act on — required. Normally set `target` equal to `self`.")
  target: Target;

  @doc("Whether to hide video-muted members from the layout.")
  @example(true)
  hide: boolean;
}

@doc("Parameters for `call.lock`.")
@summary("Lock parameters")
model LockParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The call leg addressing the room to lock — required. Normally set `target` equal to `self`.")
  target: Target;
}

@doc("Parameters for `call.unlock`.")
@summary("Unlock parameters")
model UnlockParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The call leg addressing the room to unlock — required. Normally set `target` equal to `self`.")
  target: Target;
}

@doc("Parameters for `call.lowbitrate.set`.")
@summary("Low-bitrate parameters")
model LowbitrateSetParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to set low-bitrate mode for — required. Set `target` equal to `self` to act on yourself, or to another member's `{node_id, call_id, member_id}` to act on them.")
  target: Target;

  @doc("Whether to enable low-bitrate mode for the member.")
  @example(true)
  lowbitrate: boolean;
}

@doc("Parameters for `call.denoise.set`.")
@summary("Denoise parameters")
model DenoiseSetParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to set denoise for — required. Set `target` equal to `self` to act on yourself, or to another member's `{node_id, call_id, member_id}` to act on them.")
  target: Target;

  @doc("Whether to enable denoise for the member.")
  @example(true)
  denoise: boolean;
}

@doc("Parameters for `call.audioflags.set`. Set any combination of the audio processing flags.")
@summary("Audio flags parameters")
model AudioflagsSetParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to set audio flags for — required. Set `target` equal to `self` to act on yourself, or to another member's `{node_id, call_id, member_id}` to act on them.")
  target: Target;

  @doc("Whether to enable echo cancellation.")
  @example(true)
  echo_cancellation?: boolean;

  @doc("Whether to enable noise suppression.")
  @example(true)
  noise_suppression?: boolean;

  @doc("Whether to enable automatic gain control.")
  @example(true)
  auto_gain?: boolean;
}
