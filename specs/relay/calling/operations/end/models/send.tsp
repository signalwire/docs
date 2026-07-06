import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model EndParams {
  ...CallAddress;

  @doc("Why the call is ending. Defaults to `hangup` (a normal end).")
  @example("hangup")
  reason?: CallEndReason = "hangup";
}
