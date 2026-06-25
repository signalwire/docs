import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model EchoParams {
  ...CallAddress;

  @doc("How long to keep echoing, in seconds. Effective range 5–120; values outside this range are clamped. Default 60.")
  @minValue(0)
  timeout?: int32;

  @doc("An `http` or `https` URL to receive echo status updates.")
  status_url?: url;
}
