import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiHoldParams {
  ...CallAddress;

  /** How long to stay on hold, in seconds. Pass it as a string, e.g. `"60"`. */
  timeout?: string;

  /** What to play while on hold — a hold prompt or music, as a plain string. */
  prompt?: string;
}

model AiUnholdParams {
  ...CallAddress;

  /** Resume prompt (plain string). */
  prompt?: string;
}
