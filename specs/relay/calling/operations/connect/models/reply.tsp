import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Connect result")
model ConnectResult {
  ...RelayResultBase<"Connecting call">;

  @doc("""
    Per-destination failures, one entry per destination that could not be connected.
    Present when some destinations failed even though the request succeeded (`code`
    `"200"`), and on failures such as `"400"` "No valid devices" (the array may be
    empty when the request failed before any destination was tried).
    """)
  message_data?: {
    @doc("The origin used for this destination.")
    from?: string;

    @doc("The destination attempted.")
    to?: string;

    @doc("""
      Why this destination failed. Either a string (for example `"Too many devices"`)
      or an object describing the errors, typically mapping a field name to a list of
      messages, for example
      `{"to": ["The configured SIP Endpoint is not registered."]}`.
      """)
    errors?: string | Record<unknown>;
  }[];
}
