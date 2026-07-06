import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiHoldResult {
  ...RelayResultWithCall<"+OK">;
}

model AiUnholdResult {
  ...RelayResultWithCall<"+OK">;
}
