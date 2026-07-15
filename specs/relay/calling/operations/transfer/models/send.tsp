import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Transfer parameters")
model TransferParams {
  ...CallAddress;

  @doc("""
    Where to hand off the call. Pass an `https://` URL that returns a SWML
    script, the name of another Relay application prefixed with `context:`, or an
    inline SWML script — either as a string or as a SWML object. The form is
    detected from the value: an `https://` URL is fetched for SWML, a `context:`
    prefix routes to a Relay application, and anything else is treated as inline
    SWML.
    """)
  @example("https://example.com/swml")
  dest: string | Record<unknown>;
}
