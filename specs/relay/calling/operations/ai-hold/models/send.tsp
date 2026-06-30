import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiHoldParams {
  ...CallAddress;

  @doc("How long to stay on hold. Accepts a duration string such as `\"5m\"` or a number of seconds such as `\"60\"`. Defaults to 300 seconds; values of `0` or below, or above 300, are clamped to 300.")
  timeout?: string;

  @doc("What to play while on hold — a hold prompt or music, as a plain string.")
  prompt?: string;
}

model AiUnholdParams {
  ...CallAddress;

  @doc("Resume prompt (plain string).")
  prompt?: string;
}
