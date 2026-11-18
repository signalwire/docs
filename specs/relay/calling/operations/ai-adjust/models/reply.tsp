import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI adjust result")
@doc("""
  Confirmation that the settings were applied. `message` is the raw status line
  (`"+OK Success\\n"`). On failure `code` is `"400"` and `message` names the problem,
  e.g. `"-ERR attention_timeout error\\n"` for an out-of-range value or
  `"-ERR no recognized settings\\n"` when no supported key was sent.
  """)
model AiAdjustResult {
  ...RelayResultWithCall<"+OK Success\n">;
}
