import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model StreamResult {
  ...RelayResult;

  /** Echo of the stream `control_id`. */
  control_id?: string;

  /** Node the call is on (this method echoes `node_id`, not `call_id`). */
  node_id?: string;
}

model StreamStopResult {
  ...RelayResult;

  /** Echo of the stream `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}
