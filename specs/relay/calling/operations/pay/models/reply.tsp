import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PayResult {
  ...RelayResultWithCall<"Processing payment">;
}

model PayStopResult {
  ...RelayResult<"Stopping payment">;
}
