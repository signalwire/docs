import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model QueueEnterResult {
  ...RelayResult;
}

model QueueLeaveResult {
  ...RelayResult;
}
