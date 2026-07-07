import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Bind digit result")
model BindDigitResult {
  ...RelayResultWithCall<"Digit binding created">;
}

@summary("Clear digit bindings result")
model ClearDigitBindingsResult {
  ...RelayResultWithCall<"Digit bindings cleared">;
}
