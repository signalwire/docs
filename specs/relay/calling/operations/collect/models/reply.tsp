import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Collect started")
model CollectResult {
  ...RelayResult<"Collecting">;
}

@summary("Collect stopped")
model CollectStopResult {
  ...RelayResult<"Stopping">;
}

@summary("Input timers started")
model CollectStartInputTimersResult {
  ...RelayResult<"Starting input timers">;
}
