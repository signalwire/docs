import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("Confirms that SignalWire received and forwarded your Verto frame.")
model MessageResult {
  ...Result;
}
