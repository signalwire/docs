import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Echo result")
model EchoResult {
  ...RelayResultWithCall<"Echoing">;
}
