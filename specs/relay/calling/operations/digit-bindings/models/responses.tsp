import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model BindDigitResult {
  ...RelayResult;
}

model ClearDigitBindingsResult {
  ...RelayResult;

  @doc("Number of digit bindings removed.")
  cleared: int32;
}
