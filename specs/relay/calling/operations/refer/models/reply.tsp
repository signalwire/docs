import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Result of `calling.refer`.")
model ReferResult {
  ...RelayResultBase<"Starting SIP REFER">;
}
