import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiHoldResult {
  ...RelayResult<"+OK">;
}

model AiUnholdResult {
  ...RelayResult<"+OK">;
}
