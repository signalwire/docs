import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Result of `calling.user_event`.")
@summary("User event result")
model UserEventResult {
  ...RelayResultWithCall<"Sending user event">;
}
