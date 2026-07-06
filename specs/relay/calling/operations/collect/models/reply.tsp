import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model CollectResult {
  ...RelayResult<"Collecting">;
}

model CollectStopResult {
  ...RelayResult<"Stopping">;
}

model CollectStartInputTimersResult {
  ...RelayResult<"Starting input timers">;
}
