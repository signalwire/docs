import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Send digits result")
model SendDigitsResult {
  ...RelayResult<"Sending">;
}
