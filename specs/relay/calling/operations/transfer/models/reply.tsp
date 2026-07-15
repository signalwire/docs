import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Transfer result")
model TransferResult {
  ...RelayResultWithCall<"Transferring">;
}
