import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model BindDigitResult {
  ...RelayResult;
}

model ClearDigitBindingsResult {
  ...RelayResult;
}
