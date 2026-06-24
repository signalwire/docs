import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.hold
// ─────────────────────────────────────────────────────────────────────────────

/** Whether the call was just placed on `hold` or taken off hold (`unhold`). */
union HoldState {
  "hold",
  "unhold",
}

model CallHoldParams {
  ...CallAddress;

  /** Whether the call is now on hold (`hold`) or off hold (`unhold`). */
  state: HoldState;
}

/** Fires whenever a call is placed on hold or taken off hold. */
@event("calling.call.hold")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  state: "hold",
})
model CallHoldEvent {
  ...CallHoldParams;
}
