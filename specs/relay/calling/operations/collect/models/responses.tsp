import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model CollectResult {
  ...RelayResult;
}

model CollectStopResult {
  ...RelayResult;
}

model CollectStartInputTimersResult {
  ...RelayResult;
}
