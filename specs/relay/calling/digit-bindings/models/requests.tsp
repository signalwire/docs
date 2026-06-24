import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model BindDigitParams {
  ...CallAddress;

  /** The DTMF digit sequence the caller must press to trigger this binding, e.g. `"*1"`. */
  digits: string;

  /** The call method to run when the digits are pressed, e.g. `calling.play`. */
  bind_method: string;

  /** Parameters to pass to `bind_method` when it runs. Use the same shape that method expects for its parameters. */
  params?: Record<unknown>;

  /** A label that groups this binding with others, so you can clear them together later. */
  realm?: string;

  /** How many times this binding can fire before it stops working. Use `0` for no limit. */
  @minValue(0)
  max_triggers?: int32;
}

model ClearDigitBindingsParams {
  ...CallAddress;

  /** Clear only the bindings with this `realm` label. Omit to clear every digit binding on the call. */
  realm?: string;
}
