import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Identifies the inbound call offer you want to pass on. */
model PassParams {
  ...CallAddress;
}
