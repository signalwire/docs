import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

import "../models/core.tsp";

using TypeSpec.OpenAPI;

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

const callingCallSendDigits = "calling.call.send_digits";
@doc("Fires once all requested DTMF digits have finished playing on the call.")
@summary(callingCallSendDigits)
@extension("x-fern-display-name", callingCallSendDigits)
model CallSendDigitsEvent is SignalwireEvent<typeof callingCallSendDigits, CallSendDigitsParams>;
