import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TransferParams {
  ...CallAddress;

  @doc("""
    Where to hand off the call. Pass an `https://` URL that returns a SWML
    script, the name of another RELAY application prefixed with `context:`, or an
    inline SWML script — either as a string or as a SWML object. The form is
    detected from the value you provide.
    """)
  @example("https://example.com/swml")
  dest: string | Record<unknown>;
}
