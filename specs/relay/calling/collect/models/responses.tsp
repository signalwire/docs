import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model CollectResult {
  ...RelayResult;

  @doc("Echoes back the `control_id` you supplied so you can correlate the response.")
  control_id?: string;
}

model CollectStopResult {
  ...RelayResult;
}

model CollectStartInputTimersResult {
  ...RelayResult;
}
