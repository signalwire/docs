import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

model CallDenoiseParams {
  ...CallEventAddress;

  @doc("Whether background noise reduction is now on (`true`) or off.")
  @example(true)
  denoised: boolean;
}

const callingCallDenoise = "calling.call.denoise";
@doc("Fires when background noise reduction is turned on or off for the call. This event does not include a `control_id`.")
@summary(callingCallDenoise)
@extension("x-fern-display-name", callingCallDenoise)
model CallDenoiseEvent is SignalwireEvent<typeof callingCallDenoise, CallDenoiseParams>;
