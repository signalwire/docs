import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model HoldParams {
  ...CallAddress;
}

model UnholdParams {
  ...CallAddress;
}
