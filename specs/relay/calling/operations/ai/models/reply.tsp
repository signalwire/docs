import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI result")
@doc("Confirmation that the AI session started.")
model AiResult {
  ...RelayResult<"AI started">;
}

@summary("AI stop result")
@doc("""
  Confirmation that the AI session was stopped. `message` is the raw status line,
  including the trailing newline (`"+OK\\n"`). On failure `code` is `"400"` and
  `message` carries the error text, e.g. `"-ERR call does not exist\\n"`.
  """)
model AiStopResult {
  ...RelayResult<"+OK\n">;
}
