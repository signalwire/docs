import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI result")
@doc("Confirmation that the AI session started.")
model AiResult {
  ...RelayResult<"AI started">;
}

@summary("AI stop result")
@doc("Confirmation that the AI session was stopped.")
model AiStopResult {
  ...RelayResult<"+OK">;
}
