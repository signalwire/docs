import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

model CallSendDigitsParams {
  ...CallAddress;

  @doc("The `control_id` of the send-digits operation this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("`finished` once all the digits have been sent, or `error` if the request failed.")
  @example("finished")
  state: "finished" | "error";
}

const callingCallSendDigits = "calling.call.send_digits";
@doc("Fires when a send-digits operation completes — `finished` once all requested DTMF tones have played, or `error` if it failed.")
@summary(callingCallSendDigits)
@extension("x-fern-display-name", callingCallSendDigits)
model CallSendDigitsEvent is SignalwireEvent<typeof callingCallSendDigits, CallSendDigitsParams>;
