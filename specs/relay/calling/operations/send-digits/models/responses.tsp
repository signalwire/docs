import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendDigitsResult {
  ...RelayResult;

  @doc("The `control_id` you supplied, echoed back.")
  control_id?: string;

  @doc("The id of the call, echoed back from your request.")
  call_id?: string;
}
