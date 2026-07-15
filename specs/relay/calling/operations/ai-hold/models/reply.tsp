import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI hold result")
@doc("Confirmation that the AI session was put on hold.")
model AiHoldResult {
  ...RelayResultWithCall<"+OK">;
}

@summary("AI unhold result")
@doc("Confirmation that the AI session was resumed from hold.")
model AiUnholdResult {
  ...RelayResultWithCall<"+OK">;
}
