import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model ConnectResult {
  ...RelayResultBase<"Connecting call">;

  @doc("Per-destination detail returned by `calling.connect`, present on partial failure — one entry per attempted destination.")
  message_data?: unknown[];
}
