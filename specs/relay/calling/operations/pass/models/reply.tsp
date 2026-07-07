import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Result of `calling.pass`.")
@summary("Pass result")
model PassResult {
  ...RelayResultWithCall<"Passing call to another application">;
}
