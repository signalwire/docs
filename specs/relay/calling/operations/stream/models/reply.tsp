import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Stream result")
model StreamResult {
  ...RelayResult<"Starting stream">;
}

@summary("Stream stop result")
model StreamStopResult {
  ...RelayResult<"Stopping stream">;
}
