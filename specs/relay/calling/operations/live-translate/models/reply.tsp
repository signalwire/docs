import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Live translate result")
@doc("""
  Acknowledgement that the action was accepted. `message` is the raw status line
  (`"+OK\\n"`). If the action is invalid, `code` is `"400"` and `message` carries
  the error text.
  """)
model LiveTranslateResult {
  ...RelayResultWithCall<"+OK\n">;
}
