import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PayResult {
  ...RelayResult;

  @doc("Echo of the `control_id` from the request.")
  control_id?: string;
}

model PayStopResult {
  ...RelayResult;
}
