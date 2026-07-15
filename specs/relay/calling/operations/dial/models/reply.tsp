import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Dial result")
model DialResult {
  ...RelayResultBase<"Dialing">;

  @doc("Per-destination results, present on partial failure — one entry per attempted destination, each with the destination and any `errors`. This is the per-destination breakdown; the top-level `data` array carries the same failures aggregated across devices.")
  message_data?: {
    @doc("The origin used for this destination.")
    from?: string;

    @doc("The destination attempted.")
    to?: string;

    @doc("Errors encountered dialing this destination.")
    errors?: unknown[];
  }[];
}
