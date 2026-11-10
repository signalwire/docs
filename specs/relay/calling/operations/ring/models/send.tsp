import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Identifies the inbound call to ring.")
@summary("Ring parameters")
model RingParams {
  ...CallAddress;
}
