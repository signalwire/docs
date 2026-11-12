import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("End result")
model EndResult {
  ...RelayResultBase<"Ending call">;
}
