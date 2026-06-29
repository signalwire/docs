import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.denoise
// ─────────────────────────────────────────────────────────────────────────────

model CallDenoiseParams {
  ...CallAddress;

  @doc("Whether background noise reduction is now on (`true`) or off.")
  denoised: boolean;
}

@doc("Fires when background noise reduction is turned on or off for the call. Unlike most media events, this one carries no `control_id`.")
@summary("calling.call.denoise")
model CallDenoiseEvent is SignalwireEvent<"calling.call.denoise", CallDenoiseParams>;
