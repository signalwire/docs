import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model BindDigitParams {
  ...CallAddress;

  @doc("The DTMF digit sequence the caller must press to trigger this binding, e.g. `\"*1\"`.")
  digits: string;

  @doc("The call method to run when the digits are pressed, e.g. `calling.play`.")
  bind_method: string;

  @doc("Parameters to pass to `bind_method` when it runs. Use the same shape that method expects for its parameters.")
  params?: Record<unknown>;

  @doc("A label that groups this binding with others, so you can clear them together later.")
  realm?: string;

  @doc("How many times this binding can fire before it stops working. Use `0` for no limit.")
  @minValue(0)
  max_triggers?: int32;
}

model ClearDigitBindingsParams {
  ...CallAddress;

  @doc("Clear only the bindings with this `realm` label. Omit to clear every digit binding on the call.")
  realm?: string;
}
