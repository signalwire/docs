import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Queue entered")
model QueueEnterResult {
  ...RelayResultBase<"Entering Queue">;

  @doc("Your control identifier for the queue placement, echoed from your request.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id?: string;
}

@summary("Queue left")
model QueueLeaveResult {
  ...RelayResultBase<"Leaving Queue">;

  @doc("Your control identifier for the queue placement, echoed from your request.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id?: string;
}
