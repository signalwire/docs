import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model HoldResult {
  ...RelayResult;

  /** The resulting hold state, always `"hold"`. */
  state?: "hold";
}

model UnholdResult {
  ...RelayResult;

  /** The resulting hold state, always `"unhold"`. */
  state?: "unhold";
}
