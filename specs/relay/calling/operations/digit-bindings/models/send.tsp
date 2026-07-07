import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model BindDigitParams {
  ...CallAddress;

  @doc("The DTMF (touch-tone) digit sequence the caller must press to trigger this binding, e.g. `\"*1\"`. Accepts the characters `0`-`9`, `#`, `*`, `A`-`D`, and `w`/`W`.")
  @example("*1")
  digits: string;

  @doc("The call method to run when the digits are pressed, e.g. `calling.play`.")
  @example("calling.play")
  bind_method: string;

  @doc("Parameters to pass to `bind_method` when it runs. Use the same shape that method expects for its parameters.")
  params?: Record<unknown>;

  @doc("A label that groups this binding with others, so you can clear them together later. Defaults to `\"default\"`.")
  @example("menu")
  realm?: string;

  @doc("How many times this binding can fire before it stops working. Omit for no limit.")
  @minValue(1)
  @example(3)
  max_triggers?: int32;
}

model ClearDigitBindingsParams {
  ...CallAddress;

  @doc("The `realm` label whose bindings to clear. Omit to clear only the default realm (`\"default\"`), or set to `\"all\"` to clear every realm's bindings on the call.")
  @example("menu")
  realm?: string;
}
