import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model QueueEnterResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

model QueueLeaveResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}
