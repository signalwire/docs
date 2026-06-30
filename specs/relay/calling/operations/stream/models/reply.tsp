import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model StreamResult {
  ...RelayResult;

  @doc("Node the call is on (this method echoes `node_id`, not `call_id`).")
  node_id?: string;
}

model StreamStopResult {
  ...RelayResult;
}
