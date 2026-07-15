import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Disconnect result")
model DisconnectResult {
  ...RelayResultBase<"Disconnecting call">;
}
