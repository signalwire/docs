import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.hold
// ─────────────────────────────────────────────────────────────────────────────

@doc("Whether the call was just placed on `hold` or taken off hold (`unhold`).")
union HoldState {
  "hold",
  "unhold",
}

model CallHoldParams {
  ...CallAddress;

  @doc("Whether the call is now on hold (`hold`) or off hold (`unhold`).")
  state: HoldState;
}

const callingCallHold = "calling.call.hold";
@doc("Fires whenever a call is placed on hold or taken off hold.")
@summary(callingCallHold)
@extension("x-fern-display-name", callingCallHold)
model CallHoldEvent is SignalwireEvent<typeof callingCallHold, CallHoldParams>;
