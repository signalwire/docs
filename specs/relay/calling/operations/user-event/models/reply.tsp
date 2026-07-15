import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("User event result")
model UserEventResult {
  ...RelayResultWithCall<"Sending user event">;
}
