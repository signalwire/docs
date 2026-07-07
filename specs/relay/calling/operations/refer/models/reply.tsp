import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Refer result")
model ReferResult {
  ...RelayResultBase<"Starting SIP REFER">;
}
