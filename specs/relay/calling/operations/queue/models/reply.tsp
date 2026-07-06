import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model QueueEnterResult {
  ...RelayResult<"Entering Queue">;
}

model QueueLeaveResult {
  ...RelayResult<"Leaving Queue">;
}
