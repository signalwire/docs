import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.raisehand`.")
@summary("Raise hand parameters")
model RaisehandParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to raise the hand of. Omit to act on yourself (`self`); set it to act on another member.")
  target?: Target;
}

@doc("Parameters for `call.lowerhand`.")
@summary("Lower hand parameters")
model LowerhandParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to lower the hand of. Omit to act on yourself (`self`); set it to act on another member.")
  target?: Target;
}
