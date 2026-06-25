import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model StreamResult {
  ...RelayResult;

  @doc("Echo of the stream `control_id`.")
  control_id?: string;

  @doc("Node the call is on (this method echoes `node_id`, not `call_id`).")
  node_id?: string;
}

model StreamStopResult {
  ...RelayResult;

  @doc("Echo of the stream `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}
