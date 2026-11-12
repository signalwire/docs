import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Pay started")
model PayResult {
  ...RelayResult<"Processing payment">;
}

@summary("Pay stopped")
model PayStopResult {
  ...RelayResult<"Stopping payment">;
}
