import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TransferParams {
  ...CallAddress;

  @doc("""
    Where to hand off the call. Pass one of three forms in this single string:
    an `https://` URL that returns a SWML script, an inline SWML script, or the
    name of another RELAY application prefixed with `context:`. The form is
    detected from the prefix or scheme you use.
    """)
  dest: string;
}
