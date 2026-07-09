import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Disconnect parameters")
model DisconnectParams {
  ...CallAddress;

  @doc("Opaque reason for the disconnect, forwarded downstream. Treated as a free-form string.")
  @example("agent_ended")
  reason?: string;
}
