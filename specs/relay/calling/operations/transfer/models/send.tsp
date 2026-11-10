import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Transfer parameters")
model TransferParams {
  ...CallAddress;

  @doc("""
    The SWML to hand the call to, as a string: an `https://` URL that returns a SWML
    document, or an inline SWML document serialized as a JSON string. The destination
    is checked only when it runs, so the request succeeds even if the URL or script
    turns out to be invalid.
    """)
  @example("https://example.com/swml")
  dest: string;
}
