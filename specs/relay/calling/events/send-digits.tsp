import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.send_digits
// ─────────────────────────────────────────────────────────────────────────────

model CallSendDigitsParams {
  ...CallAddress;

  /** The `control_id` of the send-digits operation this event belongs to. */
  control_id: string;

  /** Always `finished`: the digits have all been sent. */
  state: "finished";
}

/** Fires once all requested DTMF digits have finished playing on the call. */
@event("calling.call.send_digits")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "finished",
})
model CallSendDigitsEvent {
  ...CallSendDigitsParams;
}
