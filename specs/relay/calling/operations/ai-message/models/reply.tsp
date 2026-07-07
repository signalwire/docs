import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI message result")
@doc("Confirmation that the message was injected into the AI session.")
model AiMessageResult {
  ...RelayResultWithCall<"+OK">;
}
