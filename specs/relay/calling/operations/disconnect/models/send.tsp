import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Disconnect parameters")
model DisconnectParams {
  ...CallAddress;

  @doc("Free-form label describing why you are disconnecting the legs. SignalWire records it but does not interpret it.")
  @example("agent_ended")
  reason?: string;
}
