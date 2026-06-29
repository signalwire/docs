import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.send_digits
// ─────────────────────────────────────────────────────────────────────────────

model CallSendDigitsParams {
  ...CallAddress;

  @doc("The `control_id` of the send-digits operation this event belongs to.")
  control_id: string;

  @doc("`finished` once all the digits have been sent, or `error` if the request failed.")
  state: "finished" | "error";
}

@doc("Fires once all requested DTMF digits have finished playing on the call.")
@summary("calling.call.send_digits")
model CallSendDigitsEvent is SignalwireEvent<"calling.call.send_digits", CallSendDigitsParams>;
