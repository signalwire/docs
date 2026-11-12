import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI message result")
@doc("""
  Confirmation that the message was injected into the AI session. `message` is the
  raw status line (`"+OK Success\\n"`). If no AI session is running on the call,
  `code` is `"400"` with an `-ERR` message.
  """)
model AiMessageResult {
  ...RelayResultWithCall<"+OK Success\n">;
}
