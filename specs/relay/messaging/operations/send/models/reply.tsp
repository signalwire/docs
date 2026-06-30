import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

model SendResult {
  ...Result;

  @doc("The ID of the accepted message, returned when the send succeeds. Use it to match up later state events.")
  message_id: string;
}
