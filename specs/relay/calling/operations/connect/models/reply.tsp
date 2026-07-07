import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Connect result")
model ConnectResult {
  ...RelayResultBase<"Connecting call">;

  @doc("Per-destination results, present on partial failure — one entry per attempted destination, each with the destination and any `errors`.")
  message_data?: {
    @doc("The origin used for this destination.")
    from?: string;

    @doc("The destination attempted.")
    to?: string;

    @doc("Errors encountered connecting this destination.")
    errors?: unknown[];
  }[];
}
