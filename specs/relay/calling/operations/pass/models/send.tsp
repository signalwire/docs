import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Identifies the inbound call offer you want to pass on.")
@summary("Pass parameters")
model PassParams {
  ...CallAddress;
}
