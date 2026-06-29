import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

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

@doc("Fires whenever a call is placed on hold or taken off hold.")
@summary("calling.call.hold")
model CallHoldEvent is SignalwireEvent<"calling.call.hold", CallHoldParams>;
