import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model StreamResult {
  ...RelayResult<"Starting stream">;
}

model StreamStopResult {
  ...RelayResult<"Stopping stream">;
}
