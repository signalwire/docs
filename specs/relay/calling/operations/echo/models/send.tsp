import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model EchoParams {
  ...CallAddress;

  @doc("How long to keep echoing, in seconds. Values below 5 are raised to 5 and values above 120 are lowered to 120; fractions are truncated. Default 60.")
  @minValue(0)
  @example(30)
  timeout?: float64;

  @doc("HTTP(s) URL that echo status events are POSTed to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}
