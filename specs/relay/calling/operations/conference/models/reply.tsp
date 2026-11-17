import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Conference joined")
model JoinConferenceResult {
  ...RelayResultWithCall<"Joining conference">;
}

@summary("Conference left")
model LeaveConferenceResult {
  ...RelayResultWithCall<"Leaving conference">;
}
