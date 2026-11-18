import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Ring result")
model RingResult {
  ...RelayResultWithCall<"Ringing call">;
}
