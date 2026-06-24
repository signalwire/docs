import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.pay
// ─────────────────────────────────────────────────────────────────────────────

/** Where a payment is in its lifecycle: `processing`, `finished`, or `error`. */
union PayState {
  "processing",
  "finished",
  "error",
}

model CallPayParams {
  ...CallAddress;

  /** The `control_id` of the payment this event belongs to. */
  control_id: string;

  /** Whether the payment is in progress (`processing`), completed (`finished`), or failed (`error`). */
  state: PayState;
}

/** Fires as a pay session progresses, letting you track whether it is processing, has finished, or hit an error. */
@event("calling.call.pay")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "processing",
})
model CallPayEvent {
  ...CallPayParams;
}

// NOTE: `calling.error` is intentionally NOT modeled here. Verified in
// mod_infrastructure/relay.c (relay_call_error_event_create, ~line 1545): error events have their
// event_channel rewritten to the call_id specifically so they are "only delivered to database / UI"
// and "do not get delivered over websocket to client SDK." Clients never receive it. Operation
// failures surface to clients via each command's own event error state (e.g. call.play
// state:"error", CallCollectResultError, call.detect "error") and the RPC reply.
