import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.vmuted.hide.set`.")
@summary("Hide video-muted parameters")
model VmutedHideSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("Whether to hide video-muted members from the layout.")
  @example(true)
  hide: boolean;
}

@doc("Parameters for `call.lock`.")
@summary("Lock parameters")
model LockParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;
}

@doc("Parameters for `call.unlock`.")
@summary("Unlock parameters")
model UnlockParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;
}

@doc("Parameters for `call.lowbitrate.set`.")
@summary("Low-bitrate parameters")
model LowbitrateSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to set low-bitrate mode for. Omit to act on yourself (`self`).")
  target?: Target;

  @doc("Whether to enable low-bitrate mode for the member.")
  @example(true)
  lowbitrate: boolean;
}

@doc("Parameters for `call.denoise.set`.")
@summary("Denoise parameters")
model DenoiseSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to set denoise for. Omit to act on yourself (`self`).")
  target?: Target;

  @doc("Whether to enable denoise for the member.")
  @example(true)
  denoise: boolean;
}

@doc("Parameters for `call.audioflags.set`. Set any combination of the audio processing flags.")
@summary("Audio flags parameters")
model AudioflagsSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to set audio flags for. Omit to act on yourself (`self`).")
  target?: Target;

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
