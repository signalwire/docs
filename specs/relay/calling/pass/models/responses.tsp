import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Result of `calling.pass`. */
model PassResult {
  ...RelayResult;
}
