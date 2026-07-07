import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Queue entered")
model QueueEnterResult {
  ...RelayResult<"Entering queue">;
}

@summary("Queue left")
model QueueLeaveResult {
  ...RelayResult<"Leaving queue">;
}
