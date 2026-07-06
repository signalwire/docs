import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model BindDigitResult {
  ...RelayResultWithCall<"Digit binding created">;
}

model ClearDigitBindingsResult {
  ...RelayResultWithCall<"Digit bindings cleared">;
}
