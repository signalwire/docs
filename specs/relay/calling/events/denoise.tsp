import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

import "../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.denoise
// ─────────────────────────────────────────────────────────────────────────────

model CallDenoiseParams {
  ...CallAddress;

  @doc("Whether background noise reduction is now on (`true`) or off.")
  denoised: boolean;
}

const callingCallDenoise = "calling.call.denoise";
@doc("Fires when background noise reduction is turned on or off for the call. Unlike most media events, this one carries no `control_id`.")
@summary(callingCallDenoise)
@extension("x-fern-display-name", callingCallDenoise)
model CallDenoiseEvent is SignalwireEvent<typeof callingCallDenoise, CallDenoiseParams>;
