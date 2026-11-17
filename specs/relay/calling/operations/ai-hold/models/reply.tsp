import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI hold result")
@doc("""
  Confirmation that the AI session was put on hold. `message` is the raw status line
  (`"+OK Success\\n"`). If the call is already on hold, `code` is `"400"` with an
  `-ERR` message.
  """)
model AiHoldResult {
  ...RelayResultWithCall<"+OK Success\n">;
}

@summary("AI unhold result")
@doc("""
  Confirmation that the AI session was resumed from hold. `message` is the raw status
  line (`"+OK Success\\n"`). If the call is not on hold, `code` is `"400"` with an
  `-ERR` message.
  """)
model AiUnholdResult {
  ...RelayResultWithCall<"+OK Success\n">;
}
