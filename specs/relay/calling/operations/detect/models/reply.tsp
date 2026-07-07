import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Detect started")
model DetectResult {
  ...RelayResult<"Detecting">;
}

@summary("Detect stopped")
model DetectStopResult {
  ...RelayResult<"Stopping detect">;
}
