import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI hold result")
model AiHoldResult {
  ...RelayResultWithCall<"+OK">;
}

@summary("AI unhold result")
model AiUnholdResult {
  ...RelayResultWithCall<"+OK">;
}
