import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI message result")
model AiMessageResult {
  ...RelayResultWithCall<"+OK">;
}
