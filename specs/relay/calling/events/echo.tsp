import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.echo
// ─────────────────────────────────────────────────────────────────────────────

/** Whether the call is currently `echoing` its audio back or has `finished`. */
union EchoState {
  "echoing",
  "finished",
}

model CallEchoParams {
  ...CallAddress;

  /** Whether the echo is still running (`echoing`) or has stopped (`finished`). */
  state: EchoState;
}

/** Fires when audio echo starts on a call and again when it stops. */
@event("calling.call.echo")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  state: "echoing",
})
model CallEchoEvent {
  ...CallEchoParams;
}
