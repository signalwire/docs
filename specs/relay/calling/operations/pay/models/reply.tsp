import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Pay started")
model PayResult {
  ...RelayResultWithCall<"Processing payment">;
}

@summary("Pay stopped")
model PayStopResult {
  ...RelayResult<"Stopping payment">;
}
