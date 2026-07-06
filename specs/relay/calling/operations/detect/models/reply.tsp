import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DetectResult {
  ...RelayResult<"Detecting">;
}

model DetectStopResult {
  ...RelayResult<"Stopping detect">;
}
